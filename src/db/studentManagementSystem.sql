create database studentmanagementsystem;
use studentmanagementsystem;

-- login
create table login (
    user_id int auto_increment primary key,
    username varchar(50) not null unique,
    password varchar(255) not null,
    role varchar(40) not null,
    status varchar(40) default 'active'
);

insert into login (username, password, role, status)
values
('admin', '123', 'admin', 'active'),
('manager', '123', 'manager', 'active'),
('stud23101', '123', 'student', 'active'),
('teacher01', '123', 'teacher', 'active');

select * from login;

-- students
create table students (
    student_id int auto_increment primary key,
    user_id int not null,
    registration_no varchar(30) not null,
    department varchar(50) not null,
    semester varchar(10),
    admission_year varchar(10),
    status varchar(20) default 'active',
    foreign key (user_id) references login(user_id)
);

-- studentprofile
create table studentprofile (
    profile_id int auto_increment primary key,
    user_id int not null,
    full_name varchar(100) not null,
    email varchar(100) not null,
    phone varchar(15),
    address text,
    dob varchar(10),
    education varchar(100),
    profile_pic varchar(255),
    father_name varchar(100),
    father_mobile varchar(15),
    mother_name varchar(100),
    mother_mobile varchar(15),
    foreign key (user_id) references login(user_id)
);

insert into studentprofile (user_id, full_name, email, phone, address, dob, education, father_name, father_mobile, mother_name, mother_mobile) values(3, 'Chandra Chuda', 'chandra@gmail.com', '9876543210', 'kendrapada', '2002-05-10', 'bca', 'ram chuda', '9876543000', 'sita chuda', '9998887776');
select * from studentprofile;
drop table studentprofile;

-- teacherprofile
create table teacherprofile (
    profile_id int auto_increment primary key,
    user_id int not null,
    full_name varchar(100) not null,
    email varchar(100) not null,
    phone varchar(15),
    department varchar(50),
    experience varchar(100),
    education varchar(100),
    profile_pic varchar(255),
    status varchar(20) default 'active',
    foreign key (user_id) references login(user_id)
);
insert into teacherprofile (user_id, full_name, email, phone, department, experience, education)
values (3, 'Priya Sharma', 'priya@gmail.com', '9998887770', 'computer science', '5 years', 'm.tech');

-- all_courses
create table all_courses (
    course_id int auto_increment primary key,
    course_code varchar(20) not null,
    course_name varchar(100) not null,
    branch varchar(50) not null,
    semester int not null,
    credits int not null,
    status varchar(20) default 'active'
);

select * from all_courses;

-- DROP	
drop database studentmanagementsystem;
