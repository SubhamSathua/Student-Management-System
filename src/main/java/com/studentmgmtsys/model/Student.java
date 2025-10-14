package com.studentmgmtsys.model;

public class Student {
    private int studentId;
    private int userId;
    private String rollNo;
    private String registrationNo;
    private String department;
    private int semester;
    private int admissionYear;
    private String status;


    public Student() {
        super();
    }


    public Student(int studentId,
                   int userId,
                   String rollNo,
                   String registrationNo,
                   String department,
                   int semester,
                   int admissionYear,
                   String status) {
        super();
        this.studentId = studentId;
        this.userId = userId;
        this.rollNo = rollNo;
        this.registrationNo = registrationNo;
        this.department = department;
        this.semester = semester;
        this.admissionYear = admissionYear;
        this.status = status;
    }


    public Student(int userId,
                   String rollNo,
                   String registrationNo,
                   String department,
                   int semester,
                   int admissionYear,
                   String status) {
        super();
        this.userId = userId;
        this.rollNo = rollNo;
        this.registrationNo = registrationNo;
        this.department = department;
        this.semester = semester;
        this.admissionYear = admissionYear;
        this.status = status;
    }

    public int getStudentId() {
        return studentId;
    }
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRollNo() {
        return rollNo;
    }
    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }
    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }

    public int getSemester() {
        return semester;
    }
    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getAdmissionYear() {
        return admissionYear;
    }
    public void setAdmissionYear(int admissionYear) {
        this.admissionYear = admissionYear;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
