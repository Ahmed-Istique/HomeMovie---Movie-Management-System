<%@ page import="com.app.models.User" %>
<%@ page import="com.app.models.Movie" %>
<%@ page import="com.app.dao.MovieDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- FontAwesome CDN -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
<!-- Bootstrap Icons CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
<%@ include file="../all_component/all_CSS.jsp" %>

<style>
  /* Custom override for the Add Movie button gradient */
  .btn-gradient {
    background: linear-gradient(45deg, #6a11cb, #2575fc);
    border: none;
  }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="bg-dark text-white d-flex justify-content-between align-items-center px-4 py-3">
  <%@ include file="../all_component/logo.jsp" %>
  <div class="user-links d-flex align-items-center">
    <%
      User user = (User) session.getAttribute("user");
      if (user != null) {
        if (user.isAdmin()) {
    %>
      <span class="me-3">
          Welcome, 
            <strong>
              <a href="<%=request.getContextPath()%>/admin/dashboard.jsp" class="text-white text-decoration-none">
                admin <i class="fa-solid fa-door-open ms-2"></i>
              </a>
            </strong>
      </span>

      <a href="<%=request.getContextPath()%>/auth?action=logout" class="text-white text-decoration-none">
        <i class="fa-solid fa-circle-xmark"></i> Logout
      </a>
    <%
        } else {
    %>
      <span class="me-3"> Welcome, <%= user.getName() %>  <i class="fa-solid fa-user ms-2"></i> </span>
      <a href="<%=request.getContextPath()%>/auth?action=logout" class="text-white text-decoration-none">
        <i class="fa-solid fa-circle-xmark"></i> Logout
      </a>
    <%
        }
      } else {
    %>
      <a href="<%=request.getContextPath()%>/login.jsp" class="text-white me-3 text-decoration-none">Login <i class="fa-solid fa-right-to-bracket"></i></a>
      <a href="<%=request.getContextPath()%>/register.jsp" class="text-white text-decoration-none">Signup <i class="fa-solid fa-user-plus"></i></a>
    <%
      }
    %>
  </div>
</nav>

<!-- Page Title -->
<h2 class="text-center mb-4">Admin Dashboard <i class="fa-solid fa-user-tie"></i></h2>

<!-- Add Movie Button -->
<div class="text-center mb-5">
  <a href="addMovie.jsp" class="btn btn-lg btn-gradient text-white">
    Add Movie
  </a>
</div>

<%
    List<Movie> movies = null;
    try {
        MovieDAO movieDAO = new MovieDAO();
        movies = movieDAO.getAllMovies();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    if (movies == null || movies.isEmpty()) {
%>
    <h1 class="text-center">No movies found. Add some!</h1>
<%
    } else {
%>
<div class="container">
  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center">
      <thead class="table-light">
        <tr>
          <th>ID</th>
          <th>Movie Title</th>
          <th>Director</th>
          <th>Genre</th>
          <th>Section</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
          for (Movie movie : movies) {
        %>
        <tr>
          <td><%= movie.getId() %></td>
          <td><%= movie.getTitle() %></td>
          <td><%= movie.getDirector() %></td>
          <td><%= movie.getGenre() %></td>
          <td><%= movie.getSection() %></td>
          <td>
            <a href="updateMovie.jsp?id=<%= movie.getId() %>" class="text-primary text-decoration-none me-2">Edit</a>
<form action="<%=request.getContextPath()%>/movie" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this movie?');">
    <input type="hidden" name="action" value="delete" />
    <input type="hidden" name="id" value="<%= movie.getId() %>" />
    <button type="submit" style="background:none;border:none;color:red;cursor:pointer;">Delete</button>
</form>




          </td>
        </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>
</div>
<%
    }
%>

<%@ include file="../all_component/footer.jsp" %>

<!-- Bootstrap JS Bundle (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
