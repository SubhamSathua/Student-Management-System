package com.studentmgmtsys.dao;



import com.studentmgmtsys.model.StudentProfile;
import java.sql.*;


public class StudentProfileDAO {

    private Connection getConnection() throws Exception {
        return DBConnection.getConnection();
    }


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
                student.setDob(rs.getDate("dob"));
                student.setEducation(rs.getString("education"));
            }

        }  catch (Exception e) {
            e.printStackTrace();
        }



        return student;
    }
}
