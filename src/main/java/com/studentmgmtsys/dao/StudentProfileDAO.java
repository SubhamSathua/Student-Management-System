package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.StudentProfile;

import java.sql.*;

public class StudentProfileDAO {

    public void addProfile(StudentProfile profile, int userId) throws Exception {
        Connection con = DBConnection.getConnection();

        // Skip if all fields are empty
        boolean isEmpty = (profile.getFullName() == null || profile.getFullName().isEmpty()) &&
                (profile.getEmail() == null || profile.getEmail().isEmpty()) &&
                (profile.getPhone() == null || profile.getPhone().isEmpty());

        if (isEmpty) return;

        String sql = "INSERT INTO studentProfile(user_id, full_name, email, phone) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.setString(2, profile.getFullName() != null ? profile.getFullName() : "");
            ps.setString(3, profile.getEmail() != null ? profile.getEmail() : "");
            ps.setString(4, profile.getPhone() != null ? profile.getPhone() : "");
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
        }
    }


}
