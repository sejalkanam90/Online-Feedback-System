# 🌐 Online Feedback System

A full-stack JSP-based web application for collecting, storing, and managing user feedback efficiently.

---

## ✨ Features

- **Feedback Form**: User-friendly form with name, email, rating, and feedback  
- **MySQL Database**: Persistent storage of all feedback entries  
- **Responsive Design**: Beautiful gradient background with smooth animations  
- **View Feedback**: Card-based display of all feedback entries  
- **Delete Functionality**: Remove feedback entries with confirmation dialog  
- **Rating System**: 5-star rating with visual representation  
- **Email Validation**: Basic email format validation  
- **SQL Injection Protection**: Using PreparedStatement  

---

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| JSP (JavaServer Pages) | Backend logic and dynamic content |
| MySQL | Database storage |
| HTML5/CSS3 | Frontend structure and styling |
| JavaScript | Delete confirmation and interactions |
| Apache Tomcat | Web server |
| JDBC | Database connectivity |

---

## 📋 Prerequisites

Before running this project, make sure you have:

- JDK 8 or higher  
- Apache Tomcat 8+  
- MySQL Server 5.7+  
- MySQL Connector/J JAR file  
- Modern web browser  

---

## 🗄️ Database Setup

### Step 1: Create Database
```sql
CREATE DATABASE feedback_db;
USE feedback_db;
Step 2: Create Table
CREATE TABLE feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    feedback TEXT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
Step 3: Verify Table
DESCRIBE feedback;
SHOW TABLES;
🚀 Installation Guide
1. Clone the Repository
git clone https://github.com/sejalkanam90/Online-Feedback-System.git
2. Configure Database Connection

Open the JSP files and update database credentials:

String DB_URL = "jdbc:mysql://localhost:3306/feedback_db";
String DB_USER = "root";
String DB_PASSWORD = "your_password";
3. Add MySQL JDBC Driver

Place mysql-connector-j-8.0.33.jar in:

WEB-INF/lib/
4. Deploy to Tomcat

Copy the project folder to:

Tomcat/webapps/feedback/
5. Start Tomcat Server
# Windows
startup.bat

# Linux/Mac
./startup.sh
6. Access the Application
http://localhost:8080/feedback/Form.jsp
📁 Project Structure
Online-Feedback-System/
│
├── Form.jsp
├── FeedBackForm.jsp
├── viewFeedback.jsp
│
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── web.xml
│   │   └── lib/
│   │       └── mysql-connector-j-8.0.33.jar
👨‍💻 Author

Sejal Kanam

GitHub: https://github.com/sejalkanam90

Email: sejalkanam7@gmail.com

📄 License

MIT License
This project is for educational purposes only.

🔗 Repository: https://github.com/sejalkanam90/Online-Feedback-System
