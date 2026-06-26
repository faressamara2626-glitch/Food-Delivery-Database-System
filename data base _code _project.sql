--tables
CREATE TABLE Customer
(
    Customer_ID   INT PRIMARY KEY,
    Name          VARCHAR(30) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Age           INT,
    Street        VARCHAR(50),
    City          VARCHAR(30),
    Building_No   INT,
    Floor         INT,
    Email         VARCHAR(100) UNIQUE,
    Referrer_ID   INT,
    CONSTRAINT fk_referrer FOREIGN KEY (Referrer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Customer_Phone
(
    Phone         VARCHAR(20),
    Customer_ID   INT,
    PRIMARY KEY (Phone, Customer_ID),
    CONSTRAINT fk_customer_phone FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Restaurant
(
    Restaurant_ID INT PRIMARY KEY,
    Name          VARCHAR(100) UNIQUE,
    Rating        DECIMAL(2,1)
);

CREATE TABLE Restaurant_Location
(
    Location       VARCHAR(100),
    Restaurant_ID  INT,
    PRIMARY KEY (Location, Restaurant_ID),
    CONSTRAINT fk_restaurant_loc FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Driver
(
    Driver_ID   INT PRIMARY KEY,
    Name        VARCHAR(30),
    License_No  VARCHAR(15) UNIQUE,
    Hire_Date   DATE
);

CREATE TABLE Car_Driver
(
    Driver_ID    INT PRIMARY KEY,
    Vehicle_Make VARCHAR(30),
    CONSTRAINT fk_car_driver FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

CREATE TABLE Bike_Driver
(
    Driver_ID           INT PRIMARY KEY,
    Insurance_Policy_No VARCHAR(15),
    CONSTRAINT fk_bike_driver FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

CREATE TABLE Order_Table
(
    Order_ID      INT PRIMARY KEY,
    Status        VARCHAR(30),
    Order_Time    DATE,
    Delivery_Time DATE,
    Customer_ID   INT,
    Driver_ID     INT,
    CONSTRAINT fk_order_customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_order_driver FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

CREATE TABLE Payment
(
    paymentNO    INT,
    OrderID      INT,
    Amount       DECIMAL(10,2),
    PaymentDate  DATE,
    PRIMARY KEY (paymentNO, OrderID),
    CONSTRAINT fk_payment_order FOREIGN KEY (OrderID) REFERENCES Order_Table(Order_ID)
);

CREATE TABLE Menu_Item
(
    Item_ID       INT PRIMARY KEY,
    Name          VARCHAR(50),
    Description   VARCHAR(100),
    Price         DECIMAL(10,2),
    Restaurant_ID INT,
    CONSTRAINT fk_menu_restaurant FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Main_Course
(
    Item_ID INT PRIMARY KEY,
    CONSTRAINT fk_main_course FOREIGN KEY (Item_ID) REFERENCES Menu_Item(Item_ID)
);

CREATE TABLE Dessert
(
    Item_ID INT PRIMARY KEY,
    CONSTRAINT fk_dessert FOREIGN KEY (Item_ID) REFERENCES Menu_Item(Item_ID)
);

CREATE TABLE Order_Details
(
    Item_ID  INT,
    Order_ID INT,
    PRIMARY KEY (Item_ID, Order_ID),
    CONSTRAINT fk_order_details_item FOREIGN KEY (Item_ID) REFERENCES Menu_Item(Item_ID),
    CONSTRAINT fk_order_details_order FOREIGN KEY (Order_ID) REFERENCES Order_Table(Order_ID)
);

--insert
INSERT INTO Customer VALUES (1, 'ahmad', TO_DATE('1995-02-15','YYYY-MM-DD'), 31, 'king abdullah', 'Amman', 12, 3, 'ahmad@gmail.com', NULL);
INSERT INTO Customer VALUES (2, 'abdullah mansour', TO_DATE('1990-06-10','YYYY-MM-DD'), 35, 'wasfi altal', 'Amman', 5, 2, 'abdman@gmail.com', 1);
INSERT INTO Customer VALUES (3, 'abdallah mohammad', TO_DATE('2000-09-20','YYYY-MM-DD'), 25, 'Khalil elsakit', 'Amman', 18, 1, 'abdmohe@gmail.com', 2);
INSERT INTO Customer VALUES (4, 'mohammad shahwan', TO_DATE('1998-12-05','YYYY-MM-DD'), 27, 'shawerma st', 'Amman', 22, 4, 'mhmdshah@gmail.com', NULL);
INSERT INTO Customer VALUES (5, 'omar', TO_DATE('1992-03-30','YYYY-MM-DD'), 33, 'jordan st', 'Amman', 9, 1, 'omarzaga@gmail.com', 3);

INSERT INTO Customer_Phone VALUES ('0791234567', 1);
INSERT INTO Customer_Phone VALUES ('0792370283', 2);
INSERT INTO Customer_Phone VALUES ('0770750749', 3);
INSERT INTO Customer_Phone VALUES ('0778457199', 4);
INSERT INTO Customer_Phone VALUES ('0791190345', 5);

INSERT INTO Restaurant VALUES (1, 'Almousili', 4.5);
INSERT INTO Restaurant VALUES (2, 'Sushi Crush', 4.8);
INSERT INTO Restaurant VALUES (3, 'fire fly', 4.2);
INSERT INTO Restaurant VALUES (4, 'buffalo', 4.8);
INSERT INTO Restaurant VALUES (5, 'Sweet & Treats', 4.7);

INSERT INTO Restaurant_Location VALUES ('almanhal circule', 1);
INSERT INTO Restaurant_Location VALUES ('abdon', 2);
INSERT INTO Restaurant_Location VALUES ('Jabal Amman', 3);
INSERT INTO Restaurant_Location VALUES ('Mecca St', 4);
INSERT INTO Restaurant_Location VALUES ('Abdali', 5);

INSERT INTO Driver VALUES (1, 'faris smarh', 'L12345', TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO Driver VALUES (2, 'abdalrazaq', 'L67890', TO_DATE('2019-03-15','YYYY-MM-DD'));
INSERT INTO Driver VALUES (3, 'zaid ahmad', 'L54321', TO_DATE('2021-05-10','YYYY-MM-DD'));
INSERT INTO Driver VALUES (4, 'nader ali', 'L98765', TO_DATE('2018-07-22','YYYY-MM-DD'));
INSERT INTO Driver VALUES (5, 'batman', 'L14323', TO_DATE('2022-09-01','YYYY-MM-DD'));
INSERT INTO Driver VALUES (6, 'ali mhmd', 'L52345', TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO Driver VALUES (7, 'tariq', 'L67790', TO_DATE('2019-03-15','YYYY-MM-DD'));
INSERT INTO Driver VALUES (8, 'nour', 'L54221', TO_DATE('2021-05-10','YYYY-MM-DD'));
INSERT INTO Driver VALUES (9, 'sarah', 'L92765', TO_DATE('2018-07-22','YYYY-MM-DD'));
INSERT INTO Driver VALUES (10, 'leen', 'L11223', TO_DATE('2022-09-01','YYYY-MM-DD'));

INSERT INTO Car_Driver VALUES (1, 'Ford fusion');
INSERT INTO Car_Driver VALUES (2, 'Honda Civic');
INSERT INTO Car_Driver VALUES (3, 'Ford Focus');
INSERT INTO Car_Driver VALUES (4, 'corola');
INSERT INTO Car_Driver VALUES (5, 'camrey');

INSERT INTO Bike_Driver VALUES (6, 'INS12345');
INSERT INTO Bike_Driver VALUES (7, 'INS67890');
INSERT INTO Bike_Driver VALUES (8, 'INS54321');
INSERT INTO Bike_Driver VALUES (9, 'INS98765');
INSERT INTO Bike_Driver VALUES (10, 'INS11223');

INSERT INTO Order_Table VALUES (1, 'Delivered', TO_DATE('2026-01-01','YYYY-MM-DD'), TO_DATE('2026-01-01','YYYY-MM-DD'), 1, 1);
INSERT INTO Order_Table VALUES (2, 'Pending', TO_DATE('2026-01-02','YYYY-MM-DD'), NULL, 2, 2);
INSERT INTO Order_Table VALUES (3, 'Cancelled', TO_DATE('2026-01-03','YYYY-MM-DD'), NULL, 3, 9);
INSERT INTO Order_Table VALUES (4, 'Delivered', TO_DATE('2026-01-04','YYYY-MM-DD'), TO_DATE('2026-01-04','YYYY-MM-DD'), 4, 4);
INSERT INTO Order_Table VALUES (5, 'Delivered', TO_DATE('2026-01-05','YYYY-MM-DD'), TO_DATE('2026-01-05','YYYY-MM-DD'), 5, 7);

INSERT INTO Payment VALUES (1, 1, 20.50, TO_DATE('2026-01-01','YYYY-MM-DD'));
INSERT INTO Payment VALUES (2, 2, 35.75, TO_DATE('2026-01-02','YYYY-MM-DD'));
INSERT INTO Payment VALUES (3, 3, 15.00, TO_DATE('2026-01-03','YYYY-MM-DD'));
INSERT INTO Payment VALUES (4, 4, 40.25, TO_DATE('2026-01-04','YYYY-MM-DD'));
INSERT INTO Payment VALUES (5, 5, 10.00, TO_DATE('2026-01-05','YYYY-MM-DD'));

INSERT INTO Menu_Item VALUES (1, 'shawarma double', 'shawarma double and fries and pepsi', 4.50, 1);
INSERT INTO Menu_Item VALUES (2, 'California Roll', '8 pcs sushi roll', 8.75, 2);
INSERT INTO Menu_Item VALUES (3, 'Cheeseburger', 'Beef burger with cheese', 10.00, 3);
INSERT INTO Menu_Item VALUES (4, 'Spaghetti', 'Classic spaghetti with buffalo sauce', 9.50, 4);
INSERT INTO Menu_Item VALUES (5, 'Chocolate Cake', 'chocolate dessert with cream on top', 6.00, 5);

INSERT INTO Main_Course VALUES (1);
INSERT INTO Main_Course VALUES (2);
INSERT INTO Main_Course VALUES (3);
INSERT INTO Main_Course VALUES (4);
INSERT INTO Dessert VALUES (5);

INSERT INTO Order_Details VALUES (1, 1);
INSERT INTO Order_Details VALUES (2, 2);
INSERT INTO Order_Details VALUES (3, 4);
INSERT INTO Order_Details VALUES (5, 5);

--modifying
UPDATE Customer SET Age = 32 WHERE Customer_ID = 1;
UPDATE Customer_Phone SET Phone = '0799342726' WHERE Customer_ID = 2;
UPDATE Restaurant SET Rating = 4.9 WHERE Restaurant_ID = 3;
UPDATE Restaurant_Location SET Location = 'aqaba' WHERE Restaurant_ID = 5;
UPDATE Driver SET Name = 'Faris Samarah' WHERE Driver_ID = 1;
UPDATE Car_Driver SET Vehicle_Make = 'Tesla Model 3' WHERE Driver_ID = 4;
UPDATE Bike_Driver SET Insurance_Policy_No = 'INS00000' WHERE Driver_ID = 8;
UPDATE Order_Table SET Status = 'Completed' WHERE Order_ID = 4;
UPDATE Payment SET Amount = 38.00 WHERE OrderID = 2;
UPDATE Menu_Item SET Description = 'Classic spaghetti with extra sauce' WHERE Item_ID = 4;
UPDATE Order_Details SET Item_ID = 2 WHERE Order_ID = 2;

--deleting
DELETE FROM Order_Details WHERE Order_ID = 3;
DELETE FROM Payment WHERE OrderID = 3;
DELETE FROM Order_Table WHERE Order_ID = 3;
DELETE FROM Bike_Driver WHERE Driver_ID = 10;
DELETE FROM Car_Driver WHERE Driver_ID = 5;
DELETE FROM Driver WHERE Driver_ID = 10;
DELETE FROM Customer_Phone WHERE Customer_ID = 3;
DELETE FROM Customer WHERE Customer_ID = 3;
DELETE FROM Main_Course WHERE Item_ID = 1;
DELETE FROM Dessert WHERE Item_ID = 5;
DELETE FROM Menu_Item WHERE Item_ID = 5;
DELETE FROM Restaurant_Location WHERE Restaurant_ID = 5;
DELETE FROM Restaurant WHERE Restaurant_ID = 5;

--queries
-- total payment amount for each customer
SELECT  c.Name, SUM(p.Amount)
FROM Customer c
JOIN Order_Table o ON c.Customer_ID = o.Customer_ID
JOIN Payment p ON o.Order_ID = p.OrderID
GROUP BY c.Name;

--highest priced menu item in each restaurant
SELECT r.Name Restaurant_Name, MAX(m.Price) Highest_Price
FROM Restaurant r
JOIN Menu_Item m ON r.Restaurant_ID = m.Restaurant_ID
GROUP BY r.Name;

-total number of orders handled by each driver
SELECT d.Name Driver_Name, COUNT(o.Order_ID) Total_Orders
FROM Driver d
JOIN Order_Table o ON d.Driver_ID = o.Driver_ID
GROUP BY d.Name;

-- Retrieve names of all customers and their order IDs
SELECT c.Name, o.Order_ID
FROM Customer c
JOIN Order_Table o ON c.Customer_ID = o.Customer_ID;

-- Retrieve names of all restaurants and their menu items
SELECT r.Name, m.Name
FROM Restaurant r
JOIN Menu_Item m ON r.Restaurant_ID = m.Restaurant_ID;

-- Retrieve names of all drivers and their order IDs
SELECT d.Name, o.Order_ID
FROM Driver d
JOIN Order_Table o ON d.Driver_ID = o.Driver_ID;