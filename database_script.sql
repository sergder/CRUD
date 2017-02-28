CREATE DATABASE IF NOT EXISTS test;

CREATE TABLE test.USER 
(
id int NOT NULL AUTO_INCREMENT,
name varchar(25) NOT NULL,
age int,
is_admin bit NOT NULL DEFAULT 0,
created_date timestamp NOT NULL DEFAULT NOW(),
PRIMARY KEY (id)
);

INSERT INTO test.USER (name, age, is_admin, created_date) VALUES
('Joseph Hoover', 30, 0, NOW()),
('Luke Charles', 28, 1, NOW()),
('Nicholas Ryan', 25, 0, NOW()),
('Magnus Holmes', 35, 0, NOW()),
('Clara Reeves', 21, 0, NOW()),
('Mark Craig', 42, 0, NOW()),
('Miranda Sullivan', 22, 0, NOW()),
('Willis Jenkins', 64, 0, NOW()),
('Maximillian Price', 19, 0, NOW()),
('Natalie Boone', 28, 1, NOW()),
('Kelley Lang', 23, 0, NOW()),user
('Jacob Pitts', 24, 0, NOW()),
('Edward Gilmore', 25, 0, NOW()),
('Peter Fisher', 23, 0, NOW()),
('Dennis Norris', 22, 0, NOW()),
('Griselda Carr', 29, 0, NOW()),
('Ambrose Mitchell', 31, 0, NOW()),
('Caroline Simmons', 33, 0, NOW()),
('Allison Lamb', 45, 0, NOW()),
('Phillip Stanley', 20, 0, NOW()),
('Lora Sims', 26, 0, NOW());