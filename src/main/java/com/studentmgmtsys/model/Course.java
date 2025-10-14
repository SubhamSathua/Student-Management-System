package com.studentmgmtsys.model;


public class Course {
    private int courseId;
    private String courseCode;
    private String courseName;
    private String branch;
    private int semester;
    private int credits;
    private String status;

    public Course() {

    }


    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public String getCourseCode() { return courseCode; }
    public void setCourseCode(String courseCode) { this.courseCode = courseCode; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public int getSemester() { return semester; }
    public void setSemester(int semester) { this.semester = semester; }

    public int getCredits() { return credits; }
    public void setCredits(int credits) { this.credits = credits; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Course(int courseId, String courseCode, String courseName, String branch, int semester, int credits, String status) {
        this.courseId = courseId;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.branch = branch;
        this.semester = semester;
        this.credits = credits;
        this.status = status;
    }
}
