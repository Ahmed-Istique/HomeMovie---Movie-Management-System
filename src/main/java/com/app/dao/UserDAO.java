package com.app.dao;

import com.app.models.User;
import com.app.utils.DBConnection;

import java.sql.*;

public class UserDAO {

    public User authenticate(String email, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getBoolean("is_admin"),
                    rs.getString("photo_url"),
                    rs.getString("about"),
                    rs.getString("country")
                );
            }
            return null;
        }
    }

    public boolean register(User user) throws SQLException {
        if (user.getEmail().equalsIgnoreCase("admin@qq.com")) {
            return false; // Prevent admin re-registration
        }

        String sql = "INSERT INTO users (name, email, password, is_admin, photo_url, about, country) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setBoolean(4, false); // Always false for normal users
            stmt.setString(5, user.getPhotoUrl());
            stmt.setString(6, user.getAbout());
            stmt.setString(7, user.getCountry());
            return stmt.executeUpdate() > 0;
        }
    }
}