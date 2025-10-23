package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.StudentProfile;

import javax.servlet.http.HttpServlet;
import java.sql.*;

public class StudentProfileServlet extends HttpServlet {

    private Connection getConnection() throws Exception {
        return DBConnection.getConnection();
    }

    // Method to get student profile by user_id
    public StudentProfile getStudentProfileByUserId(int userId) {
        StudentProfile student = null;
        String sql = "SELECT full_name, email, phone, address, dob, education " +
                "FROM studentProfile WHERE user_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                student = new StudentProfile();
                student.setFullName(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setAddress(rs.getString("address"));
                student.setDob(rs.getString("dob"));
                student.setEducation(rs.getString("education"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    // Method to insert student profile (for registration)
    public int insertProfile(int userId, String fullName, String email, String phone, Connection con) throws SQLException {
        // Only insert if at least one field is provided
        if ((fullName == null || fullName.trim().isEmpty()) &&
                (email == null || email.trim().isEmpty()) &&
                (phone == null || phone.trim().isEmpty())) {
            return 0; // Skip insert if all empty
        }

        String sql = "INSERT INTO studentProfile (user_id, full_name, email, phone) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId);
            ps.setString(2, fullName != null ? fullName : "");
            ps.setString(3, email != null ? email : "");
            ps.setString(4, phone != null ? phone : "");

            int rows = ps.executeUpdate();
            if (rows == 0) return 0;

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    return keys.getInt(1);
                }
                return 0;
            }
        }
    }
}
