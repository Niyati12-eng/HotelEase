create database hotelDB;
use hotelDB;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique identifier for each user
    username VARCHAR(50) NOT NULL,          -- Username of the user
    password VARCHAR(100) NOT NULL,         -- Password for login (hashed for security)
    email VARCHAR(100) UNIQUE NOT NULL,     -- Email of the user (unique)
    contact VARCHAR(15),                    -- Contact number of the user
    role ENUM('Admin', 'User') DEFAULT 'User', -- Role: Admin or User
    status ENUM('Active', 'Inactive') DEFAULT 'Active', -- Account status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for account creation
);
INSERT INTO users (username, password, email, contact, role, status) VALUES
('admin', 'admin123', 'admin@example.com', '1234567890', 'Admin', 'Active'),
('john_doe', 'john123', 'john@example.com', '9876543210', 'User', 'Active'),
('jane_doe', 'jane123', 'jane@example.com', '8765432190', 'User', 'Active');

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique identifier for each room
    room_number VARCHAR(10) NOT NULL UNIQUE, -- Unique room number
    type ENUM('Single', 'Double', 'Suite') NOT NULL, -- Type of the room
    price DECIMAL(10, 2) NOT NULL,          -- Price per night
    availability ENUM('Available', 'Booked') DEFAULT 'Available', -- Room availability
    booked_by VARCHAR(50),                  -- Username of the user who booked the room
    booking_date TIMESTAMP NULL DEFAULT NULL, -- Date and time of booking
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Room creation timestamp
);
INSERT INTO rooms (room_number, type, price, availability) VALUES
('101', 'Single', 1200.00, 'Available'),
('102', 'Double', 2000.00, 'Available'),
('103', 'Suite', 5000.00, 'Available'),
('104', 'Double', 2200.00, 'Booked'),
('105', 'Single', 1300.00, 'Available');
ALTER TABLE rooms 
MODIFY booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
SELECT room_number, type, price, availability, booked_by, booking_date 
FROM rooms;

select * from users;
delete from rooms where room_number=4;