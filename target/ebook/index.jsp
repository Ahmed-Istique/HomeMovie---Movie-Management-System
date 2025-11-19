<%@ page import="com.app.models.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.app.models.Movie"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Movie Website</title>
<%@include file="all_component/all_CSS.jsp"%>
<style>
/* Reset and base */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background: #f4f4f4;
	color: #333;
	line-height: 1.6;
}

nav {
	background-color: #222;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem 2rem;
}

nav .logo {
	font-weight: bold;
	font-size: 1.5rem;
}

nav .user-links a, nav .user-links span {
	color: white;
	margin-left: 1rem;
	text-decoration: none;
	font-weight: 500;
}

nav .user-links a:hover {
	text-decoration: underline;
}

section {
	padding: 2rem;
	max-width: 1200px;
	margin: 0 auto 2rem auto;
	background: white;
	border-radius: 8px;
}

section h2 {
	margin-bottom: 1rem;
	border-bottom: 2px solid #222;
	padding-bottom: 0.5rem;
}

.movies-container {
	display: flex;
	flex-wrap: wrap;
	gap: 1rem;
}

.movie-card {
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	width: calc(25% - 1rem);
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.movie-card img {
	width: 100%;
	height: auto;
	display: block;
}

.movie-card h3 {
	padding: 0.5rem 1rem;
	font-size: 1.1rem;
	flex-grow: 1;
}

.movie-card .actions {
	padding: 0.5rem 1rem 1rem 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.movie-card a {
	text-decoration: none;
	color: #007BFF;
	font-weight: 600;
}

.movie-card a:hover {
	text-decoration: underline;
}

.movie-card button {
	background-color: #007BFF;
	border: none;
	color: white;
	padding: 0.3rem 0.7rem;
	border-radius: 4px;
	cursor: pointer;
	font-size: 0.9rem;
	margin-left: 0.3rem;
}

.movie-card button:hover {
	background-color: #0056b3;
}
/* Add Movie + button */
.add-movie-link {
	font-size: 2rem;
	font-weight: bold;
	color: #007BFF;
	text-decoration: none;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 4rem;
	height: 4rem;
	border: 2px dashed #007BFF;
	border-radius: 50%;
	transition: background-color 0.3s, color 0.3s;
	cursor: pointer;
}

.add-movie-link:hover {
	background-color: #007BFF;
	color: white;
	text-decoration: none;
}
/* Responsive */
@media ( max-width : 1024px) {
	.movie-card {
		width: calc(33.333% - 1rem);
	}
}

@media ( max-width : 768px) {
	.movie-card {
		width: calc(50% - 1rem);
	}
}

@media ( max-width : 480px) {
	.movie-card {
		width: 100%;
	}
	nav {
		flex-direction: column;
		align-items: flex-start;
	}
	nav .user-links {
		margin-top: 0.5rem;
	}
}
</style>
</head>
<body>


	<nav>
		<%@include file="all_component/logo.jsp"%>
		<div class="user-links">
			<%
			User user = (User) session.getAttribute("user");
			if (user != null) {
				if (user.isAdmin()) {
			%>
			<span>Welcome, <strong>admin <i
					class="fa-solid fa-door-open"></i>
			</strong></span> <a href="<%=request.getContextPath()%>/auth?action=logout"> <i
				class="fa-solid fa-circle-xmark"></i> Logout
			</a>


			<%
			} else {

			/* for external user */
			%>
			<span>Welcome, <%=user.getName()%></span> <a
				href="auth?action=logout"><i class="fa-solid fa-circle-xmark"></i>
				Logout </a>
			<%
			}
			} else {

			/* when logout */
			%>
			<a href="login.jsp">Login <i class="fa-solid fa-right-to-bracket"></i>
			</a> <a href="register.jsp">Signup <i class="fa-solid fa-user-plus"></i>
			</a>
			<%
			}
			%>
		</div>
	</nav>

	<section>
		<h2>
			<i class="fa-solid fa-video"></i> Today's Special
		</h2>
		<div class="movies-container">

			<%@include file="all_component/movieCard.jsp"%>
			<%-- 			<%
			List<Movie> todaysSpecial = (List<Movie>) application.getAttribute("todaysSpecial");
			if (todaysSpecial != null) {
				for (Movie movie : todaysSpecial) {
			%>
			
			<div class="movie-card">
				<img src="<%=movie.getPosterUrl()%>" alt="<%=movie.getTitle()%>" />
				<h3><%=movie.getTitle()%></h3>
				<div class="actions">
					<a href="movie?action=view&id=<%=movie.getId()%>">View Details</a>
					<div>
						<button onclick="likeMovie(<%=movie.getId()%>)">Like</button>
						<button onclick="shareMovie(<%=movie.getId()%>)">Share</button>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
			<a class="add-movie-link"
				href="user/addMovie.jsp?section=todays_special" title="Add Movie">+</a> --%>
		</div>
	</section>

	<section>
		<h2>
			<i class="fa-solid fa-star"></i> Movies of 2025
		</h2>
		<div class="movies-container">
			<%
			List<Movie> movies2025 = (List<Movie>) application.getAttribute("movies2025");
			if (movies2025 != null) {
				for (Movie movie : movies2025) {
			%>
			<div class="movie-card">
				<img src="<%=movie.getPosterUrl()%>" alt="<%=movie.getTitle()%>" />
				<h3><%=movie.getTitle()%></h3>
				<div class="actions">
					<a href="movie?action=view&id=<%=movie.getId()%>">View Details</a>
					<div>
						<button onclick="likeMovie(<%=movie.getId()%>)">Like</button>
						<button onclick="shareMovie(<%=movie.getId()%>)">Share</button>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
			<a class="add-movie-link"
				href="user/addMovie.jsp?section=movies_2025" title="Add Movie">+</a>
		</div>
	</section>

	<script>
    function likeMovie(id) {
        alert("You liked movie ID: " + id);
        // Implement AJAX call or form submit for liking the movie here
    }

    function shareMovie(id) {
        alert("Share movie ID: " + id);
        // Implement sharing logic here
    }
</script>
</body>
</html>
