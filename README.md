# HomeMovie---Movie-Management-System
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

**Admin Dashboard:** Full movie management table

**User Profile:** Personal movie dashboard

**Movie Forms:** Add/Update movie with comprehensive fields

🔮 Future Enhancements
User reviews and rating system

1. Integration with IMDb/TMDb APIs

2. Mobile applications (iOS/Android)

3. Cloud deployment and microservices migration

4. Advanced search and recommendation engine
