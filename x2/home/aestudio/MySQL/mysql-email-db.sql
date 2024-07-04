-- Create table for storing virtual domains
CREATE TABLE `virtual_domains` (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Create table for storing virtual users
CREATE TABLE `virtual_users` (
    id int(11) NOT NULL AUTO_INCREMENT,
    domain_id INT(11) NOT NULL,
    user VARCHAR(40) NOT NULL,
    password VARCHAR(32) NOT NULL,
    CONSTRAINT UNIQUE_EMAIL UNIQUE (domain_id, user),
    FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Create table for storing virtual aliases
CREATE TABLE `virtual_aliases` (
    id INT(11) NOT NULL AUTO_INCREMENT,
    domain_id INT(11) NOT NULL,
    source VARCHAR(40) NOT NULL,
    destination VARCHAR(80) NOT NULL,
    FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Add quota columns to virtual_users table
ALTER TABLE `virtual_users` ADD `quota_kb`
INT NOT NULL,
ADD `quota_messages` INT NOT NULL ;

-- Create view to display users' email addresses
CREATE VIEW view_users AS
SELECT
    CONCAT(virtual_users.user, '@', virtual_domains.name) AS email,
    virtual_users.password,
    virtual_users.quota_kb,
    virtual_users.quota_messages
FROM virtual_users
LEFT JOIN virtual_domains ON virtual_users.domain_id = virtual_domains.id;
