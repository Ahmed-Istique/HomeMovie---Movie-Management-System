package com.app.utils;

import java.io.File;
import java.sql.*;

public class SchemaFixer {

    // Use absolute path to the Derby DB folder
    private static final String URL = "jdbc:derby:F:\\J2EE projects\\ebook\\MovieDBNew";
    private static final String USER = "app";
    private static final String PASS = "app";

    public static void main(String[] args) {

        // Print the absolute path for debugging
        System.out.println("📁 Database absolute path: " + new File("F:\\J2EE projects\\ebook\\MovieDB").getAbsolutePath());

        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             Statement stmt = conn.createStatement()) {

            // Show which DB we're connected to
            System.out.println("🔗 Connected to DB: " + conn.getMetaData().getURL());

            // Try adding columns
            try {
                stmt.executeUpdate("ALTER TABLE USERS ADD photo_url VARCHAR(255)");
                System.out.println("✅ photo_url added");
            } catch (Exception e) {
                System.out.println("⚠️ photo_url already exists or cannot be added.");
            }

            try {
                stmt.executeUpdate("ALTER TABLE USERS ADD about VARCHAR(1000)");
                System.out.println("✅ about added");
            } catch (Exception e) {
                System.out.println("⚠️ about already exists or cannot be added.");
            }

            try {
                stmt.executeUpdate("ALTER TABLE USERS ADD country VARCHAR(100)");
                System.out.println("✅ country added");
            } catch (Exception e) {
                System.out.println("⚠️ country already exists or cannot be added.");
            }

            System.out.println("🎉 Schema update complete!");

            // 🧪 Show all columns in USERS table
            System.out.println("📋 Verifying USERS table structure...");
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet rs = meta.getColumns(null, null, "USERS", null);
            while (rs.next()) {
                String columnName = rs.getString("COLUMN_NAME");
                String type = rs.getString("TYPE_NAME");
                System.out.println(" - " + columnName + " (" + type + ")");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
