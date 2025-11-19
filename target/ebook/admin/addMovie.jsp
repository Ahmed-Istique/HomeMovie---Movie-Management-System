<%@ page import="com.app.models.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Movie</title>
<!-- Bootstrap CSS (optional) -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
<!-- add movie for admin -->

	<!-- Navbar -->
	<nav>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/index.jsp"
				style="color: black; text-decoration: none;">Hi-Movies</a>
		</div>
		<div>
			<%
			User user = (User) session.getAttribute("user");
			if (user != null) {
				out.print("<span>Welcome, " + user.getName() + "</span>");
				if (user.isAdmin()) {
					out.print("<a href='auth?action=logout' class='btn btn-sm btn-outline-danger'>Logout</a>");
				}
			} else {
				response.sendRedirect("login.jsp");
			}
			%>
		</div>
	</nav>

	<!-- Add Movie Form -->
	<h2 class="text-center mt-4">Add New Movie</h2>
	<form action="movie" method="post" class="mt-4">
		<input type="hidden" name="action" value="add"> <label>Title:</label>
		<input type="text" name="title" class="form-control" required>

		<label>Director:</label> <input type="text" name="director"
			class="form-control"> <label>Screenwriter:</label> <input
			type="text" name="screenwriter" class="form-control"> <label>Actors:</label>
		<input type="text" name="actors" class="form-control"> <label>Studio:</label>
		<input type="text" name="studio" class="form-control"> <label>Genre:</label>
		<input type="text" name="genre" class="form-control"> <label>Rating:</label>
		<input type="number" step="0.1" name="rating" class="form-control">

		<label>Poster URL:</label> <input type="text" name="poster_url"
			class="form-control"> <label>Description:</label>
		<textarea name="description" class="form-control" rows="4"></textarea>

		<label>Section:</label> <select name="section" class="form-control">
			<option value="todays_special">Today's Special</option>
			<option value="movies_2025">Movies of 2025</option>
		</select>

		<button type="submit" class="btn btn-primary btn-block">Add
			Movie</button>
	</form>

</body>
</html>
