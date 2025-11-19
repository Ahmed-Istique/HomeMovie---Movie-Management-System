<head>
<title>Movie Card</title>
<style>
.movie-card .overlay {
	background: rgba(0, 0, 0, 0.5);
	backdrop-filter: blur(5px);
	opacity: 0;
	transition: opacity 0.3s ease-in-out;
}

.movie-card:hover .overlay {
	opacity: 1;
}

.object-fit-cover {
	object-fit: cover;
}
</style>
</head>

<div class="card movie-card position-relative overflow-hidden"
	style="width: 18rem; height: 18rem;">
	<img src="./images/DD.jpg" class="card-img-top h-100 object-fit-cover"
		alt="Movie Poster">

	<!-- Overlay on hover -->
	<div
		class="overlay position-absolute top-0 start-0 w-100 h-100 d-flex flex-column justify-content-center align-items-center text-white text-center p-3">
		<h5 class="mb-2">Movie Name</h5>
		<p class="mb-3">Genre: Action</p>
		<a href="<%= request.getContextPath() %>/all_component/viewMovies.jsp" class="btn btn-light btn-sm">View More</a>
		<%-- <a href="<%=request.getContextPath()%>/movie?action=view&id=<%=movie.getId()%>" class="btn btn-light btn-sm">View More</a>
		 --%>
	</div>
</div>
