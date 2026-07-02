-- LocalEats: fix placeholder seed passwords
-- SQL Server (T-SQL)
--
-- Run this once against an EXISTING database that already has the
-- 'hashed_password_1'..'hashed_password_5' placeholder rows from the
-- old LocalEats_SeedData.sql. It replaces just those placeholders
-- with real ASP.NET Core Identity PasswordHasher<T> hashes for the
-- password "Password123!" so Login.cshtml.cs can verify them.
--
-- Only rows whose password still starts with 'hashed_password_' are
-- touched, so real users (e.g. Lindsey West, registered via the app)
-- are left completely alone.

UPDATE app_users SET password = 'AQAAAAIAAYagAAAAEKafhxXghoKWtnuN4xJmTA+hpiCwzDaHyhUvrQQWL0XzBgH0af/mD30Pjfm2Sg3bqg==' WHERE email = 'mickey.mouse@localeats.com' AND password LIKE 'hashed_password_%';
UPDATE app_users SET password = 'AQAAAAIAAYagAAAAEA8Mz4VTNg/CkuMrBrqaUEcfYxuOKoYv+4IRtMmg6tFR7F5QNvTyGjZwILirHbVTQA==' WHERE email = 'minnie.mouse@localeats.com' AND password LIKE 'hashed_password_%';
UPDATE app_users SET password = 'AQAAAAIAAYagAAAAENnrzd3lv7OAUQOY2QrKRnxzTPUjJsH7if7ONfAb92m+py1T8dxiwWUTi3KOylP4Xw==' WHERE email = 'donald.duck@localeats.com' AND password LIKE 'hashed_password_%';
UPDATE app_users SET password = 'AQAAAAIAAYagAAAAEEEmZ0UC0EYtzfuoxmgJkoS3ZksnRVOPYKw83ajeMk+TeTZpo3QEtlmkINsetiBivw==' WHERE email = 'goofy.goof@localeats.com' AND password LIKE 'hashed_password_%';
UPDATE app_users SET password = 'AQAAAAIAAYagAAAAEN1QYsbbx9rtJJTnJ33YIggWwQ6NsCFTuyo9ObTtcuyWWrPMvYbtGqrVCHOGrgm7Eg==' WHERE email = 'daisy.duck@localeats.com' AND password LIKE 'hashed_password_%';

SELECT full_name, email, password FROM app_users ORDER BY user_id;
