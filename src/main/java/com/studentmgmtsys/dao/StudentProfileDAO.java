//package com.studentmgmtsys.dao;
//
//import java.sql.*;
//
//public class StudentProfileDAO {
//
//
//    public int insertProfile(int userId, String fullName, String email, String phone, Connection con) throws SQLException {
//
//        if ((fullName == null || fullName.trim().isEmpty()) &&
//                (email == null || email.trim().isEmpty()) &&
//                (phone == null || phone.trim().isEmpty())) {
//            return 0;
//        }
//
//        String sql = "INSERT INTO studentProfile (user_id, full_name, email, phone) VALUES (?, ?, ?, ?)";
//        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
//            ps.setInt(1, userId);
//            ps.setString(2, fullName != null ? fullName : "");
//            ps.setString(3, email != null ? email : "");
//            ps.setString(4, phone != null ? phone : "");
//
//            int rows = ps.executeUpdate();
//            if (rows == 0) return 0;
//
//            try (ResultSet keys = ps.getGeneratedKeys()) {
//                if (keys.next()) {
//                    return keys.getInt(1);
//                }
//                return 0;
//            }
//        }
//    }
//
//
//}
