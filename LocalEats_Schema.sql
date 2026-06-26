-- LocalEats Menu System
-- SQL Server (T-SQL) Schema
-- Created: 2026-06-25

-- ============================================================
-- Table: app_users
-- ============================================================
CREATE TABLE app_users (
    user_id   INT           IDENTITY(1,1) NOT NULL,
    full_name VARCHAR(100)  NOT NULL,
    email     VARCHAR(255)  NOT NULL,
    phone     VARCHAR(20)       NULL,
    password  VARCHAR(255)  NOT NULL,

    CONSTRAINT PK_app_users        PRIMARY KEY (user_id),
    CONSTRAINT UQ_app_users_email  UNIQUE      (email)
);

-- ============================================================
-- Table: menu_categories
-- ============================================================
CREATE TABLE menu_categories (
    category_id   INT          IDENTITY(1,1) NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    description   VARCHAR(255)     NULL,

    CONSTRAINT PK_menu_categories      PRIMARY KEY (category_id),
    CONSTRAINT UQ_menu_categories_name UNIQUE      (category_name)
);

-- ============================================================
-- Table: menu_items
-- (depends on menu_categories)
-- ============================================================
CREATE TABLE menu_items (
    menu_item_id     INT            IDENTITY(1,1) NOT NULL,
    item_name        VARCHAR(100)   NOT NULL,
    item_description VARCHAR(255)       NULL,
    price            DECIMAL(10, 2) NOT NULL,
    image_url        VARCHAR(255)       NULL,
    category_id      INT            NOT NULL,

    CONSTRAINT PK_menu_items                 PRIMARY KEY (menu_item_id),
    CONSTRAINT FK_menu_items_menu_categories FOREIGN KEY (category_id)
        REFERENCES menu_categories (category_id)
);

-- ============================================================
-- Table: menu_access
-- (depends on app_users and menu_items)
-- ============================================================
CREATE TABLE menu_access (
    access_id    INT NOT NULL IDENTITY(1,1),
    user_id      INT NOT NULL,
    menu_item_id INT NOT NULL,
    can_view     BIT NOT NULL CONSTRAINT DF_menu_access_can_view DEFAULT (1),

    CONSTRAINT PK_menu_access            PRIMARY KEY (access_id),
    CONSTRAINT FK_menu_access_app_users  FOREIGN KEY (user_id)
        REFERENCES app_users  (user_id),
    CONSTRAINT FK_menu_access_menu_items FOREIGN KEY (menu_item_id)
        REFERENCES menu_items (menu_item_id),
    CONSTRAINT UQ_menu_access_user_item  UNIQUE      (user_id, menu_item_id)
);
