<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Received</title>
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
	padding: 45px;
	border-radius: 20px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
	width: 480px;
	text-align: center;
	animation: slideUp 0.5s ease;
}

@
keyframes slideUp {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.success-icon {
	width: 90px;
	height: 90px;
	background: #4CAF50;
	color: white;
	font-size: 55px;
	line-height: 90px;
	border-radius: 50%;
	margin: 0 auto 25px;
	box-shadow: 0 10px 20px rgba(76, 175, 80, 0.3);
	animation: scaleIn 0.5s ease 0.2s both;
}

@
keyframes scaleIn {from { transform:scale(0);
	
}

to {
	transform: scale(1);
}

}
h2 {
	color: #333;
	margin-bottom: 15px;
	font-size: 32px;
	font-weight: 600;
}

.thankyou-text {
	font-size: 28px;
	font-weight: bold;
	color: #667eea;
	margin: 15px 0;
	animation: fadeIn 0.5s ease 0.3s both;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.feedback-card {
	background: #f8fafc;
	padding: 20px;
	border-radius: 12px;
	margin: 20px 0;
	text-align: left;
	border-left: 4px solid #667eea;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.feedback-card p {
	margin: 8px 0;
	color: #475569;
	font-size: 14px;
	line-height: 1.6;
}

.feedback-card .label {
	font-weight: 600;
	color: #334155;
	display: inline-block;
	width: 80px;
}

.rating-stars {
	color: #fbbf24;
	font-size: 20px;
	letter-spacing: 2px;
	margin-top: 5px;
}

.message {
	color: #64748b;
	line-height: 1.6;
	margin: 20px 0 25px;
	padding: 15px;
	background: #f1f5f9;
	border-radius: 8px;
	font-size: 15px;
}

.btn-group {
	display: flex;
	gap: 12px;
	justify-content: center;
	flex-wrap: wrap;
	margin-top: 25px;
}

.btn-home, .btn-view {
	display: inline-block;
	padding: 12px 30px;
	text-decoration: none;
	border-radius: 8px;
	font-weight: 600;
	transition: all 0.3s;
	flex: 1;
	min-width: 140px;
}

.btn-home {
	background: #667eea;
	color: white;
	box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.btn-home:hover {
	background: #5a67d8;
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(102, 126, 234, 0.4);
}

.btn-view {
	background: #4CAF50;
	color: white;
	box-shadow: 0 4px 12px rgba(76, 175, 80, 0.3);
}

.btn-view:hover {
	background: #45a049;
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(76, 175, 80, 0.4);
}

.error-container {
	background: #fee2e2;
	color: #dc2626;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 20px;
	border: 1px solid #fecaca;
}

.error-container h3 {
	margin-top: 0;
	color: #b91c1c;
}
</style>
</head>
<body>
	<%
	// Get form data from request
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String feedback = request.getParameter("feedback");
	String ratingStr = request.getParameter("rating");

	if (name != null && !name.trim().isEmpty()) {
		try {
			int rating = Integer.parseInt(ratingStr);

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_db", "root", "Sejal@28");

			// Insert query
			PreparedStatement ps = con
			.prepareStatement("INSERT INTO feedback(name, email, feedback, rating) VALUES(?, ?, ?, ?)");

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, feedback);
			ps.setInt(4, rating);

			int result = ps.executeUpdate();

			ps.close();
			con.close();

			if (result > 0) {
		// Generate stars for display
		String stars = "";
		for (int i = 1; i <= 5; i++) {
			if (i <= rating) {
				stars += "★";
			} else {
				stars += "☆";
			}
		}
	%>
	<div class="container">
		<div class="success-icon">✓</div>
		<h2>Thank You!</h2>
		<div class="thankyou-text"><%=name%></div>

		<div class="feedback-card">
			<p>
				<span class="label">Email:</span>
				<%=email%></p>
			<p>
				<span class="label">Feedback:</span>
			</p>
			<p style="margin-left: 20px; font-style: italic;">
				"<%=feedback%>"
			</p>
			<p>
				<span class="label">Rating:</span>
			</p>
			<div class="rating-stars"><%=stars%></div>
			<p style="text-align: right; font-size: 12px; color: #94a3b8;">
				Rating:
				<%=rating%>/5
			</p>
		</div>

		<div class="message">
			Your feedback has been successfully submitted!<br> We truly
			appreciate you taking the time to help us improve.
		</div>

		<div class="btn-group">
			<a href="Form.jsp" class="btn-home">← Back to Form</a> <a
				href="viewFeedback.jsp" class="btn-view">View All Feedback →</a>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("Form.jsp?error=failed");
	}
	} catch (Exception e) {
	%>
	<div class="container">
		<div class="error-container">
			<h3>Error Occurred</h3>
			<p><%=e.getMessage()%></p>
		</div>
		<a href="Form.jsp" class="btn-home">← Back to Form</a>
	</div>
	<%
	}
	} else {
	response.sendRedirect("Form.jsp");
	}
	%>
</body>
</html>