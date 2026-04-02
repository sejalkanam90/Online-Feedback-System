<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Feedback</title>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #eef2ff, #e0e7ff);
	margin: 0;
	padding: 30px;
}

.container {
	max-width: 1200px;
	margin: auto;
}

h2 {
	text-align: center;
	color: #2d2d2d;
	margin-bottom: 30px;
	font-size: 32px;
	font-weight: 600;
}

.success-msg {
	background: #4CAF50;
	color: white;
	padding: 15px;
	border-radius: 10px;
	margin-bottom: 25px;
	text-align: center;
	font-weight: bold;
	animation: slideDown 0.5s ease;
}

@
keyframes slideDown {from { transform:translateY(-20px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 25px;
	margin-top: 20px;
}

.card {
	background: #ffffff;
	border-radius: 20px;
	padding: 22px;
	position: relative;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	border-left: 5px solid #667eea;
	animation: fadeIn 0.5s ease;
}

@
keyframes fadeIn {from { opacity:0;
	transform: scale(0.9);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 20px 35px rgba(102, 126, 234, 0.2);
}

.card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.user-info {
	display: flex;
	align-items: center;
	gap: 12px;
}

.avatar {
	width: 50px;
	height: 50px;
	background: linear-gradient(135deg, #667eea, #764ba2);
	color: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	font-size: 20px;
}

.name {
	font-size: 18px;
	font-weight: 700;
	color: #1f2937;
}

.email {
	font-size: 13px;
	color: #6b7280;
}

.delete-btn {
	background: #fee2e2;
	color: #ef4444;
	width: 36px;
	height: 36px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
	font-size: 18px;
	cursor: pointer;
	transition: all 0.3s;
}

.delete-btn:hover {
	background: #ef4444;
	color: white;
}

.feedback-text {
	background: #f8fafc;
	padding: 15px;
	border-radius: 12px;
	margin: 15px 0;
	font-size: 14px;
}

.rating-container {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.stars {
	color: #fbbf24;
	font-size: 18px;
}

.rating-badge {
	background: #667eea;
	color: white;
	padding: 5px 12px;
	border-radius: 20px;
	font-size: 12px;
}

.no-data {
	text-align: center;
	padding: 50px;
	background: white;
	border-radius: 15px;
	grid-column: 1/-1;
	font-size: 18px;
	color: #6b7280;
}

.no-data a {
	color: #667eea;
	text-decoration: none;
	font-weight: bold;
}

.no-data a:hover {
	text-decoration: underline;
}

.btn-home {
	display: inline-block;
	margin: 40px auto 0;
	padding: 12px 35px;
	background: #667eea;
	color: white;
	text-decoration: none;
	border-radius: 30px;
	transition: all 0.3s;
}

.btn-home:hover {
	background: #5a67d8;
	transform: translateY(-2px);
}
</style>
</head>

<body>
	<div class="container">
		<h2>✨ Feedback Cards ✨</h2>

		<%
		if (request.getParameter("deleted") != null) {
		%>
		<div class="success-msg">✅ Feedback deleted successfully!</div>
		<%
		}

		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_db", "root", "Sejal@28");

		String deleteId = request.getParameter("delete");
		if (deleteId != null) {
			PreparedStatement ps = con.prepareStatement("DELETE FROM feedback WHERE id=?");
			ps.setInt(1, Integer.parseInt(deleteId));
			ps.executeUpdate();
			response.sendRedirect("viewFeedback.jsp?deleted=true");
			return;
		}

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM feedback ORDER BY id DESC");
		%>

		<div class="card-container">
			<%
			boolean hasData = false;
			while (rs.next()) {
				hasData = true;
				String name = rs.getString("name");
				String email = rs.getString("email");
				String feedback = rs.getString("feedback");
				int rating = rs.getInt("rating");
				int id = rs.getInt("id");

				// FIXED: Added null check for name to avoid exception
				String initial = (name != null && !name.isEmpty()) ? name.substring(0, 1).toUpperCase() : "?";
			%>

			<div class="card">
				<div class="card-header">
					<div class="user-info">
						<div class="avatar"><%=initial%></div>
						<div>
							<div class="name"><%=name != null ? name : "Anonymous"%></div>
							<div class="email"><%=email != null ? email : "No email"%></div>
						</div>
					</div>

					<a href="javascript:void(0)" onclick="confirmDelete(<%=id%>)"
						class="delete-btn">✕</a>
				</div>

				<div class="feedback-text">
					"<%=feedback != null ? feedback : "No feedback provided"%>"
				</div>

				<div class="rating-container">
					<div class="stars">
						<%
						for (int i = 1; i <= 5; i++) {
							if (i <= rating)
								out.print("★");
							else
								out.print("☆");
						}
						%>
					</div>
					<span class="rating-badge"><%=rating%>/5</span>
				</div>
			</div>

			<%
			}

			if (!hasData) {
			%>
			<div class="no-data">
				<p>📝 No feedback entries yet!</p>
				<a href="Form.jsp">➕ Add Feedback</a>
			</div>
			<%
			}

			rs.close();
			st.close();
			con.close();

			} catch (Exception e) {
			%>
			<div class="no-data">
				<p>
					❌ Error:
					<%=e.getMessage()%></p>
			</div>
			<%
			}
			%>
		</div>

		<div style="text-align: center;">
			<a href="Form.jsp" class="btn-home">← Back to Form</a>
		</div>
	</div>

	<script>
    function confirmDelete(id) {
        if (confirm("Are you sure you want to delete this feedback?")) {
            window.location = "viewFeedback.jsp?delete=" + id;
        }
    }
    </script>
</body>
</html>