-- ============================================================
-- Square QBank — Bootstrap the first admin account
-- Creates / repairs the "admin" account (username: admin).
--
-- The app signs in with  <username>@squareqbank.local , so the admin
-- logs in with username "admin". This cannot go through
-- admin_create_student() because that requires an existing admin —
-- so we insert the auth user directly (same pattern as 004).
--
-- SECURITY: set the password below before running. Replace the
-- __SET_ADMIN_PASSWORD__ placeholder (both occurrences) with a strong
-- secret — do NOT commit a real password to the repo.
--
-- Run in the Supabase SQL Editor AFTER 001_schema.sql and 004_fix_create_student.sql.
-- Safe to re-run: it resets the password and re-asserts the admin role.
-- ============================================================

do $$
declare
  v_email   text := 'admin@squareqbank.local';
  v_user_id uuid;
begin
  select id into v_user_id from auth.users where email = v_email;

  if v_user_id is null then
    -- Create a fresh, already-confirmed auth user.
    v_user_id := gen_random_uuid();

    insert into auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, last_sign_in_at,
      raw_app_meta_data, raw_user_meta_data,
      is_super_admin, created_at, updated_at,
      confirmation_token, recovery_token, email_change_token_new, email_change
    ) values (
      '00000000-0000-0000-0000-000000000000',
      v_user_id, 'authenticated', 'authenticated', v_email,
      crypt('__SET_ADMIN_PASSWORD__', gen_salt('bf')),
      now(), now(),
      '{"provider":"email","providers":["email"]}'::jsonb,
      jsonb_build_object('username', 'admin', 'full_name', 'Administrator', 'role', 'admin'),
      false, now(), now(), '', '', '', ''
    );
  else
    -- User already exists — make sure the password is known and the email is confirmed.
    update auth.users
    set encrypted_password = crypt('__SET_ADMIN_PASSWORD__', gen_salt('bf')),
        email_confirmed_at = coalesce(email_confirmed_at, now()),
        updated_at         = now()
    where id = v_user_id;
  end if;

  -- Ensure an email identity exists (required by recent GoTrue versions for
  -- password sign-in). Guarded so older schemas without provider_id still pass.
  begin
    if not exists (
      select 1 from auth.identities
      where user_id = v_user_id and provider = 'email'
    ) then
      insert into auth.identities (
        provider_id, user_id, identity_data, provider,
        last_sign_in_at, created_at, updated_at
      ) values (
        v_user_id::text, v_user_id,
        jsonb_build_object('sub', v_user_id::text, 'email', v_email),
        'email', now(), now(), now()
      );
    end if;
  exception when others then
    -- Column set differs on this GoTrue version; password login still works
    -- without an explicit identity row (same as student accounts in 004).
    null;
  end;

  -- Ensure the profile exists and is promoted to admin.
  -- (The handle_new_user trigger normally creates it on insert above, but we
  --  upsert here to cover both the create and repair paths.)
  insert into public.profiles (id, username, full_name, role, is_active)
  values (v_user_id, 'admin', 'Administrator', 'admin', true)
  on conflict (id) do update
    set role       = 'admin',
        username   = 'admin',
        is_active  = true,
        updated_at = now();
end $$;
