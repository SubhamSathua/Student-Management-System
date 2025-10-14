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
            String sql = "SELECT * FROM all_courses";
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
}