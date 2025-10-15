package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.Student;
import java.sql.*;

public class StudentDAO {
    private final Connection con;
    public StudentDAO(Connection con) { this.con = con; }

    public int insert(Student s) throws SQLException {
        String sql = "INSERT INTO students (user_id, roll_no, registration_no, department, semester, admission_year, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, s.getUserId());
            ps.setString(2, s.getRollNo());
            ps.setString(3, s.getRegistrationNo());
            ps.setString(4, s.getDepartment());
            ps.setInt(5, s.getSemester());
            ps.setInt(6, s.getAdmissionYear());
            ps.setString(7, s.getStatus());
            if (ps.executeUpdate() == 0) throw new SQLException("No student row inserted");
            try (ResultSet k = ps.getGeneratedKeys()) {
                if (k.next()) return k.getInt(1);
                throw new SQLException("No student_id generated");
            }
        }
    }
}
