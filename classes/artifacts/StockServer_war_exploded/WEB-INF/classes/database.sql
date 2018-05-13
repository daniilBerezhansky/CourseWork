-- Table: users
CREATE TABLE users (
  id     SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);


-- Table: roles
CREATE TABLE roles (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);


-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  userId INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (userId) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (userId, role_id)
);


-- Insert data

INSERT INTO users VALUES (1, 'Creator', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);
------------------------------------
SELECT email FROM users WHERE id > 10;
-------------------------------------
ALTER TABLE stock ADD COLUMN  category VARCHAR(255) NOT NULL DEFAULT 'none';
-------------------------------------
CREATE TABLE categories(
  id SERIAL PRIMARY KEY,
  food BOOLEAN NOT NULL  DEFAULT FALSE ,
  household_items BOOLEAN NOT NULL  DEFAULT FALSE,
  clothes BOOLEAN NOT NULL DEFAULT FALSE ,
  appliances BOOLEAN NOT NULL DEFAULT FALSE,
  userId INT NOT NULL
);
---------------------------------------------
DROP TABLE categories;

SELECT users.email
FROM users
INNER JOIN categories ON users.id = categories.user_id
WHERE clothes = TRUE AND users.id > 10;
--------------------------------------------------
CREATE TABLE category_name(
  id SERIAL PRIMARY KEY,
  category VARCHAR(255) NOT NULL
);

-----------------------------------------------------
SELECT  * FROM  categories WHERE categories.user_id = 150;
-----------------------------------------------------
