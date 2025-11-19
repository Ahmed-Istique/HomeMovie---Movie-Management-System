<%@ page import="com.app.models.User" %>
<%@ page import="com.app.models.Movie" %>
<%@ page import="com.app.dao.MovieDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Movie</title>
    <!-- Add your Bootstrap and CSS here -->
</head>
<body>
    <nav>
        <div>Logo</div>
        <div>
            <% 
                User user = (User) session.getAttribute("user");
                if (user != null && user.isAdmin()) {
                    out.print("<span>" + user.getName() + "</span>");
                    out.print("<a href='auth?action=logout'>Logout</a>");
                } else {
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
    </nav>
    <h2>Delete Movie</h2>
    <% 
        MovieDAO movieDAO = new MovieDAO();
        Movie movie = movieDAO.getMovieById(Integer.parseInt(request.getParameter("id")));
        if (movie != null && user.isAdmin()) {
    %>
    <p>Are you sure you want to delete "<%= movie.getTitle() %>"?</p>
    <form action="movie" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="<%= movie.getId() %>">
        <button type="submit">Confirm Delete</button>
        <a href="dashboard.jsp">Cancel</a>
    </form>
    <% } else { %>
        <p>Unauthorized or movie not found.</p>
        <a href="dashboard.jsp">Back to Dashboard</a>
    <% } %>
</body>
</html>