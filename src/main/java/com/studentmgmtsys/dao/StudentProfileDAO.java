package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.StudentProfile;

import java.sql.*;

public class StudentProfileDAO {

    public void addProfile(StudentProfile profile, int userId) throws Exception {
        Connection con = null;
        String sql = "INSERT INTO studentProfile(user_id, full_name, email, phone, address, dob, education, profile_pic, father_name, father_mobile, mother_name, mother_mobile) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, userId);
            ps.setString(2, profile.getFullName());
            ps.setString(3, profile.getEmail());
            ps.setString(4, profile.getPhone());
            ps.setString(5, profile.getAddress());
            ps.setString(6, profile.getDob());
            ps.setString(7, profile.getEducation());
            ps.setString(8, profile.getProfilePic());
            ps.setString(9, profile.getFatherName());
            ps.setString(10, profile.getFatherMobile());
            ps.setString(11, profile.getMotherName());
            ps.setString(12, profile.getMotherMobile());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
        }
    }
}
