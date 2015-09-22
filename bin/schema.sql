CREATE DATABASE airgrad;

USE airgrad;

CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(50) NOT NULL,
	`password` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `classes` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`course` varchar(80) NOT NULL,
	`url` TEXT NOT NULL,
	`provider_id` INT,
	`university_id` INT,
	`category_id` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `schedules` (
	`user_id` INT NOT NULL,
	`class_id` INT NOT NULL,
	`complete` tinyint NOT NULL DEFAULT '0'
);

CREATE TABLE `providers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`provider` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `universities` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`university` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `prereqs` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`prereq` varchar(80) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`category` varchar(80) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `classes/prereqs` (
	`class_id` INT NOT NULL,
	`prereq_id` INT NOT NULL
);

CREATE TABLE `users/prereqs` (
	`user_id` INT NOT NULL,
	`prereq_id` INT NOT NULL,
	`complete` tinyint NOT NULL DEFAULT '0'
);

ALTER TABLE `classes` ADD CONSTRAINT `classes_fk0` FOREIGN KEY (`provider_id`) REFERENCES `providers`(`id`);

ALTER TABLE `classes` ADD CONSTRAINT `classes_fk1` FOREIGN KEY (`university_id`) REFERENCES `universities`(`id`);

ALTER TABLE `classes` ADD CONSTRAINT `classes_fk2` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);

ALTER TABLE `schedules` ADD CONSTRAINT `schedules_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `schedules` ADD CONSTRAINT `schedules_fk1` FOREIGN KEY (`class_id`) REFERENCES `classes`(`id`);

ALTER TABLE `classes/prereqs` ADD CONSTRAINT `classes/prereqs_fk0` FOREIGN KEY (`class_id`) REFERENCES `classes`(`id`);

ALTER TABLE `classes/prereqs` ADD CONSTRAINT `classes/prereqs_fk1` FOREIGN KEY (`prereq_id`) REFERENCES `prereqs`(`id`);

ALTER TABLE `users/prereqs` ADD CONSTRAINT `users/prereqs_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `users/prereqs` ADD CONSTRAINT `users/prereqs_fk1` FOREIGN KEY (`prereq_id`) REFERENCES `prereqs`(`id`);

