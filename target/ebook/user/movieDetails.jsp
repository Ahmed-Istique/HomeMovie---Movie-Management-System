<%@ page import="com.app.models.Movie" %>
<%@ page import="com.app.models.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Details</title>
    <!-- Add your Bootstrap and CSS here -->
</head>
<body>
    <nav>
        <div>Logo</div>
        <div>
            <% 
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    out.print("<span>" + user.getName() + "</span>");
                } else {
                    out.print("<a href='login.jsp'>Login</a>");
                    out.print("<a href='register.jsp'>Signup</a>");
                }
            %>
        </div>
    </nav>
    <h2>Movie Details</h2>
    <% 
        Movie movie = (Movie) request.getAttribute("movie");
        if (movie != null) {
    %>
    <div>
        <img src="<%= movie.getPosterUrl() %>" alt="<%= movie.getTitle() %>">
        <h3><%= movie.getTitle() %></h3>
        <p><strong>Director:</strong> <%= movie.getDirector() %></p>
        <p><strong>Screenwriter:</strong> <%= movie.getScreenwriter() %></p>
        <p><strong>Actors:</strong> <%= movie.getActors() %></p>
        <p><strong>Studio:</strong> <%= movie.getStudio() %></p>
        <p><strong>Genre:</strong> <%= movie.getGenre() %></p>
        <p><strong>Rating:</strong> <%= movie.getRating() %></p>
        <p><strong>Description:</strong> <%= movie.getDescription() %></p>
        <button onclick="likeMovie(<%= movie.getId() %>)">Like</button>
        <button onclick="shareMovie(<%= movie.getId() %>)">Share</button>
        <% if (user != null && (user.isAdmin() || movie.getCreatedBy() == user.getId())) { %>
            <a href="updateMovie.jsp?id=<%= movie.getId() %>">Edit</a>
        <% } %>
    </div>
    <% } else { %>
        <p>Movie not found.</p>
    <% } %>
    <!-- Add your JS for like/share here -->
</body>
</html>