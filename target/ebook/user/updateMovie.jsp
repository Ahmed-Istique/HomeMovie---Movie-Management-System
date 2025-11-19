<%@ page import="com.app.models.User" %>
<%@ page import="com.app.models.Movie" %>
<%@ page import="com.app.dao.MovieDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Movie</title>
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
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
    </nav>
    <h2>Update Movie</h2>
    <% 
        MovieDAO movieDAO = new MovieDAO();
        Movie movie = movieDAO.getMovieById(Integer.parseInt(request.getParameter("id")));
        if (movie != null && (user.isAdmin() || movie.getCreatedBy() == user.getId())) {
    %>
    <form action="movie" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= movie.getId() %>">
        <label>Title:</label>
        <input type="text" name="title" value="<%= movie.getTitle() %>" required><br>
        <label>Director:</label>
        <input type="text" name="director" value="<%= movie.getDirector() %>"><br>
        <label>Screenwriter:</label>
        <input type="text" name="screenwriter" value="<%= movie.getScreenwriter() %>"><br>
        <label>Actors:</label>
        <input type="text" name="actors" value="<%= movie.getActors() %>"><br>
        <label>Studio:</label>
        <input type="text" name="studio" value="<%= movie.getStudio() %>"><br>
        <label>Genre:</label>
        <input type="text" name="genre" value="<%= movie.getGenre() %>"><br>
        <label>Rating:</label>
        <input type="number" step="0.1" name="rating" value="<%= movie.getRating() %>"><br>
        <label>Poster URL:</label>
        <input type="text" name="poster_url" value="<%= movie.getPosterUrl() %>"><br>
        <label>Description:</label>
        <textarea name="description"><%= movie.getDescription() %></textarea><br>
        <label>Section:</label>
        <select name="section">
            <option value="todays_special" <%= "todays_newmovies_special".equals(movie.getSection()) ? "selected" : "" %>>Today's Special</option>
            <option value="movies_2025" <%= "movies_2025".equals(movie.getSection()) ? "selected" : "" %>>Movies of 2025</option>
        </select><br>
        <button type="submit">Update Movie</button>
    </form>
    <% } else { %>
        <p>Unauthorized or movie not found.</p>
        <a href="home.jsp">Back to Home</a>
    <% } %>
</body>
</html>