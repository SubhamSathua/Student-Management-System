package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.Course;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    public void addCourse(Course c) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO all_courses (course_code, course_name, branch, semester, credits, status) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, c.getCourseCode());
            ps.setString(2, c.getCourseName());
            ps.setString(3, c.getBranch());
            ps.setInt(4, c.getSemester());
            ps.setInt(5, c.getCredits());
            ps.setString(6, c.getStatus());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error adding course: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM all_courses ORDER BY CASE WHEN status = 'active' THEN 0 ELSE 1 END, course_id ASC";
            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setCourseCode(rs.getString("course_code"));
                c.setCourseName(rs.getString("course_name"));
                c.setBranch(rs.getString("branch"));
                c.setSemester(rs.getInt("semester"));
                c.setCredits(rs.getInt("credits"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println("Error fetching courses: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        return list;
    }

    public void updateCourseStatus(int courseId, String newStatus) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE all_courses SET status = ? WHERE course_id = ?";
            ps = con.prepareStatement(sql);

            ps.setString(1, newStatus);
            ps.setInt(2, courseId);

            int result = ps.executeUpdate();
            if (result == 0) {
                throw new Exception("Course not found with ID: " + courseId);
            }
        } catch (Exception e) {
            System.out.println("Error updating course status: " + e.getMessage());
            throw e;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    public String[] getStudentSemesterAndBranch(int userId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.getConnection();
            // Updated to use 'department' instead of 'branch' and handle semester as varchar
            String sql = "SELECT department, semester FROM students WHERE user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String department = rs.getString("department");
                String semester = rs.getString("semester");
                System.out.println("CourseDAO: Found student data - department: " + department + ", semester: " + semester);
                return new String[]{department, semester};
            } else {
                System.out.println("CourseDAO: No student found for user_id: " + userId);
            }
            return null;
        } catch (Exception e) {
            System.out.println("CourseDAO: Error in getStudentSemesterAndBranch: " + e.getMessage());
            throw e;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    public List<Course> getCoursesBySemesterAndBranch(int semester, String branch) throws Exception {
        List<Course> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM all_courses WHERE semester = ? AND branch = ? AND status = 'active' ORDER BY course_code";
            ps = con.prepareStatement(sql);
            ps.setInt(1, semester);
            ps.setString(2, branch);
            
            System.out.println("CourseDAO: Executing query for semester=" + semester + ", branch=" + branch);
            rs = ps.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setCourseCode(rs.getString("course_code"));
                c.setCourseName(rs.getString("course_name"));
                c.setBranch(rs.getString("branch"));
                c.setSemester(rs.getInt("semester"));
                c.setCredits(rs.getInt("credits"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
            System.out.println("CourseDAO: Found " + list.size() + " courses");
        } catch (Exception e) {
            System.out.println("CourseDAO: Error in getCoursesBySemesterAndBranch: " + e.getMessage());
            throw e;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        return list;
    }
    
    // Get courses with registration status using JOIN (your SQL example)
    public List<Course> getCoursesWithRegistration(String branch, int semester, int userId) throws Exception {
        List<Course> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT c.course_id, c.course_code, c.course_name, c.branch, c.semester, c.credits, c.status, " +
                        "IF(rc.user_id IS NULL, 0, 1) AS registered " +
                        "FROM all_courses c " +
                        "LEFT JOIN registered_course rc ON c.course_id = rc.course_id AND rc.user_id = ? " +
                        "WHERE c.branch = ? AND c.semester = ? AND c.status = 'active' " +
                        "ORDER BY c.course_code";
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, branch);
            ps.setInt(3, semester);
            
            System.out.println("CourseDAO: Executing JOIN query for userId=" + userId + ", branch=" + branch + ", semester=" + semester);
            rs = ps.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getInt("course_id"));
                c.setCourseCode(rs.getString("course_code"));
                c.setCourseName(rs.getString("course_name"));
                c.setBranch(rs.getString("branch"));
                c.setSemester(rs.getInt("semester"));
                c.setCredits(rs.getInt("credits"));
                c.setStatus(rs.getString("status"));
                c.setRegistered(rs.getInt("registered")); // 0 or 1
                list.add(c);
            }
            System.out.println("CourseDAO: Found " + list.size() + " courses with registration status");
        } catch (Exception e) {
            System.out.println("CourseDAO: Error in getCoursesWithRegistration: " + e.getMessage());
            throw e;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        return list;
    }
    
    // Simple method to register for course
    public boolean registerForCourse(int userId, int courseId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO registered_course (user_id, course_id) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            
            System.out.println("CourseDAO: Registering user " + userId + " for course " + courseId);
            int result = ps.executeUpdate();
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("CourseDAO: Error registering for course: " + e.getMessage());
            return false; // Probably duplicate registration
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}