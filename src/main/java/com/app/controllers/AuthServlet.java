package com.app.controllers;

import com.app.dao.UserDAO;
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

@MultipartConfig
public class AuthServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();

        if ("login".equals(action)) {
            // Login logic unchanged
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            try {
                if ("admin@qq.com".equals(email) && "admin12@".equals(password)) {
                    User adminUser = new User(1, "admin", email, password, true, null, null, null);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", adminUser);
                    response.sendRedirect("admin/dashboard.jsp");
                    return;
                }

                User user = userDAO.authenticate(email, password);
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    if (user.isAdmin()) {
                        response.sendRedirect("admin/dashboard.jsp");
                    } else {
                        response.sendRedirect("user/userProfile.jsp");
                    }
                } else {
                    request.setAttribute("error", "Invalid credentials");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("login.jsp");
            }

        } else if ("register".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String about = request.getParameter("about");
            String country = request.getParameter("country");

            String photoUrl = null;

            try {
                Part photoPart = request.getPart("photo");
                if (photoPart != null && photoPart.getSize() > 0) {
                    String fileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();

                    String appPath = request.getServletContext().getRealPath("");
                    String uploadPath = appPath + File.separator + UPLOAD_DIR;

                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                    String filePath = uploadPath + File.separator + uniqueFileName;

                    photoPart.write(filePath);

                    // Save relative path for DB and later retrieval
                    photoUrl = UPLOAD_DIR + "/" + uniqueFileName;
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Continue even if photo upload fails; user photoUrl remains null
            }

            User user = new User(0, name, email, password, false, photoUrl, about, country);

            try {
                if (userDAO.register(user)) {
                    response.sendRedirect(request.getContextPath() + "/login.jsp?registered=success");
                } else {
                    request.setAttribute("error", "Registration failed or email already exists");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred during registration. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("index.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            request.setAttribute("logoutSuccess", true);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Invalid GET request");
        }
    }
}
