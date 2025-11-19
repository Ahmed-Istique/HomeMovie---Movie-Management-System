<%@ page import="com.app.models.User"%>
<%@ page import="java.util.List"%>
<%@ page import="com.app.models.Movie"%>
<%@ page import="com.app.dao.MovieDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>View Movie</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
.movie-container {
	margin-top: 40px;
}

.movie-poster {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
}

.social-icons i {
	font-size: 24px;
	margin-right: 15px;
	color: #444;
	transition: color 0.3s ease;
}

.social-icons i:hover {
	color: #007bff;
}

.comment-box textarea {
	resize: none;
}
</style>
</head>
<body>

	<div class="container movie-container">

		<!-- Movie Info Section -->
		<div class="d-flex flex-row gap-4 mb-5" >
			<!-- Left: Poster -->
			<div class="col-md-4" style="width: 18rem; height: 18rem;" >
				<img src="./images/DD.jpg" alt="Movie Poster"
					class="movie-poster w-100">
			</div>

			<!-- Right: Info -->
			<div class="col-md-8">
				<h2>Deadpool & Wolverine</h2>
				<p>
					<strong>Description:</strong> Wade Wilson, aka Deadpool, is pulled
					from his quiet life into a multiversal adventure alongside a
					reluctant, healing Wolverine. They must team up to face a new,
					powerful threat, navigating the complexities of the TVA and their
					own tumultuous relationship, all while breaking the fourth wall and
					delivering signature
				</p>
				<p>
					<strong>Keywords:</strong> Action, Drama, Thriller, Hero, Adventure
				</p>
			</div>
		</div>

		<!-- Movie Details Table -->
		<div class="mb-5">
			<h4 class="mb-3">Film Details</h4>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row">Director</th>
						<td>Tim Miller</td>
					</tr>
					<tr>
						<th scope="row">Screenwriters</th>
						<td>Rhett Reese, Paul Wernick</td>
					</tr>
					<tr>
						<th scope="row">Actors</th>
						<td>Ryan Reynolds, Morena Baccarin, Josh Brolin</td>
					</tr>
					<tr>
						<th scope="row">Studio</th>
						<td>Marvel Studios, 20th Century Studios</td>
					</tr>
					<tr>
						<th scope="row">Genre</th>
						<td>Action, Comedy, Superhero</td>
					</tr>
					<tr>
						<th scope="row">Release Date</th>
						<td>25 July 2024</td>
					</tr>
				</tbody>
			</table>

		</div>

		<!-- Social Media Icons -->
		<div class="social-icons mb-5">
			<h5>Share on</h5>
			<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-twitter"></i></a> <a href="#"><i
				class="fas fa-envelope"></i></a> <a href="#"><i
				class="fab fa-amazon"></i></a> <a href="#"><i
				class="fas fa-file-alt"></i></a>
			<!-- Placeholder for Turnitin -->
		</div>

		<!-- Comment Section -->
		<div class="comment-box">
			<h5 class="mb-3">Leave a Comment</h5>
			<form method="post" action="SubmitCommentServlet">
				<div class="mb-3">
					<textarea class="form-control" name="comment" rows="4"
						placeholder="Write your comment here..."></textarea>
				</div>
				<div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-primary">Post Comment</button>
				</div>
			</form>
		</div>

	</div>

	<!-- Bootstrap JS (Optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
