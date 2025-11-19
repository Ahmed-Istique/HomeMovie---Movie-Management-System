<%@ page import="com.app.models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.models.Movie" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Home</title>
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
    <section>
        <h2>Today's Special</h2>
        <div>
            <% 
                List<Movie> todaysSpecial = (List<Movie>) application.getAttribute("todaysSpecial");
                if (todaysSpecial != null) {
                    for (Movie movie : todaysSpecial) {
                        out.print("<div class='movie-card'>");
                        out.print("<img src='" + movie.getPosterUrl() + "' alt='" + movie.getTitle() + "'>");
                        out.print("<h3>" + movie.getTitle() + "</h3>");
                        out.print("<a href='movie?action=view&id=" + movie.getId() + "'>View Details</a>");
                        out.print("<button onclick='likeMovie(" + movie.getId() + ")'>Like</button>");
                        out.print("<button onclick='shareMovie(" + movie.getId() + ")'>Share</button>");
                        if (movie.getCreatedBy() == user.getId()) {
                            out.print("<a href='updateMovie.jsp?id=" + movie.getId() + "'>Edit</a>");
                        }
                        out.print("</div>");
                    }
                }
            %>
            <a href='addMovie.jsp?section=todays_special'>+</a>
        </div>
    </section>
    <section>
        <h2>Movies of 2025</h2>
        <div>
            <% 
                List<Movie> movies2025 = (List<Movie>) application.getAttribute("movies2025");
                if (movies2025 != null) {
                    for (Movie movie : movies2025) {
                        out.print("<div class='movie-card'>");
                        out.print("<img src='" + movie.getPosterUrl() + "' alt='" + movie.getTitle() + "'>");
                        out.print("<h3>" + movie.getTitle() + "</h3>");
                        out.print("<a href='movie?action=view&id=" + movie.getId() + "'>View Details</a>");
                        out.print("<button onclick='likeMovie(" + movie.getId() + ")'>Like</button>");
                        out.print("<button onclick='shareMovie(" + movie.getId() + ")'>Share</button>");
                        if (movie.getCreatedBy() == user.getId()) {
                            out.print("<a href='updateMovie.jsp?id=" + movie.getId() + "'>Edit</a>");
                        }
                        out.print("</div>");
                    }
                }
            %>
            <a href='addMovie.jsp?section=movies_2025'>+</a>
        </div>
    </section>
    <!-- Add your JS for like/share here -->
</body>
</html>