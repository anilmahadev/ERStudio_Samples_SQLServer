--Creating an Airline Database involves designing various tables to represent entities like flights, passengers, aircraft, pilots, and bookings. Below is a conceptual design for such a database with SQL DDL statements to create the tables and establish their relationships.

--### Entities and Their Relationships:

--1. Flights: Details about each flight.
--2. Aircraft: Information about aircraft.
--3. Pilots: Information about pilots.
--4. Passengers: Details of passengers.
--5. Bookings: Records of flight bookings by passengers.
--6. FlightCrew: Assigning crew to flights.

--The relationships between these entities can be defined as follows:
--- A flight is associated with one aircraft and one or more pilots.
--- Passengers make bookings for flights.
--- A flight crew is assigned to each flight.

-- SQL Statements to Create Tables:

-- Aircraft Table:
   
   CREATE TABLE Aircraft (
       AircraftID INT PRIMARY KEY IDENTITY(1,1),
       Model NVARCHAR(50) NOT NULL,
       Capacity INT NOT NULL
   );
   

--Pilots Table:
   
   CREATE TABLE Pilots (
       PilotID INT PRIMARY KEY IDENTITY(1,1),
       Name NVARCHAR(100) NOT NULL,
       LicenseNumber NVARCHAR(50) NOT NULL,
       Rank NVARCHAR(50)
   );
   

-- Flights Table:
   
   CREATE TABLE Flights (
       FlightID INT PRIMARY KEY IDENTITY(1,1),
       DepartureTime DATETIME NOT NULL,
       ArrivalTime DATETIME NOT NULL,
       Origin NVARCHAR(100) NOT NULL,
       Destination NVARCHAR(100) NOT NULL,
       AircraftID INT,
       FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)
   );
   

--Passengers Table:
   
   CREATE TABLE Passengers (
       PassengerID INT PRIMARY KEY IDENTITY(1,1),
       FirstName NVARCHAR(50) NOT NULL,
       LastName NVARCHAR(50) NOT NULL,
       PassportNumber NVARCHAR(50) NOT NULL
   );
   
--Bookings Table:
   
   CREATE TABLE Bookings (
       BookingID INT PRIMARY KEY IDENTITY(1,1),
       FlightID INT NOT NULL,
       PassengerID INT NOT NULL,
       BookingDate DATETIME NOT NULL,
       SeatNumber NVARCHAR(10),
       FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
       FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
   );
   

--FlightCrew Table:
   
   CREATE TABLE FlightCrew (
       FlightCrewID INT PRIMARY KEY IDENTITY(1,1),
       FlightID INT NOT NULL,
       PilotID INT NOT NULL,
       Role NVARCHAR(50),
       FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
       FOREIGN KEY (PilotID) REFERENCES Pilots(PilotID)
   );
   
