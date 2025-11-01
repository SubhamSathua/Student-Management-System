package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.User;
import java.sql.*;

public class UserDAO {


    public User validateUser(String username, String password) {
        String role = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement("SELECT role, user_id FROM login WHERE username=? AND password=? AND status='active'");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
//                role = rs.getString("role");
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return user;
    }
    
    public boolean isUsernameExists(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement("SELECT username FROM login WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            return rs.next(); // Returns true if username exists
            
        } catch (Exception e) {
            System.out.println("Error checking username: " + e.getMessage());
            return false;
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

    public int registerUser(User user) throws Exception {
        Connection con = DBConnection.getConnection();
        int userId = -1;
        String sql = "INSERT INTO login(username, password, role, status) VALUES (?, ?, ?, ?)";

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getRole());
            ps.setString(4, user.getStatus());
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                userId = rs.getInt(1);
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        }

        return userId;
    }
}
