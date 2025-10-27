package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.Complain;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComplainDAO {
    
    // Add new complaint (for students)
    public boolean addComplain(Complain complain) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO complain (title, description, user_id) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, complain.getTitle());
            ps.setString(2, complain.getDescription());
            ps.setInt(3, complain.getUserId());
            
            int result = ps.executeUpdate();
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("Error adding complaint: " + e.getMessage());
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
    
    // Get all complaints (for admin)
    public List<Complain> getAllComplaints() {
        List<Complain> list = new ArrayList<>();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        System.out.println("ComplainDAO: Getting all complaints");
        
        try {
            con = DBConnection.getConnection();
            System.out.println("Database connection established");
            
            String sql = "SELECT c.*, l.username FROM complain c " +
                        "LEFT JOIN login l ON c.user_id = l.user_id " +
                        "ORDER BY c.id DESC";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            
            while (rs.next()) {
                Complain complain = new Complain();
                complain.setId(rs.getInt("id"));
                complain.setTitle(rs.getString("title"));
                complain.setDescription(rs.getString("description"));
                complain.setStatus(rs.getString("status"));
                complain.setUserId(rs.getInt("user_id"));
                complain.setCreatedDate(rs.getString("created_date"));
                list.add(complain);
                System.out.println("Loaded complaint: " + complain.getTitle());
            }
            
            System.out.println("Total complaints loaded: " + list.size());
            
        } catch (Exception e) {
            System.out.println("Error getting all complaints: " + e.getMessage());
            e.printStackTrace();
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
    
    // Get complaints by user ID (for students to see their own)
    public List<Complain> getComplaintsByUserId(int userId) {
        List<Complain> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        System.out.println("ComplainDAO: Getting complaints for user ID: " + userId);
        
        try {
            con = DBConnection.getConnection();
            System.out.println("Database connection established");
            
            String sql = "SELECT * FROM complain WHERE user_id = ? ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Complain complain = new Complain();
                complain.setId(rs.getInt("id"));
                complain.setTitle(rs.getString("title"));
                complain.setDescription(rs.getString("description"));
                complain.setStatus(rs.getString("status"));
                complain.setUserId(rs.getInt("user_id"));
                complain.setCreatedDate(rs.getString("created_date"));
                list.add(complain);
                System.out.println("Loaded user complaint: " + complain.getTitle());
            }
            
            System.out.println("Total complaints for user " + userId + ": " + list.size());
            
        } catch (Exception e) {
            System.out.println("Error getting complaints by user ID: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        
        return list;
    }
    
    // Update complaint status to complete (for admin)
    public boolean markAsComplete(int complainId) {
        Connection con = null;
        PreparedStatement ps = null;
        
        System.out.println("ComplainDAO: Marking complaint " + complainId + " as complete");
        
        try {
            con = DBConnection.getConnection();
            System.out.println("Database connection established for update");
            
            String sql = "UPDATE complain SET status = 'complete' WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, complainId);
            
            int result = ps.executeUpdate();
            System.out.println("Update query executed, rows affected: " + result);
            
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("Error updating complaint status: " + e.getMessage());
            e.printStackTrace();
            return false;
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