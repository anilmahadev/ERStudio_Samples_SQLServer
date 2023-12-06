Creating a Hospital Administration Data Model involves designing a database that can handle entities like patients, doctors, medical records, appointments, departments, and staff. Here's a conceptual design for such a database, along with SQL DDL statements to create the tables and establish their relationships.

### Entities and Their Relationships:

1. **Patients**: Stores patient details.
2. **Doctors**: Information about doctors.
3. **Appointments**: Tracks appointments between patients and doctors.
4. **Medical Records**: Contains patient medical histories.
5. **Departments**: Different hospital departments.
6. **Staff**: Non-doctor hospital employees.
7. **Rooms**: Hospital room information.

### SQL Statements to Create Tables:

1. **Patients Table**:
   ```sql
   CREATE TABLE Patients (
       PatientID INT PRIMARY KEY IDENTITY(1,1),
       FirstName NVARCHAR(100) NOT NULL,
       LastName NVARCHAR(100) NOT NULL,
       DOB DATE NOT NULL,
       Gender NVARCHAR(10),
       Address NVARCHAR(255),
       Phone NVARCHAR(15)
   );
   ```

2. **Doctors Table**:
   ```sql
   CREATE TABLE Doctors (
       DoctorID INT PRIMARY KEY IDENTITY(1,1),
       FirstName NVARCHAR(100) NOT NULL,
       LastName NVARCHAR(100) NOT NULL,
       Specialization NVARCHAR(100) NOT NULL,
       DepartmentID INT
       -- Optional: FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
   );
   ```

3. **Appointments Table**:
   ```sql
   CREATE TABLE Appointments (
       AppointmentID INT PRIMARY KEY IDENTITY(1,1),
       PatientID INT NOT NULL,
       DoctorID INT NOT NULL,
       AppointmentTime DATETIME NOT NULL,
       FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
       FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
   );
   ```

4. **Medical Records Table**:
   ```sql
   CREATE TABLE MedicalRecords (
       RecordID INT PRIMARY KEY IDENTITY(1,1),
       PatientID INT NOT NULL,
       DateOfVisit DATETIME NOT NULL,
       Diagnosis NVARCHAR(255),
       Treatment NVARCHAR(255),
       FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
   );
   ```

5. **Departments Table**:
   ```sql
   CREATE TABLE Departments (
       DepartmentID INT PRIMARY KEY IDENTITY(1,1),
       Name NVARCHAR(100) NOT NULL,
       Description NVARCHAR(255)
   );
   ```

6. **Staff Table**:
   ```sql
   CREATE TABLE Staff (
       StaffID INT PRIMARY KEY IDENTITY(1,1),
       FirstName NVARCHAR(100) NOT NULL,
       LastName NVARCHAR(100) NOT NULL,
       Position NVARCHAR(100) NOT NULL,
       DepartmentID INT,
       FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
   );
   ```

7. **Rooms Table**:
   ```sql
   CREATE TABLE Rooms (
       RoomID INT PRIMARY KEY IDENTITY(1,1),
       RoomType NVARCHAR(50) NOT NULL,
       Capacity INT,
       DepartmentID INT,
       FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
   );
   ```

### Additional Considerations:

- **Normalization**: This design should be normalized to avoid data redundancy. For example, you might want to separate patient addresses into a different table if multiple patients can have the same address.
- **Data Types**: Adjust the data types and sizes according to the expected data. For instance, `NVARCHAR` sizes can be altered based on the maximum expected length of the data.
- **Constraints**: Consider adding more constraints for data integrity, such as `CHECK` constraints for valid dates and times.
- **Indexes**: Create indexes on frequently accessed columns, such as `PatientID` in the Appointments and Medical Records tables, for faster queries.
- **Security and Privacy**: Ensure that the design adheres to relevant data protection regulations, especially for sensitive patient data.
- **Extensibility**: Depending on the specific needs of the hospital, you might want to add more tables or fields, such as insurance information, emergency contacts for patients, or a table for prescription details.

This schema provides a basic structure for a hospital administration database. It can be expanded or modified based on specific hospital administration needs and requirements.
