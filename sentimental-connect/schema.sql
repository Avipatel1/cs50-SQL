DROP TABLE IF EXISTS `connections`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `schools`;
DROP TABLE IF EXISTS `companies`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT,
    `firstname` VARCHAR(100),
    `lastname` VARCHAR(100),
    `username` VARCHAR(100),
    `password` VARCHAR(100),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `year` SMALLINT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `connections` (
    `id` INT AUTO_INCREMENT,
    `user_id_A` INT UNIQUE NOT NULL,
    `user_id_B` INT UNIQUE,
    `school_id` INT UNIQUE,
    `company_id` INT UNIQUE,
    `school_start_date` DATETIME,
    `school_end_date` DATETIME,
    `company_start_date` DATETIME,
    `company_end_date` DATETIME,
    `degree_type` ENUM('BA', 'MA', 'PhD'),
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user_id_A`) REFERENCES `users`(`id`),
    FOREIGN KEY (`user_id_B`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);


INSERT INTO `users` (firstname, lastname, username, password)
VALUES ('Claudine', 'Gay', 'claudine', 'password');

INSERT INTO `users` (firstname, lastname, username, password)
VALUES ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO `schools` (name, type, location, year)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, MA', 1636);

INSERT INTO `companies` (name, industry, location)
VALUES ('LinkedIn', 'Technology', 'California, CA');

INSERT INTO `connections` (user_id_A, user_id_B, school_id, company_id, school_start_date, school_end_date, company_start_date, company_end_date, degree_type)
VALUES (1, NULL, 1, NULL, '1993-01-01', '1998-12-31', NULL, NULL, 'PhD');

INSERT INTO `connections` (user_id_A, user_id_B, school_id, company_id, school_start_date, school_end_date, company_start_date, company_end_date, degree_type)
VALUES (2, NULL, NULL, 1, NULL, NULL, '2003-01-01', '2007-02-01', NULL);
