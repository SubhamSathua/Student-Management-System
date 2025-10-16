package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.LoggedUser;
import com.studentmgmtsys.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; // Import SQLException

public class UserDAO {

    // User login method
    public LoggedUser validateUser(String username, String password) {
        String role = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        LoggedUser loggedUser = null;

        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement("SELECT user_id, role, status FROM login WHERE username=? AND password=?"); // Using 'login' table

            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                role = rs.getString("role");
                loggedUser = new LoggedUser();
                loggedUser.setUserId(rs.getInt("user_id"));
                loggedUser.setRole(rs.getString("role"));
                loggedUser.setStatus(rs.getString("status"));
                loggedUser.setUsername(username);
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

        return loggedUser;
    }

    public boolean registerUser(User newUser) {
        return false;
    }
}