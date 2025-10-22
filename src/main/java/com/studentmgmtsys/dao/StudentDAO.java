package com.studentmgmtsys.dao;

import com.studentmgmtsys.model.Student;
import java.sql.*;

public class StudentDAO {
    public void addStudent(Student student) throws Exception {
        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO students(user_id, registration_no, department, semester, admission_year, status) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, student.getUserId());
            ps.setString(2, student.getRegistrationNo());
            ps.setString(3, student.getDepartment());
            ps.setInt(4, student.getSemester());
            ps.setInt(5, student.getAdmissionYear());
            ps.setString(6, student.getStatus());

            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
        }
    }


}
