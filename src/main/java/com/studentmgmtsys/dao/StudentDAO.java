package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.Student;
import java.sql.*;

public class StudentDAO {


    public int insertStudent(int userId, String registrationNo, String department,
                             String semester, String admissionYear, String status, Connection con) throws SQLException {
        String sql = "INSERT INTO students (user_id, registration_no, department, semester, admission_year, status) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId);
            ps.setString(2, registrationNo);
            ps.setString(3, department);
            ps.setString(4, semester);
            ps.setString(5, admissionYear);
            ps.setString(6, status);

            int rows = ps.executeUpdate();
            if (rows == 0) throw new SQLException("Student insert flaied");

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    return keys.getInt(1);
                }
                throw new SQLException("Student insert failed.");
            }
        }
    }


}
