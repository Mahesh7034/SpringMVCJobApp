# Spring MVC Job Application Portal

A secure web-based job portal application built using Spring MVC framework with Spring Security authentication. The application allows authenticated users to browse jobs, apply for positions, and view their application history.

## Screenshots

### Login Page
![Login Page](screenshots/Screenshot 2026-01-07 124714.png)

### Home Page
![Home Page](screenshots/Screenshot2026-01-07124734.png)

### Job Details Page
![Job Details Page](screenshots/Screenshot2026-01-07124837)

### Apply Job
![Apply Job](screenshots/Screenshot2026-01-07124953)

### Profile Menu
![Profile Menu](screenshots/Screenshot2026-01-07124810)

### Profile Page
![Profile Page](screenshots/Screenshot2026-01-07124847)

### My Applications
![My Applications](screenshots/Screenshot2026-01-07124757)

### Post Job
![Post Job](screenshots/Screenshot2026-01-07124909)


## Features

- **User Authentication & Authorization**
  - Secure login/registration system with BCrypt password encryption (strength 12)
  - Only enrolled users can access the application
  
- **Job Management**
  - Browse all available job postings (public access)
  - Post new job opportunities
  - View detailed job descriptions
  
- **Application Management**
  - Apply for job positions
  - View personal application history
  - Track application status

- **Security**
  - Spring Security integration
  - BCrypt password encoding with 12-round strength
  - Session management
  - Protected endpoints

## Technologies Used

- **Framework**: Spring Boot with Spring MVC
- **Security**: Spring Security with BCryptPasswordEncoder (12 strength)
- **Build Tool**: Maven
- **Java Version**: Java 8+
- **Frontend**: JSP (JavaServer Pages)
- **Database**: MySQL
- **ORM**: Spring Data JPA / Hibernate
- **Server Port**: 9099

## Prerequisites

Before running this application, make sure you have the following installed:

- Java Development Kit (JDK) 8 or higher
- Maven 3.x
- MySQL Server (5.7 or higher)
- IDE (IntelliJ IDEA, Eclipse, or VS Code recommended)

## Database Setup

1. **Create MySQL Database**

```sql
CREATE DATABASE telusko;
USE telusko;
```

2. **Database Configuration**

The application uses the following database configuration (already configured in `application.properties`):

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/telusko
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update
```

The tables will be automatically created when you run the application for the first time due to `hibernate.ddl-auto=update`.

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/Mahesh7034/SpringMVCJobApp.git
cd SpringMVCJobApp
```

### Build the Project

```bash
./mvnw clean install
```

Or on Windows:

```cmd
mvnw.cmd clean install
```

### Run the Application

```bash
./mvnw spring-boot:run
```

Or on Windows:

```cmd
mvnw.cmd spring-boot:run
```

The application will start on `http://localhost:9099`

## Application Configuration

The application is configured with the following properties:

```properties
spring.application.name=JobApp
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
server.port=9099
spring.datasource.url=jdbc:mysql://localhost:3306/telusko
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update
```

## Project Structure

```
SpringMVCJobApp/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── [package]/
│   │   │           ├── config/
│   │   │           │   └── SecurityConfig.java
│   │   │           ├── controller/
│   │   │           │   ├── JobController.java
│   │   │           │   ├── ApplicationController.java
│   │   │           │   └── AuthController.java
│   │   │           ├── model/
│   │   │           │   ├── User.java
│   │   │           │   ├── Job.java
│   │   │           │   └── JobApplication.java
│   │   │           ├── repository/
│   │   │           │   ├── UserRepository.java
│   │   │           │   ├── JobRepository.java
│   │   │           │   └── ApplicationRepository.java
│   │   │           └── service/
│   │   │               ├── UserService.java
│   │   │               ├── JobService.java
│   │   │               └── ApplicationService.java
│   │   ├── resources/
│   │   │   └── application.properties
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── views/
│   │               ├── login.jsp
│   │               ├── register.jsp
│   │               ├── home.jsp
│   │               ├── jobs.jsp
│   │               ├── job-details.jsp
│   │               ├── my-applications.jsp
│   │               └── post-job.jsp
│   └── test/
├── pom.xml
└── README.md
```

## Security Features

### Password Encryption
- All user passwords are encrypted using BCryptPasswordEncoder with strength 12
- This provides strong security against brute-force attacks

### Authentication Flow
1. New users register through the registration page
2. Passwords are hashed and stored securely in the database
3. Users must log in to access protected features
4. Spring Security manages session and authentication state

### Authorization
- **Public Access**: Job listings are visible to all users
- **Authenticated Access**: 
  - Apply for jobs
  - View personal applications
  - Post new jobs

## Usage Guide

### 1. First Time Setup

1. Navigate to `http://localhost:9099` in your web browser
2. Click on "Register" to create a new account
3. Fill in your details (username, email, password)
4. Your password will be encrypted with BCrypt (12 strength)

### 2. Login

1. Use your registered credentials to log in
2. You will be authenticated and granted access to the application

### 3. Browse Jobs

- View all available job postings on the jobs page
- Click on any job to see detailed information
- Job postings are visible to everyone

### 4. Apply for Jobs

- Click "Apply" on any job listing you're interested in
- Your application will be submitted and stored

### 5. View Your Applications

- Navigate to "My Applications" to see all jobs you've applied for
- Track the status of your applications
- Only you can see your own applications

### 6. Post a Job

- Use the "Post Job" feature to create new job listings
- Fill in job details (title, description, requirements, etc.)
- Posted jobs will be visible to all users

## API Endpoints

### Authentication
- `GET /login` - Login page
- `POST /login` - Process login
- `GET /register` - Registration page
- `POST /register` - Process registration
- `POST /logout` - Logout user

### Job Management
- `GET /jobs` - View all jobs (public)
- `GET /jobs/{id}` - View specific job details (public)
- `POST /jobs` - Post a new job (authenticated)
- `GET /post-job` - Job posting form (authenticated)

### Application Management
- `POST /apply/{jobId}` - Apply for a job (authenticated)
- `GET /my-applications` - View personal applications (authenticated)
- `GET /applications` - View all applications (authenticated)

## Security Configuration

The application uses Spring Security with the following configuration:

- BCryptPasswordEncoder with strength 12 for password hashing
- Form-based authentication
- Session management
- CSRF protection enabled
- Remember-me functionality (optional)

## Default User Roles

The application supports user roles for different access levels:
- **USER**: Can browse jobs, apply for jobs, view own applications
- **ADMIN**: (If implemented) Can manage all jobs and applications

## Troubleshooting

### Database Connection Issues
- Ensure MySQL server is running on port 3306
- Verify database credentials in `application.properties`
- Check if `telusko` database exists

### Port Already in Use
If port 9099 is already in use, you can change it in `application.properties`:
```properties
server.port=8080
```

### JSP Pages Not Loading
- Ensure JSP files are in `/src/main/webapp/WEB-INF/views/`
- Verify view prefix and suffix in application.properties
- Add Tomcat Embed Jasper dependency if missing

## Dependencies

Key dependencies used in this project:

```xml
<dependencies>
    <!-- Spring Boot Starter Web -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    
    <!-- Spring Boot Starter Security -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-security</artifactId>
    </dependency>
    
    <!-- Spring Boot Starter Data JPA -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    
    <!-- MySQL Driver -->
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
    </dependency>
    
    <!-- JSP Support -->
    <dependency>
        <groupId>org.apache.tomcat.embed</groupId>
        <artifactId>tomcat-embed-jasper</artifactId>
    </dependency>
    
    <!-- JSTL -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>jstl</artifactId>
    </dependency>
</dependencies>
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Future Enhancements

- [ ] Admin dashboard for managing users and applications
- [ ] Email notifications for application updates
- [ ] Advanced job search with filters
- [ ] Resume upload functionality
- [ ] Company profiles
- [ ] Application status tracking
- [ ] OAuth2 integration (Google, LinkedIn login)

## License

This project is open source and available under the [MIT License](LICENSE).

## Contact

Mahesh - [@Mahesh7034](https://github.com/Mahesh7034)

Project Link: [https://github.com/Mahesh7034/SpringMVCJobApp](https://github.com/Mahesh7034/SpringMVCJobApp)

## Acknowledgments

- Spring Framework Team
- Spring Security Documentation
- Hibernate ORM
- MySQL Community
- Telusko Learning Platform
