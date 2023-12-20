CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(129) NOT NULL,
    `school_id` INT NOT NULL UNSIGNED,
    `company_id` INT NOT NULL UNSIGNED,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` VARCHAR(20) ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year_founded` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `industry` VARCHAR(32) ENUM('Technology', 'Education', 'Business') NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_people` (
    `id` INT AUTO_INCREMENT,
    `user_id1` INT UNSIGNED,
    `user_id2` INT UNSIGNED,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id1`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_id2`) REFERENCES `users`(`id`)
);

CREATE TABLE `connections_schools` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `school_start_date` DATE NOT NULL,
    `school_end_date` DATE NOT NULL,
    `degree_type` VARCHAR(6) ENUM('BA', 'BS', 'MA', 'PhD', 'other')) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `connections_companies` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `company_start_date` DATE NOT NULL,
    `company_end_date` DATE NOT NULL,
    `title` VARCHAR(48) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
