package com.app.controllers;

import com.app.dao.MovieDAO;
import com.app.models.Movie;
import com.app.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB before writing to disk
    maxFileSize = 1024 * 1024 * 10,       // Max 10 MB per file
    maxRequestSize = 1024 * 1024 * 15     // Max 15 MB total request size
)
public class MovieServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        MovieDAO movieDAO = new MovieDAO();
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            // Not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            if ("add".equals(action)) {
                // Allow all logged-in users (not just admins) to add movies
                Movie movie = extractMovieFromRequest(request, null);
                movie.setCreatedBy(user.getId());
                movieDAO.addMovie(movie);

                // Redirect based on role
                if (user.isAdmin()) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("user/userProfile.jsp");  // or movies list page
                }

            } else if ("update".equals(action)) {
                int movieId = Integer.parseInt(request.getParameter("id"));
                Movie existingMovie = movieDAO.getMovieById(movieId);

                // Only admin can update existing movies
                if (user.isAdmin() && existingMovie != null) {
                    Movie movie = extractMovieFromRequest(request, existingMovie);
                    movie.setId(movieId);
                    movieDAO.updateMovie(movie);
                }
                response.sendRedirect("admin/dashboard.jsp");

            } else if ("delete".equals(action)) {
                // Only admin can delete movies
                if (user.isAdmin()) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    movieDAO.deleteMovie(id);
                }
                response.sendRedirect("admin/dashboard.jsp");

            } else {
                // Default fallback redirect
                response.sendRedirect("admin/dashboard.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/dashboard.jsp");
        }
    }

    /**
     * Helper method to extract Movie data from request and handle file upload.
     * If existingMovie is not null, keeps old posterUrl if no new file uploaded.
     */
    private Movie extractMovieFromRequest(HttpServletRequest request, Movie existingMovie) throws IOException, ServletException {
        Movie movie = new Movie();

        movie.setTitle(request.getParameter("title"));
        movie.setDirector(request.getParameter("director"));
        movie.setScreenwriter(request.getParameter("screenwriter"));
        movie.setActors(request.getParameter("actors"));
        movie.setStudio(request.getParameter("studio"));
        movie.setGenre(request.getParameter("genre"));

        // Parse rating safely
        try {
            String ratingStr = request.getParameter("rating");
            if (ratingStr != null && !ratingStr.trim().isEmpty()) {
                movie.setRating(Float.parseFloat(ratingStr));
            } else {
                movie.setRating(0.0f);
            }
        } catch (NumberFormatException e) {
            movie.setRating(0.0f);
        }

        // Handle file upload
        Part filePart = request.getPart("posterFile");
        String posterUrl = (existingMovie != null) ? existingMovie.getPosterUrl() : "uploads/default-poster.jpg";

        if (filePart != null && filePart.getSize() > 0) {
            String submittedFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            if (submittedFileName != null && !submittedFileName.isEmpty()) {
                // Create upload directory if it doesn't exist
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Generate unique file name to avoid overwriting
                String uniqueFileName = System.currentTimeMillis() + "_" + submittedFileName;
                String filePath = uploadPath + File.separator + uniqueFileName;

                // Save the file on disk
                filePart.write(filePath);

                posterUrl = UPLOAD_DIR + "/" + uniqueFileName;
            }
        }

        movie.setPosterUrl(posterUrl);
        movie.setDescription(request.getParameter("description"));
        movie.setSection(request.getParameter("section"));

        return movie;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        MovieDAO movieDAO = new MovieDAO();
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        try {
            if ("view".equals(action)) {
                if (user == null) {
                    response.sendRedirect("login.jsp");
                } else if (user.isAdmin()) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    request.setAttribute("toastMessage", "Sorry! You are not admin"); // normal users not allowed to view
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            } else if ("edit".equals(action)) {
                if (user == null || !user.isAdmin()) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                int id = Integer.parseInt(request.getParameter("id"));
                Movie movie = movieDAO.getMovieById(id);

                if (movie != null) {
                    request.setAttribute("movie", movie);
                    request.getRequestDispatcher("admin/addMovie.jsp").forward(request, response);
                } else {
                    response.sendRedirect("admin/dashboard.jsp");
                }

            } else {
                response.sendRedirect("admin/dashboard.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/dashboard.jsp");
        }

    }
}
