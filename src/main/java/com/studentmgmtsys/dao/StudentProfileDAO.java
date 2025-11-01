package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.StudentProfile;
import com.studentmgmtsys.model.CompleteStudentProfile;

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
    
    // Get complete student profile from all three tables
    public CompleteStudentProfile getCompleteProfile(int userId) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        CompleteStudentProfile profile = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT " +
                        "l.user_id, l.username, l.role, l.status as login_status, " +
                        "s.student_id, s.registration_no, s.department, s.semester, s.admission_year, s.status as student_status, " +
                        "sp.profile_id, sp.full_name, sp.email, sp.phone, sp.address, sp.dob, sp.education, sp.profile_pic, " +
                        "sp.father_name, sp.father_mobile, sp.mother_name, sp.mother_mobile " +
                        "FROM login l " +
                        "LEFT JOIN students s ON l.user_id = s.user_id " +
                        "LEFT JOIN studentprofile sp ON l.user_id = sp.user_id " +
                        "WHERE l.user_id = ? AND l.role = 'student'";
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                profile = new CompleteStudentProfile();
                
                // Login table data
                profile.setUserId(rs.getInt("user_id"));
                profile.setUsername(rs.getString("username"));
                profile.setRole(rs.getString("role"));
                profile.setLoginStatus(rs.getString("login_status"));
                
                // Students table data
                profile.setStudentId(rs.getInt("student_id"));
                profile.setRegistrationNo(rs.getString("registration_no"));
                profile.setDepartment(rs.getString("department"));
                profile.setSemester(rs.getString("semester"));
                profile.setAdmissionYear(rs.getString("admission_year"));
                profile.setStudentStatus(rs.getString("student_status"));
                
                // StudentProfile table data
                profile.setProfileId(rs.getInt("profile_id"));
                profile.setFullName(rs.getString("full_name"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setAddress(rs.getString("address"));
                profile.setDob(rs.getString("dob"));
                profile.setEducation(rs.getString("education"));
                profile.setProfilePic(rs.getString("profile_pic"));
                profile.setFatherName(rs.getString("father_name"));
                profile.setFatherMobile(rs.getString("father_mobile"));
                profile.setMotherName(rs.getString("mother_name"));
                profile.setMotherMobile(rs.getString("mother_mobile"));
            }
            
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        
        return profile;
    }
    
    // Update student profile (simple update for studentprofile table)
    public boolean updateProfile(CompleteStudentProfile profile) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE studentprofile SET " +
                        "full_name = ?, email = ?, phone = ?, address = ?, dob = ?, education = ?, " +
                        "father_name = ?, father_mobile = ?, mother_name = ?, mother_mobile = ? " +
                        "WHERE user_id = ?";
            
            ps = con.prepareStatement(sql);
            ps.setString(1, profile.getFullName());
            ps.setString(2, profile.getEmail());
            ps.setString(3, profile.getPhone());
            ps.setString(4, profile.getAddress());
            ps.setString(5, profile.getDob());
            ps.setString(6, profile.getEducation());
            ps.setString(7, profile.getFatherName());
            ps.setString(8, profile.getFatherMobile());
            ps.setString(9, profile.getMotherName());
            ps.setString(10, profile.getMotherMobile());
            ps.setInt(11, profile.getUserId());
            
            int result = ps.executeUpdate();
            return result > 0;
            
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
