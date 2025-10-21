package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.User;
import java.sql.*;

public class UserDAO {


    public String validateUser(String username, String password) {
        String role = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement("SELECT role FROM login WHERE username=? AND password=? AND status='active'");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
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
        return role;
    }

    public int insertUser(String username, String password, String role, String status, Connection con) throws SQLException {
        String sql = "INSERT INTO login (username, password, role, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.setString(4, status);

            int rows = ps.executeUpdate();
            if (rows == 0) throw new SQLException("User insert flaied...");

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    return keys.getInt(1);
                }
                throw new SQLException("User insert failed....");
            }
        }
    }


    public boolean usernameExists(String username) {
        String sql = "SELECT 1 FROM login WHERE username = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }
}
