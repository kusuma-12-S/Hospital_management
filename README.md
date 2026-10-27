# Hospital_management

# Hospital Management System

A web-based Hospital Management System developed using Java, JSP, Servlets, JDBC, and MySQL. It helps patients manage appointments and allows administrators to manage doctors and view patient appointments.

## Features

### Patient Module
- Patient registration and login
- View and update patient profile
- Book doctor appointments
- View appointment history
- Cancel appointments

### Admin Module
- Admin login and dashboard
- Add new doctors
- View registered doctors
- Update doctor details
- View all patient appointments

### Appointment Management
- Book appointments with available doctors
- Prevent duplicate bookings for the same doctor, date, and time using a database constraint
- Track appointment status

## Technologies Used

- **Backend:** Java, Servlets, JDBC
- **Frontend:** JSP, HTML, CSS, JavaScript
- **Database:** MySQL
- **Server:** Apache Tomcat 10
- **IDE:** Eclipse

## Project Structure

```text
Hospital-Management-System/
├── src/main/java/
│   ├── com/hospital/dao/
│   ├── com/hospital/model/
│   ├── com/hospital/util/
│   └── com/hospita/servlet/
├── src/main/webapp/
│   ├── register.jsp
│   ├── login.jsp
│   ├── patientDashboard.jsp
│   ├── adminLogin.jsp
│   ├── adminDashboard.jsp
│   ├── addDoctor.jsp
│   ├── adminDoctors.jsp
│   └── adminAppointments.jsp
└── README.md
```

*Note: The structure above is illustrative. Adjust it to match your actual Eclipse project.*

## Database Setup

1. Install MySQL.
2. Create a database named `hospital_db`.
3. Create the required tables: `patient`, `doctor`, `appointment`, and `admin`.
4. Configure your database connection in `DBConnection.java`.
5. Update the database username and password for your environment.

## How to Run

1. Clone or download this repository.
2. Import the project into Eclipse as a Dynamic Web Project.
3. Configure Apache Tomcat 10.
4. Add the MySQL Connector/J library.
5. Set up the MySQL database and connection credentials.
6. Run the project on Tomcat.
7. Open the patient registration page in your browser.

## Future Enhancements

- Password hashing and stronger authentication
- Search and filter doctors
- Appointment status management for administrators
- Improved form validation and error handling
- Responsive user interface

## Author

Developed as a Java web development project to practice MVC architecture, JDBC database connectivity, and CRUD operations.
