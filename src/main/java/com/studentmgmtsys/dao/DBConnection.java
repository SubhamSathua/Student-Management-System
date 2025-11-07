package com.studentmgmtsys.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = Env.DB_URL;
    private static final String USER = Env.DB_USER;
    private static final String PASSWORD = Env.DB_PASSWORD;

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
