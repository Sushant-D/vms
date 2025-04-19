package com.islington.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/vms";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }
}