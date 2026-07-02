-- LocalEats Seed Data
-- SQL Server (T-SQL)
-- Run after LocalEats_Schema.sql

-- ============================================================
-- Guard: skip if data already exists
-- ============================================================
IF EXISTS (SELECT 1 FROM app_users)
BEGIN
    PRINT 'Seed data already present — skipping.';
    RETURN;
END;

BEGIN TRANSACTION;
BEGIN TRY

-- ============================================================
-- 1. Users — Disney characters
--
--    Password for every seeded user is: Password123!
--    Hashes below are real ASP.NET Core Identity PasswordHasher<T>
--    (v3, PBKDF2-HMAC-SHA256) output — NOT placeholder text — so
--    Login.cshtml.cs's VerifyHashedPassword call succeeds.
-- ============================================================
INSERT INTO app_users (full_name, email, phone, password) VALUES
    ('Mickey Mouse', 'mickey.mouse@localeats.com', '(407) 555-0101', 'AQAAAAIAAYagAAAAEKafhxXghoKWtnuN4xJmTA+hpiCwzDaHyhUvrQQWL0XzBgH0af/mD30Pjfm2Sg3bqg=='),
    ('Minnie Mouse', 'minnie.mouse@localeats.com', '(407) 555-0102', 'AQAAAAIAAYagAAAAEA8Mz4VTNg/CkuMrBrqaUEcfYxuOKoYv+4IRtMmg6tFR7F5QNvTyGjZwILirHbVTQA=='),
    ('Donald Duck',  'donald.duck@localeats.com',  '(407) 555-0103', 'AQAAAAIAAYagAAAAENnrzd3lv7OAUQOY2QrKRnxzTPUjJsH7if7ONfAb92m+py1T8dxiwWUTi3KOylP4Xw=='),
    ('Goofy Goof',   'goofy.goof@localeats.com',   '(407) 555-0104', 'AQAAAAIAAYagAAAAEEEmZ0UC0EYtzfuoxmgJkoS3ZksnRVOPYKw83ajeMk+TeTZpo3QEtlmkINsetiBivw=='),
    ('Daisy Duck',   'daisy.duck@localeats.com',   '(407) 555-0105', 'AQAAAAIAAYagAAAAEN1QYsbbx9rtJJTnJ33YIggWwQ6NsCFTuyo9ObTtcuyWWrPMvYbtGqrVCHOGrgm7Eg==');

-- ============================================================
-- 2. Menu Categories
-- ============================================================
INSERT INTO menu_categories (category_name, description) VALUES
    ('Appetizers',           'Small plates and starters to kick off your meal'),
    ('Soups & Salads',       'Fresh soups and crisp salads made daily'),
    ('Burgers & Sandwiches', 'Handcrafted burgers and sandwiches on artisan bread'),
    ('Main Entrees',         'Chef-selected signature dishes'),
    ('Desserts',             'House-made sweets and decadent finishes');

-- ============================================================
-- 3. Menu Items — 3 per category (15 total)
--    category_id: 1=Appetizers  2=Soups&Salads  3=Burgers
--                 4=Main Entrees  5=Desserts
-- ============================================================

-- Appetizers  → menu_item_id 1, 2, 3
INSERT INTO menu_items (item_name, item_description, price, image_url, category_id) VALUES
    ('Mozzarella Sticks',
     'Golden-fried mozzarella served with marinara dipping sauce',
     8.99, '/images/menu/mozzarella-sticks.jpg', 1),
    ('Buffalo Chicken Wings',
     'Crispy wings tossed in house buffalo sauce with blue cheese dip',
     13.99, '/images/menu/buffalo-wings.jpg', 1),
    ('Spinach Artichoke Dip',
     'Creamy spinach and artichoke hearts served with toasted pita chips',
     10.99, '/images/menu/spinach-dip.jpg', 1);

-- Soups & Salads  → menu_item_id 4, 5, 6
INSERT INTO menu_items (item_name, item_description, price, image_url, category_id) VALUES
    ('Tomato Bisque',
     'Velvety roasted tomato soup finished with a swirl of cream',
     7.99, '/images/menu/tomato-bisque.jpg', 2),
    ('Classic Caesar Salad',
     'Crisp romaine, shaved Parmesan, house-made croutons, and Caesar dressing',
     11.99, '/images/menu/caesar-salad.jpg', 2),
    ('French Onion Soup',
     'Slow-cooked caramelized onions in beef broth, topped with Gruyere crouton',
     9.99, '/images/menu/french-onion-soup.jpg', 2);

-- Burgers & Sandwiches  → menu_item_id 7, 8, 9
INSERT INTO menu_items (item_name, item_description, price, image_url, category_id) VALUES
    ('Classic Cheeseburger',
     'Half-pound beef patty, aged cheddar, lettuce, tomato, and house sauce on a brioche bun',
     14.99, '/images/menu/classic-cheeseburger.jpg', 3),
    ('BBQ Bacon Burger',
     'Smoked bacon, pepper jack, crispy onion strings, and smoky BBQ sauce',
     16.99, '/images/menu/bbq-bacon-burger.jpg', 3),
    ('Grilled Chicken Sandwich',
     'Marinated grilled chicken breast, avocado, arugula, and garlic aioli on ciabatta',
     14.49, '/images/menu/grilled-chicken-sandwich.jpg', 3);

-- Main Entrees  → menu_item_id 10, 11, 12
INSERT INTO menu_items (item_name, item_description, price, image_url, category_id) VALUES
    ('Grilled Atlantic Salmon',
     'Pan-seared salmon fillet with lemon-dill butter, seasonal vegetables, and wild rice',
     24.99, '/images/menu/grilled-salmon.jpg', 4),
    ('12 oz Ribeye Steak',
     'USDA Choice ribeye cooked to order with garlic mashed potatoes and asparagus',
     38.99, '/images/menu/ribeye-steak.jpg', 4),
    ('Pasta Primavera',
     'Penne tossed with fresh seasonal vegetables in a light garlic olive oil sauce',
     15.99, '/images/menu/pasta-primavera.jpg', 4);

-- Desserts  → menu_item_id 13, 14, 15
INSERT INTO menu_items (item_name, item_description, price, image_url, category_id) VALUES
    ('New York Cheesecake',
     'Classic dense cheesecake on a graham cracker crust with fresh berry compote',
     8.99, '/images/menu/cheesecake.jpg', 5),
    ('Chocolate Lava Cake',
     'Warm dark chocolate cake with a molten center, served with vanilla bean ice cream',
     9.99, '/images/menu/lava-cake.jpg', 5),
    ('Warm Apple Pie',
     'Flaky golden crust filled with cinnamon-spiced apples, served a la mode',
     8.49, '/images/menu/apple-pie.jpg', 5);

-- ============================================================
-- 4. Menu Access
--
--  user_id:     1=Mickey  2=Minnie  3=Donald  4=Goofy  5=Daisy
--  menu_item_id: 1-3  Appetizers
--                4-6  Soups & Salads
--                7-9  Burgers & Sandwiches
--               10-12  Main Entrees
--               13-15  Desserts
-- ============================================================

-- Mickey Mouse — one item from each category
INSERT INTO menu_access (user_id, menu_item_id, can_view) VALUES
    (1,  1, 1),   -- Mozzarella Sticks
    (1,  4, 1),   -- Tomato Bisque
    (1,  7, 1),   -- Classic Cheeseburger
    (1, 10, 1),   -- Grilled Atlantic Salmon
    (1, 13, 1);   -- New York Cheesecake

-- Minnie Mouse — second item from each category
INSERT INTO menu_access (user_id, menu_item_id, can_view) VALUES
    (2,  2, 1),   -- Buffalo Chicken Wings
    (2,  5, 1),   -- Classic Caesar Salad
    (2,  8, 1),   -- BBQ Bacon Burger
    (2, 11, 1),   -- 12 oz Ribeye Steak
    (2, 14, 1);   -- Chocolate Lava Cake

-- Donald Duck — third item from each category
INSERT INTO menu_access (user_id, menu_item_id, can_view) VALUES
    (3,  3, 1),   -- Spinach Artichoke Dip
    (3,  6, 1),   -- French Onion Soup
    (3,  9, 1),   -- Grilled Chicken Sandwich
    (3, 12, 1),   -- Pasta Primavera
    (3, 15, 1);   -- Warm Apple Pie

-- Goofy Goof — all appetizers, all main entrees, first dessert
INSERT INTO menu_access (user_id, menu_item_id, can_view) VALUES
    (4,  1, 1),   -- Mozzarella Sticks
    (4,  2, 1),   -- Buffalo Chicken Wings
    (4,  3, 1),   -- Spinach Artichoke Dip
    (4, 10, 1),   -- Grilled Atlantic Salmon
    (4, 11, 1),   -- 12 oz Ribeye Steak
    (4, 12, 1),   -- Pasta Primavera
    (4, 13, 1);   -- New York Cheesecake

-- Daisy Duck — all soups/salads, all burgers, last two desserts
INSERT INTO menu_access (user_id, menu_item_id, can_view) VALUES
    (5,  4, 1),   -- Tomato Bisque
    (5,  5, 1),   -- Classic Caesar Salad
    (5,  6, 1),   -- French Onion Soup
    (5,  7, 1),   -- Classic Cheeseburger
    (5,  8, 1),   -- BBQ Bacon Burger
    (5,  9, 1),   -- Grilled Chicken Sandwich
    (5, 14, 1),   -- Chocolate Lava Cake
    (5, 15, 1);   -- Warm Apple Pie

    COMMIT TRANSACTION;
    PRINT 'Seed data inserted successfully.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Seed insert failed: ' + ERROR_MESSAGE();
    THROW;
END CATCH;
