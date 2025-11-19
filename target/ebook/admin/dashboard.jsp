<%@ page import="com.app.models.User"%>
<%@ page import="com.app.models.Movie"%>
<%@ page import="com.app.dao.MovieDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<!-- Add your Bootstrap and CSS here -->
<style>
table {
	border-collapse: collapse;
	width: 90%;
	margin: 20px auto;
}

th, td {
	padding: 8px 12px;
	border: 1px solid #ccc;
}

th {
	background-color: #f2f2f2;
}

nav {
	display: flex;
	justify-content: space-between;
	padding: 10px 20px;
	background-color: #ddd;
}

nav div span {
	font-weight: bold;
}

nav div a {
	margin-left: 15px;
}
</style>
</head>
<body>
	<nav>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/index.jsp" style="color: white; text-decoration: none;">Hi-Movies</a>
		</div>
		<div>
			<%
			User user = (User) session.getAttribute("user");
			if (user == null || !user.isAdmin()) {
				response.sendRedirect("login.jsp");
				return;
			}
			out.print("<span>Welcome, " + user.getName() + "</span>");
			%>
			<a href="<%=request.getContextPath()%>/auth?action=logout">Logout</a>
		</div>
	</nav>

	<h2 style="text-align: center;">Admin Dashboard</h2>
	<div style="text-align: center; margin-bottom: 20px;">
		<a href="addMovie.jsp">Add Movie</a>
	</div>

	<%
	List<Movie> movies = new ArrayList<>();
	try {
		MovieDAO movieDAO = new MovieDAO();
		movies = movieDAO.getMoviesBySection("todays_special");
		movies.addAll(movieDAO.getMoviesBySection("movies_2025"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<%
	if (movies.isEmpty()) {
	%>
	<h1 style="text-align: center;">Welcome Admin!</h1>
	<%
	} else {
	%>
	<table>
		<thead>
			<tr>
				<th>Title</th>
				<th>Director</th>
				<th>Rating</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Movie movie : movies) {
			%>
			<tr>
				<td><%=movie.getTitle()%></td>
				<td><%=movie.getDirector()%></td>
				<td><%=movie.getRating()%></td>
				<td><a href="updateMovie.jsp?id=<%=movie.getId()%>">Edit</a>
					| <a href="movie?action=delete&id=<%=movie.getId()%>"
					onclick="return confirm('Are you sure to delete this movie?');">Delete</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	}
	%>

</body>
</html>
