package com.app.listeners;

import com.app.dao.MovieDAO;
import com.app.models.Movie;
import com.app.utils.DBConnection;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

@WebListener
public class AppListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Set Derby system home and redirect logs to console
        System.setProperty("derby.system.home", "F:/J2EE projects/ebook");
        System.setProperty("derby.stream.error.field", "java.lang.System.out");

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {

            DatabaseMetaData dbMeta = conn.getMetaData();

            // Check if USERS table exists
            try (ResultSet rs = dbMeta.getTables(null, null, "USERS", null)) {
                if (!rs.next()) {
                    String createUsersTable =
                        "CREATE TABLE users ("
                        + "id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "
                        + "name VARCHAR(100) NOT NULL, "
                        + "email VARCHAR(100) NOT NULL UNIQUE, "
                        + "password VARCHAR(255) NOT NULL, "
                        + "is_admin BOOLEAN DEFAULT FALSE, "
                        + "photo_url VARCHAR(255), "
                        + "about VARCHAR(1000), "
                        + "country VARCHAR(100)"
                        + ")";
                    stmt.execute(createUsersTable);
                }
            }

            // Check if MOVIES table exists
            try (ResultSet rs = dbMeta.getTables(null, null, "MOVIES", null)) {
                if (!rs.next()) {
                    String createMoviesTable =
                        "CREATE TABLE movies ("
                        + "id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "
                        + "title VARCHAR(255) NOT NULL, "
                        + "director VARCHAR(1000), "
                        + "screenwriter VARCHAR(1000), "
                        + "actors VARCHAR(1000), "
                        + "studio VARCHAR(255), "
                        + "genre VARCHAR(100), "
                        + "rating FLOAT, "
                        + "poster_url VARCHAR(255), "
                        + "description VARCHAR(1000), "
                        + "section VARCHAR(50), "
                        + "created_by INT, "
                        + "CONSTRAINT fk_created_by FOREIGN KEY (created_by) REFERENCES users(id)"
                        + ")";
                    stmt.execute(createMoviesTable);
                }
            }

            // Insert admin user if not exists
            try (ResultSet rs = stmt.executeQuery("SELECT 1 FROM users WHERE email = 'admin@qq.com'")) {
                if (!rs.next()) {
                    String insertAdmin =
                        "INSERT INTO users (name, email, password, is_admin, photo_url, about, country) "
                        + "VALUES ('Admin', 'admin@qq.com', 'admin12@', TRUE, NULL, NULL, NULL)";
                    stmt.executeUpdate(insertAdmin);
                }
            }

            // Load movie sections into servlet context
            MovieDAO movieDAO = new MovieDAO();
            List<Movie> todaysSpecial = movieDAO.getMoviesBySection("todays_special");
            List<Movie> movies2025 = movieDAO.getMoviesBySection("movies_2025");

            ServletContext context = sce.getServletContext();
            context.setAttribute("todaysSpecial", todaysSpecial);
            context.setAttribute("movies2025", movies2025);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    	System.out.println("Application shutting down. Resources released.");
    }
}