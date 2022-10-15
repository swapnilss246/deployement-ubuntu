## ---- DROP DATABASE pgbooking; 

## -----------------create database "pgbooking" if not exists
## -----------  \! cls ----------->> clear screen
CREATE DATABASE IF NOT EXISTS pgbooking;


## -----------------use database "pgbooking"
USE pgbooking;


##---------------------------------------------------------------------------------------------------
## -----------------create table "paying_guest_houses"
CREATE TABLE paying_guest_houses(
    pg_id int AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    locality VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    amenities VARCHAR(255),
    pg_description VARCHAR(255),
    food_availability VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) UNIQUE,
    PRIMARY KEY(pg_id)  
);


##---------------------------------------------------------------------------------------------------
##-----------------create table "admins"
CREATE TABLE admins(
admin_id int AUTO_INCREMENT,
name VARCHAR(50) NOT NULL, 
email VARCHAR(40) NOT NULL UNIQUE,
password VARCHAR(15) NOT NULL,
phone VARCHAR(13) NOT NULL UNIQUE,
PRIMARY KEY(admin_id)
);

## -----------------insert data into table "customers"
INSERT INTO admins VALUES(DEFAULT, "Admin Dada", "admin@gmail.com",  "admin123", "8888888888");


##---------------------------------------------------------------------------------------------------
##-----------------create table "customers"
CREATE TABLE customers(
customer_id int AUTO_INCREMENT,
name VARCHAR(255) NOT NULL, 
email VARCHAR(255) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
phone VARCHAR(255) NOT NULL UNIQUE,
gender VARCHAR(255) NOT NULL,
city VARCHAR(255),
date_of_birth date,
PRIMARY KEY(customer_id)
);





##---------------------------------------------------------------------------------------------------
## -----------------create table "rooms"
CREATE TABLE rooms(
    room_id int AUTO_INCREMENT,
    sharing_type VARCHAR(255) NOT NULL,
    pg_id int NOT NULL,
    price DECIMAL(9,2) NOT NULL,
    occupancy_available int NOT NULL,
    PRIMARY KEY(room_id),
    FOREIGN KEY (pg_id) REFERENCES paying_guest_houses(pg_id)
);


##---------------------------------------------------------------------------------------------------
##----create table for booking details
CREATE TABLE bookings(
    booking_id int AUTO_INCREMENT,
    customer_id int NOT NULL, 
    room_id int NOT NULL,
    pg_id int NOT NULL,
    booking_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(9,2) NOT NULL,
    PRIMARY KEY(booking_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (pg_id) REFERENCES paying_guest_houses(pg_id)
);