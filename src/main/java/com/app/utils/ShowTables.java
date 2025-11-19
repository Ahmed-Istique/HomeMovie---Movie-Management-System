package com.app.utils;

import java.sql.*;

public class ShowTables {
    private static final String URL = "jdbc:derby:F:\\J2EE projects\\ebook\\MovieDBNew;create=true";
    private static final String USER = "app";
    private static final String PASS = "app";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
            DatabaseMetaData dbmd = conn.getMetaData();
            ResultSet rs = dbmd.getTables(null, null, null, new String[]{"TABLE"});
            System.out.println("📋 Tables in DB:");
            while (rs.next()) {
                System.out.println(" - " + rs.getString("TABLE_NAME"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
