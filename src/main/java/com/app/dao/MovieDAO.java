package com.app.dao;

import com.app.models.Movie;
import com.app.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    // Add movie with created_by
    public boolean addMovie(Movie movie) throws SQLException {
        String sql = "INSERT INTO movies (title, director, screenwriter, actors, studio, genre, rating, poster_url, description, section, created_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, movie.getTitle());
            stmt.setString(2, movie.getDirector());
            stmt.setString(3, movie.getScreenwriter());
            stmt.setString(4, movie.getActors());
            stmt.setString(5, movie.getStudio());
            stmt.setString(6, movie.getGenre());
            stmt.setFloat(7, movie.getRating());
            stmt.setString(8, movie.getPosterUrl());
            stmt.setString(9, movie.getDescription());
            stmt.setString(10, movie.getSection());
            stmt.setInt(11, movie.getCreatedBy());  // new: set created_by
            return stmt.executeUpdate() > 0;
        }
    }

    // Update movie - usually you don't update created_by, so no change here
    public boolean updateMovie(Movie movie) throws SQLException {
        String sql = "UPDATE movies SET title = ?, director = ?, screenwriter = ?, actors = ?, studio = ?, genre = ?, rating = ?, poster_url = ?, description = ?, section = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, movie.getTitle());
            stmt.setString(2, movie.getDirector());
            stmt.setString(3, movie.getScreenwriter());
            stmt.setString(4, movie.getActors());
            stmt.setString(5, movie.getStudio());
            stmt.setString(6, movie.getGenre());
            stmt.setFloat(7, movie.getRating());
            stmt.setString(8, movie.getPosterUrl());
            stmt.setString(9, movie.getDescription());
            stmt.setString(10, movie.getSection());
            stmt.setInt(11, movie.getId());
            return stmt.executeUpdate() > 0;
        }
    }

    // Delete movie
    public boolean deleteMovie(int id) throws SQLException {
        String sql = "DELETE FROM movies WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    // Get movies by section
    public List<Movie> getMoviesBySection(String section) throws SQLException {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies WHERE section = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, section);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                movies.add(mapResultSetToMovie(rs));
            }
        }
        return movies;
    }

    // Get movie by ID
    public Movie getMovieById(int id) throws SQLException {
        String sql = "SELECT * FROM movies WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToMovie(rs);
            }
            return null;
        }
    }

    // Get all movies
    public List<Movie> getAllMovies() throws SQLException {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                movies.add(mapResultSetToMovie(rs));
            }
        }
        return movies;
    }

    // NEW: Get movies by user (created_by)
    public List<Movie> getMoviesByUserId(int userId) throws SQLException {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies WHERE created_by = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                movies.add(mapResultSetToMovie(rs));
            }
        }
        return movies;
    }

    // Helper method to map ResultSet to Movie object
    private Movie mapResultSetToMovie(ResultSet rs) throws SQLException {
        return new Movie(
            rs.getInt("id"),
            rs.getString("title"),
            rs.getString("director"),
            rs.getString("screenwriter"),
            rs.getString("actors"),
            rs.getString("studio"),
            rs.getString("genre"),
            rs.getFloat("rating"),
            rs.getString("poster_url"),
            rs.getString("description"),
            rs.getString("section"),
            rs.getInt("created_by")  // make sure your Movie model has this field!
        );
    }
}
