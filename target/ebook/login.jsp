<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Login</title>
<%@include file="all_component/all_CSS.jsp"%>
<style>
/* Reset */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f7f9fc;
	color: #333;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
}

nav {
	width: 100%;
	background-color: #222;
	color: white;
	display: flex;
	justify-content: space-between;
	padding: 1rem 2rem;
	align-items: center;
	margin-bottom: 2rem;
}

nav .logo {
	font-weight: bold;
	font-size: 1.5rem;
}

nav a {
	color: white;
	text-decoration: none;
	margin-left: 1rem;
	font-weight: 600;
}

nav a:hover {
	text-decoration: underline;
}

h2 {
	margin-bottom: 1rem;
}

form {
	background: white;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 320px;
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

label {
	font-weight: 600;
	margin-bottom: 0.3rem;
}

input[type="email"], input[type="password"] {
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 1rem;
}

input[type="email"]:focus, input[type="password"]:focus {
	outline: none;
	border-color: #007BFF;
	box-shadow: 0 0 3px #007BFF;
}

button {
	padding: 0.6rem;
	border: none;
	background-color: #007BFF;
	color: white;
	font-weight: 700;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1rem;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #0056b3;
}

.error-message {
	color: red;
	font-weight: 600;
	margin-bottom: 1rem;
	text-align: center;
}
</style>
</head>
<body>
	<nav>
		<%@include file="all_component/logo.jsp"%>
		<div>
			<a href="login.jsp">Login <i class="fa-solid fa-right-to-bracket"></i></a> 
			<a href="register.jsp">Signup <i class="fa-solid fa-user-plus"></i></a>
		</div>
	</nav>

	<h2>Login</h2>

	<%
	if (request.getAttribute("error") != null) {
	%>
	<p class="error-message"><%=request.getAttribute("error")%></p>
	<%
	}
	%>

	<form action="auth" method="post" novalidate>
		<input type="hidden" name="action" value="login" /> <label
			for="email">Email:</label> <input type="email" id="email"
			name="email" required /> <label for="password">Password:</label> <input
			type="password" id="password" name="password" required />

		<button type="submit">Login</button>
	</form>
</body>
</html>
