CREATE DATABASE FlightBookingDB;

USE FlightBookingDB;

CREATE TABLE Airports (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100),
    code VARCHAR(10) UNIQUE   -- example-, DEL, JFK
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(20) UNIQUE,
    airline VARCHAR(100),
    source_airport_id INT,
    destination_airport_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    FOREIGN KEY (source_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES Airports(airport_id)
);
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    passport_number VARCHAR(20) UNIQUE
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(5),
    status ENUM('Confirmed', 'Cancelled') DEFAULT 'Confirmed',
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    method ENUM('Credit Card', 'Debit Card', 'UPI', 'Net Banking'),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO Airports (name, city, country, code) VALUES
('Indira Gandhi International Airport', 'Delhi', 'India', 'DEL'),
('Chhatrapati Shivaji International Airport', 'Mumbai', 'India', 'BOM'),
('John F. Kennedy International Airport', 'New York', 'USA', 'JFK');
INSERT INTO Flights (flight_number, airline, source_airport_id, destination_airport_id, departure_time, arrival_time) VALUES
('AI101', 'Air India', 1, 2, '2025-08-01 10:00:00', '2025-08-01 12:30:00'),
('AI102', 'Air India', 2, 3, '2025-08-02 15:00:00', '2025-08-02 22:00:00');

INSERT INTO Passengers (full_name, email, phone, passport_number) VALUES
('Swagat Kumar', 'swagat@email.com', '9876543210', 'P1234567');

INSERT INTO Bookings (passenger_id, flight_id, booking_date, seat_number) VALUES
(1, 1, '2025-07-25', '12A');

INSERT INTO Payments (booking_id, amount, payment_date, method) VALUES
(1, 5500.00, '2025-07-25', 'UPI');
