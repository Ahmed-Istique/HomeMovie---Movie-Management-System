<%@ page import="com.app.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Add Movie</title>
    <!-- Bootstrap CSS (optional) -->
<%@ include file="../all_component/all_CSS.jsp" %>
    <style>
        body {
            padding: 20px;
        }

        nav {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
        }

        nav div span {
            margin-right: 15px;
            font-weight: bold;
        }

        form {
            max-width: 600px;
            margin: auto;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        button {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="bg-dark text-white d-flex justify-content-between align-items-center px-4 py-3 mb-5">
  <%@ include file="../all_component/logo.jsp" %>
  <div class="user-links d-flex align-items-center">
    <%
      User user = (User) session.getAttribute("user");
      if (user != null) {
        if (user.isAdmin()) {
    %>
      <span class="me-3">Welcome, <strong>admin <i class="fa-solid fa-door-open"></i></strong></span>
      <a href="<%=request.getContextPath()%>/auth?action=logout" class="text-white text-decoration-none">
        <i class="fa-solid fa-circle-xmark"></i> Logout
      </a>
    <%
        } else {
    %>
      <span class="me-3">Welcome, <%= user.getName() %></span>
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

<!-- Add Movie Form -->
<h2 class="text-center mt-4">Add New Movie</h2>
<form action="<%=request.getContextPath()%>/movie" method="post" enctype="multipart/form-data" class="my-5">
    <input type="hidden" name="action" value="add">  //add action performing

    <label>Title:</label>
    <input type="text" name="title" class="form-control" required>

    <label>Director:</label>
    <input type="text" name="director" class="form-control">

    <label>Screenwriter:</label>
    <input type="text" name="screenwriter" class="form-control">

    <label>Actors:</label>
    <input type="text" name="actors" class="form-control">

    <label>Studio:</label>
    <input type="text" name="studio" class="form-control">

    <label>Genre:</label>
    <input type="text" name="genre" class="form-control">

    <label>Rating:</label>
    <input type="number" step="0.1" min="0" max="10" name="rating" class="form-control">

    <label>Upload Poster Image:</label>
    <input type="file" id="posterFile" name="posterFile" class="form-control" accept="image/*">

    <label>Description:</label>
    <textarea name="description" class="form-control" rows="4"></textarea>

    <label>Section:</label>
    <select name="section" class="form-control">
        <option value="todays_special">Today's Special</option>
        <option value="movies_2025">Movies of 2025</option>
    </select>

    <button type="submit" class="btn btn-primary btn-block">Add Movie</button>
</form>

<%@ include file="../all_component/footer.jsp" %>

</body>
</html>
