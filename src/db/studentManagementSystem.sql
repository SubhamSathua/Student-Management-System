create database studentManagementSystem;
use studentManagementSystem;

-- Login
CREATE TABLE login (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(40) NOT NULL,
    status VARCHAR(40) DEFAULT 'active'
);

INSERT INTO login (username, password, role, status)
VALUES 
('admin', '123', 'admin', 'active'),
('manager', '123', 'manager', 'active'),
('stud23101', '123', 'student', 'active'),
('teacher01', '123', 'teacher', 'active');

select * from login;

-- Students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    roll_no VARCHAR(20) NOT NULL,
    registration_no VARCHAR(30) NOT NULL,
    department VARCHAR(50) NOT NULL,
    semester VARCHAR(10),
    admission_year VARCHAR(10),
    status VARCHAR(20) DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES login(user_id)
);
-- studentProfile
CREATE TABLE studentProfile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    dob DATE,
    education VARCHAR(100),
    profile_pic VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES login(user_id)
);


-- teacherProfile
CREATE TABLE teacherProfile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    department VARCHAR(50),
    experience VARCHAR(100),
    education VARCHAR(100),
    profile_pic VARCHAR(255),
    status VARCHAR(20) DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES login(user_id)
);

-- all_courses
CREATE TABLE all_courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    branch VARCHAR(50) NOT NULL,
    semester INT NOT NULL,
    credits INT NOT NULL,
    status VARCHAR(20) DEFAULT 'active'
);
select * from all_courses;


-- DANGER ZONE
drop database studentManagementSystem;
