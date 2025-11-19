<img width="605" height="278" alt="image" src="https://github.com/user-attachments/assets/0b0161d7-3179-4c9a-b606-12bf75fb2d96" /># HomeMovie---Movie-Management-System
A full-stack web application built with J2EE, Servlets, and JSP. Features role-based access control, CRUD operations, and responsive Bootstrap UI. Admins manage all movies while users control their personal collections. Powered by Apache Derby and Tomcat.


**Abstract**
Movie Management Systems play an essential role in simplifying how multimedia content is curated, accessed, and administered, especially in environments where efficient cataloging and retrieval are required. Traditional systems for managing movies—such as manual spreadsheets, local databases, or static websites—often lack scalability, interactive user interfaces, and robust administrative controls. These limitations make content management inefficient, particularly as the volume of movies increases. In response to these challenges, this project introduces HomeMovie, a dynamic web-based Movie Management System developed 
using J2EE technologies. 
The system is built with the Java Development Kit (JDK 24.0.1) and structured using the Eclipse IDE 2025-06 M3, with Apache Tomcat 10.1.x acting as the servlet container. The backend utilizes a layered Web Application Architecture comprising controllers, data access 
objects (DAOs), and model classes to facilitate movie CRUD (Create, Read, Update, Delete) operations. Apache Derby (10.17.1.0) serves as the relational database, and Apache Maven is employed for dependency management and project build automation. On the frontend, the 
system incorporates JSP (JavaServer Pages) with integrated Bootstrap 5.3.3 for a responsive and user-friendly interface. 
The HomeMovie application uses separate user and admin modules, enabling movie CRUD operations and dedicated dashboards. Reusable components enhance modularity. The database is initialized via SQL scripts. This J2EE web application aims to streamline digital media management, improve user interaction, and ensure scalable deployment for future content growth by integrating modern development practices and clear separation of concerns. 

**Keywords:** Movie Management System, CRUD Operations, Web Application Architecture, 
J2EE.


**🚀 Features**
**🎯 Role-Based Access:** Separate dashboards for Admins (full control) and Users (personal movies)

**📝 CRUD Operations:** Create, Read, Update, Delete movies with detailed metadata

**🔐 Secure Authentication:** Email/password login with session management

**📱 Responsive Design:** Bootstrap 5-powered mobile-friendly interface

**🗄️ Database Integration:** Apache Derby for persistent data storage

**🎨 Dynamic Content:** Categorized movie sections (Today's Special, Movies of 2025)

---------------------------

**🛠️ Technology Stack**
**Backend:** J2EE (Servlets, JSP), Java JDK 24

**Frontend:** JSP, Bootstrap 5.3.3, CSS, JavaScript

**Database:** Apache Derby 10.17.1.0

**Server:** Apache Tomcat 10.1.x

**Build Tool:** Apache Maven 3.9.9

**IDE:** Eclipse 2025-06 M3



**📁 System Architecture**


**Three-Tier Architecture:**

**Presentation Layer:** JSP pages with Bootstrap components

**Business Logic:** Java Servlets handling requests and application logic

**Persistence Layer:** DAO pattern with Apache Derby database

---------------------------
**🗃️ Database Schema**

**Key Tables:**

1. Users - User credentials and roles

2. Movies - Movie details (title, director, genre, rating, poster_url, etc.)

3. UserMovies - User-movie relationships

4. Roles - Access level definitions
   

**🎯 Key Modules**

**Admin Module:** Full system control and user management

**User Module:** Personal movie management dashboard

**Authentication Module:** Secure login/registration system

**Movie Management:** Comprehensive CRUD operations



**📊 Testing & Quality**

**Unit Testing:** 98% success rate (52 test cases)

**Integration Testing:** 100% success rate (30 test cases)

**System Testing:** End-to-end workflow validation

**Security Testing:** Session validation and access control

**UAT:** 15 participants with 95%+ task completion rates

---------------------------

**🚀 Getting Started**
# Clone and deploy on Tomcat
mvn clean install
# Deploy WAR file to Tomcat server

# Access at: http://localhost:8080/HomeMovie

# 📸 Screenshots
**Homepage:** Dynamic movie cards by category

<img width="626" height="332" alt="image" src="https://github.com/user-attachments/assets/7462fc3a-4c27-4eea-b451-e9f2e175ed34" />
<img width="621" height="580" alt="image" src="https://github.com/user-attachments/assets/ebbaa4e5-4600-4ef8-abfe-c838f8752bb6" />


**Admin Dashboard:** Full movie management table
<img width="623" height="332" alt="image" src="https://github.com/user-attachments/assets/c3775f7a-0662-4106-a2f7-a92275316d0b" />


**User Profile:** Personal movie dashboard

<img width="607" height="290" alt="image" src="https://github.com/user-attachments/assets/a281ee68-4ca3-4d44-a671-cf732f5fac72" />

**Movie Forms:** Add/Update movie with comprehensive fields
<img width="605" height="278" alt="image" src="https://github.com/user-attachments/assets/c11e8bd3-3da1-4a5d-9249-5e1a0209f43b" />
<img width="605" height="290" alt="image" src="https://github.com/user-attachments/assets/5a9b06f8-c8ba-4480-826a-5e21e71cc33f" />


Comprehensive testing ensured system reliability and performance:

✅ Unit Testing - 98% success rate (52 test cases)

**DAO methods:** addMovie(), getAllMovies(), updateMovie(), deleteMovie()

**Utility functions:** data validation and formatting


# Controller servlet logic

1. 🔗 Integration Testing - 100% success rate (30 test cases)

2. End-to-end flows: JSP → Servlet → DAO → Database

3. Movie creation, update, deletion workflows

4. User authentication & session management

5. Data retrieval and display validation


# 🌐 System Testing

1. Complete CRUD operations validation

2. Role-based access control verification

3. Multi-module integration testing
   

# 👥 User Acceptance Testing - 95%+ task completion

1. 15 participants (5 admins, 10 users)

2. Successful login rates: 100%

3. Navigation satisfaction: 4.2/5 rating
   

# 🛡️ Security Testing

1. Session validation

2. Admin page access restrictions

3. Unauthorized URL access prevention


# 📊 Performance Metrics

1. Admin dashboard load: 485ms (50 movies)

2. User login: 230ms response time

3. CRUD operations within expected thresholds
