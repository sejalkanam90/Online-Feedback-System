<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Form</title>
<style>
body {
	font-family: 'Segoe UI', Arial, sans-serif;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	padding: 15px;
}

.container {
	background: white;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	width: 420px;
	transition: transform 0.3s;
}

.container:hover {
	transform: translateY(-5px);
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 25px;
	font-size: 28px;
	font-weight: 600;
	position: relative;
}

h2:after {
	content: '';
	display: block;
	width: 50px;
	height: 3px;
	background: #667eea;
	margin: 10px auto 0;
	border-radius: 2px;
}

.form-group {
	margin-bottom: 18px;
}

label {
	display: block;
	font-weight: 600;
	margin-bottom: 6px;
	color: #444;
	font-size: 14px;
}

input, select, textarea {
	width: 100%;
	padding: 12px;
	border: 2px solid #e5e7eb;
	border-radius: 8px;
	box-sizing: border-box;
	font-size: 14px;
	transition: all 0.3s;
	font-family: inherit;
}

input:focus, select:focus, textarea:focus {
	outline: none;
	border-color: #667eea;
	box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

button {
	width: 100%;
	padding: 14px;
	background: linear-gradient(135deg, #667eea, #764ba2);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s;
	margin-top: 10px;
	letter-spacing: 0.5px;
}

button:hover {
	background: linear-gradient(135deg, #5a67d8, #6b46a1);
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
}

button:active {
	transform: translateY(0);
}

.view-link {
	text-align: center;
	margin-top: 20px;
	padding-top: 15px;
	border-top: 1px solid #e5e7eb;
}

.view-link a {
	color: #667eea;
	text-decoration: none;
	font-size: 14px;
	font-weight: 500;
	transition: color 0.3s;
}

.view-link a:hover {
	color: #764ba2;
	text-decoration: underline;
}

.error-msg {
	background: #fee2e2;
	color: #dc2626;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 15px;
	text-align: center;
	font-size: 14px;
}

.rating-preview {
	display: flex;
	gap: 5px;
	margin-top: 8px;
	color: #fbbf24;
	font-size: 18px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Feedback Form</h2>

		<%
		String error = request.getParameter("error");
		if (error != null) {
		%>
		<div class="error-msg">Error: Feedback submission failed. Please
			try again.</div>
		<%
		}
		%>

		<form action="FeedBackForm.jsp" method="post">
			<div class="form-group">
				<label>Full Name:</label> <input type="text" name="name"
					placeholder="Enter your name" required>
			</div>

			<div class="form-group">
				<label>Email Address:</label> <input type="email" name="email"
					placeholder="Enter your email" required>
			</div>

			<div class="form-group">
				<label>Rating:</label> <select name="rating" required>
					<option value="" disabled selected>Select your rating</option>
					<option value="5">5 - Excellent</option>
					<option value="4">4 - Good</option>
					<option value="3">3 - Average</option>
					<option value="2">2 - Poor</option>
					<option value="1">1 - Bad</option>
				</select>
			</div>

			<div class="form-group">
				<label>Your Feedback:</label>
				<textarea name="feedback" rows="4"
					placeholder="Write your feedback..." required></textarea>
			</div>

			<button type="submit">Submit Feedback</button>
		</form>

		<div class="view-link">
			<a href="viewFeedback.jsp">View All Feedback</a>
		</div>
	</div>
</body>
</html>