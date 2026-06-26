# Food Delivery Database System

## Overview
This project is a database system design for a food delivery application. The project includes the full database design process, starting from requirements analysis, then ER and EER modeling, relational mapping, and finally SQL implementation.

## Project Idea
Food delivery applications are widely used in daily life because they provide convenience and efficiency for customers, restaurants, and drivers. This project designs a database system that manages the main operations of a food delivery platform.

## Main Entities
The database includes the following main entities:

- Customer
- Restaurant
- Driver
- Order
- Menu Item
- Payment

## Database Requirements
The system supports:
- Customers placing one or more orders
- Restaurants offering menu items
- Orders containing multiple menu items
- Drivers delivering orders
- Payments linked to orders as a weak entity
- Customer referral relationship
- Menu item specialization into Main Course and Dessert
- Driver specialization into Car Driver and Bike Driver

## ER and EER Design
The project includes:
- ER Diagram
- EER Diagram
- Entity attributes
- Relationship constraints
- Specialization and generalization
- Weak entity representation
- Recursive relationship for customer referrals

## Relational Mapping
The conceptual design was mapped into relational tables such as:

- Customer
- Customer_Phone
- Restaurant
- Restaurant_Location
- Driver
- Car_Driver
- Bike_Driver
- Order_Table
- Payment
- Menu_Item
- Main_Course
- Dessert
- Order_Details

## SQL Implementation
The SQL file includes table creation statements with:
- Primary keys
- Foreign keys
- Unique constraints
- Weak entity mapping
- Many-to-many relationship mapping
- Specialization tables
- Sample inserted data

## Files in This Repository
```text
Food-Delivery-Database-System/
│
├── Data_base_project.pdf
├── data base _code _project.sql
└── README.md
