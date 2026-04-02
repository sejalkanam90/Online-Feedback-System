# Online Feedback System

A comprehensive JSP-based web application for collecting, storing, and managing user feedback with a modern, responsive UI.

## ✨ Features

- **Feedback Form**: User-friendly form with name, email, rating, and feedback
- **MySQL Database**: Persistent storage of all feedback entries
- **Responsive Design**: Beautiful gradient background with smooth animations
- **View Feedback**: Card-based display of all feedback entries
- **Delete Functionality**: Remove feedback entries with confirmation dialog
- **Rating System**: 5-star rating with visual representation
- **Email Validation**: Basic email format validation
- **SQL Injection Protection**: Using PreparedStatement

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| JSP (JavaServer Pages) | Backend logic and dynamic content |
| MySQL | Database storage |
| HTML5/CSS3 | Frontend structure and styling |
| JavaScript | Delete confirmation and interactions |
| Apache Tomcat | Web server |
| JDBC | Database connectivity |

## 📋 Prerequisites

Before running this project, make sure you have:

- JDK 8 or higher
- Apache Tomcat 8+
- MySQL Server 5.7+
- MySQL Connector/J JAR file
- Modern web browser

## 🗄️ Database Setup

### Step 1: Create Database

Open MySQL and run:

```sql
CREATE DATABASE feedback_db;
USE feedback_db;
Step 2: Create Table
sql
CREATE TABLE feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    feedback TEXT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
Step 3: Verify Table
sql
DESCRIBE feedback;
SHOW TABLES;
🚀 Installation Guide
1. Clone the Repository
bash
git clone https://github.com/sejalkanam90/Online-Feedback-System.git
2. Configure Database Connection
Open the JSP files and update database credentials:

java
String DB_URL = "jdbc:mysql://localhost:3306/feedback_db";
String DB_USER = "root";
String DB_PASSWORD = "Sejal@28";
3. Add MySQL JDBC Driver
Place mysql-connector-j-8.0.33.jar in:

text
WEB-INF/lib/
4. Deploy to Tomcat
Copy the project folder to:

text
Tomcat/webapps/feedback/
5. Start Tomcat Server
bash
# Windows
startup.bat

# Linux/Mac
./startup.sh
6. Access the Application
Open browser and go to:

text
http://localhost:8080/feedback/Form.jsp
📁 Project Structure
text
Online-Feedback-System/
│
├── Form.jsp                    # Main feedback form page
├── FeedBackForm.jsp            # Form submission handler
├── viewFeedback.jsp            # Display all feedback entries
│
├── .classpath                  # Eclipse classpath
├── .project                    # Eclipse project file
│
├── .settings/                  # Eclipse settings folder
│
├── src/
│   └── main/
│       └── webapp/
│           ├── Form.jsp
│           ├── FeedBackForm.jsp
│           ├── viewFeedback.jsp
│           │
│           ├── WEB-INF/
│           │   ├── web.xml
│           │   └── lib/
│           │       └── mysql-connector-j-8.0.33.jar
│           │
│           └── META-INF/
│               └── MANIFEST.MF
│
└── README.md                   # Project documentation
👨‍💻 Author
Sejal Kanam

GitHub:sejalkanam90

Email:sejalkanam7@gmail.com

📄 License
MIT License

⭐ Star this repository if you find it helpful!
Repository URL: https://github.com/sejalkanam90/Online-Feedback-System
