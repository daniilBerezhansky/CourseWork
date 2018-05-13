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


create table product (
  product_id SERIAL PRIMARY KEY,
  Name varchar(255) not null,
  description varchar(255) not null,
  quantity INTEGER NOT NULL ,
  price double precision not null,
  image VARCHAR(255) NOT NULL
);

CREATE TABLE cart(
  id SERIAL PRIMARY KEY,
  product_id INTEGER,
  user_id INTEGER,
  amount INTEGER
);
