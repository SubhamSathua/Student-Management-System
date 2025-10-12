create database studentManagementSystem;
use studentManagementSystem;

-- Login
CREATE TABLE login (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin','manager','student','teacher') NOT NULL,
    status ENUM('active','inactive') DEFAULT 'active'
);

INSERT INTO login (username, password, role, status)
VALUES 
('admin', '123', 'admin', 'active'),
('manager', '123', 'manager', 'active');

select * from login;

-- All User Profile
CREATE TABLE useProfile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    dob DATE,
    education VARCHAR(100),
    experience VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);



-- DANGER ZONE
drop database studentManagementSystem;
