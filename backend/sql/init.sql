-- Initial setup for SQL server

CREATE DATABASE IF NOT EXISTS teknet;
USE teknet;

CREATE TABLE IF NOT EXISTS `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `hashed_password` CHAR(60) NOT NULL,
    `teknet_address` VARCHAR(255) NOT NULL UNIQUE,
    `birthday` DATE NOT NULL,
    `account_created` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
);

-- If the length of the text content is longer than 255 chars then store first 255
-- and give hash, otherwise just store in mySQL and dont hash
CREATE TABLE IF NOT EXISTS `texts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `length` BIGINT UNSIGNED NOT NULL,
    `content` VARCHAR(255) NOT NULL,
    `hash` CHAR(64),
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS images (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(128),
    `hash` CHAR(64),
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS posts (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `text_id` BIGINT UNSIGNED NOT NULL,
    `image_id` BIGINT UNSIGNED,
    `posted` DATE NOT NULL,
    `title` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`text_id`) REFERENCES texts(`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (`image_id`) REFERENCES images(`id`) ON DELETE SET NULL ON UPDATE CASCADE
);
