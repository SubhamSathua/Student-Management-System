package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.Fees;
import java.sql.*;

public class FeesDAO {
    
    // Get fees for student using user_id (session has user_id)
    public Fees getFeesByUserId(int userId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Fees fees = null;
        
        try {
            con = DBConnection.getConnection();
            // Use user_id as stud_id for simplicity
            String sql = "SELECT * FROM fees WHERE stud_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                fees = new Fees();
                fees.setId(rs.getInt("id"));
                fees.setStudId(rs.getInt("stud_id"));
                fees.setTransport(rs.getBoolean("transport"));
                fees.setSemister(rs.getBoolean("semister"));
                fees.setHostel(rs.getBoolean("hostel"));
                fees.setMisc(rs.getBoolean("misc"));
            } else {
                // Create new fees record if doesn't exist
                createFeesRecord(userId);
                // Try again
                rs = ps.executeQuery();
                if (rs.next()) {
                    fees = new Fees();
                    fees.setId(rs.getInt("id"));
                    fees.setStudId(rs.getInt("stud_id"));
                    fees.setTransport(rs.getBoolean("transport"));
                    fees.setSemister(rs.getBoolean("semister"));
                    fees.setHostel(rs.getBoolean("hostel"));
                    fees.setMisc(rs.getBoolean("misc"));
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error getting fees: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        
        return fees;
    }
    
    // Create fees record for new student
    private boolean createFeesRecord(int userId) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO fees (stud_id, transport, semister, hostel, misc) VALUES (?, FALSE, FALSE, FALSE, FALSE)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            
            int result = ps.executeUpdate();
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("Error creating fees record: " + e.getMessage());
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
    }
    
    // Update specific fee type to TRUE when student pays
    public boolean updateFee(int userId, String feeType) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            // Simple UPDATE query: UPDATE fees SET transport = TRUE WHERE stud_id = userId
            String sql = "UPDATE fees SET " + feeType + " = TRUE WHERE stud_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            
            int result = ps.executeUpdate();
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("Error updating fee: " + e.getMessage());
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
    }
}
