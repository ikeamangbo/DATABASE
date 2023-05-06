CREATE TABLE Customer(
customer_name VARCHAR(200) NOT NULL,
Customer_ID INT PRIMARY KEY,
customer_contact VARCHAR(200) NOT NULL
	

);
INSERT INTO Customer (customer_name, Customer_ID, customer_contact)
VALUES ('John Smith', 1, '1234567890'),
('Jane Doe', 2, '9876543210'),
('Michael Johnson', 3, '5551234567'),
('Emily Brown', 4, '9998887777'),
('David Wilson', 5, '4445556666'),
('Sarah Davis', 6, '1112223333'),
('Robert Taylor', 7, '6667778888'),
('Linda Anderson', 8, '2223334444'),
('Thomas Lee', 9, '7778889999'),
('Olivia Martin', 10, '3334445555'),
('William Johnson', 11, '5556667777'),
('Emma Thompson', 12, '8889990000'),
('Christopher Davis', 13, '4443332222'),
('Sophia Wilson', 14, '6665554444'),
('James Brown', 15, '1112223333'),
('Ava Smith', 16, '8889991111'),
('Matthew Anderson', 17, '2223334444'),
('Emma Taylor', 18, '5556667777'),
('Daniel Davis', 19, '7778889999'),
('Sophia Martin', 20, '3334445555');

SELECT * FROM customer;


CREATE TABLE Employee(
Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR(200) NOT NULL,
Employee_Position VARCHAR(200) NOT NULL,
Date_of_hire VARCHAR(200) NOT NULL,
shift TEXT NOT NULL
);
SELECT * FROM Employee;

INSERT INTO Employee (Employee_ID, Employee_Name, Employee_Position, Date_of_hire, Shift)
VALUES
(101, 'Robert Johnson', 'Manager', '15/01/2010', 'Day Shift'),
(105, 'Jennifer Smith', 'Supervisor', '03/05/2011', 'Night Shift'),
(103, 'Christopher Davis', 'Technician', '21/09/2012', 'Evening Shift'),
(104, 'Michelle Thompson', 'Assistant', '12/07/2013', 'Day Shift'),
(102, 'Daniel Wilson', 'Operator', '30/11/2014', 'Night Shift'),
(106, 'Jessica Brown', 'Technician', '01/03/2015', 'Day Shift'),
(108, 'David Johnson', 'Supervisor', '18/06/2016', 'Night Shift'),
(111, 'Samantha Davis', 'Technician', '24/09/2017', 'Evening Shift'),
(107, 'Andrew Smith', 'Assistant', '09/02/2018', 'Day Shift'),
(110, 'Emily Wilson', 'Operator', '28/05/2019', 'Night Shift'),
(115, 'Michael Thompson', 'Operator', '05/09/2020', 'Day Shift'),
(112, 'Emma Davis', 'Supervisor', '19/12/2021', 'Night Shift'),
(109, 'James Johnson', 'Technician', '14/03/2022', 'Evening Shift'),
(113, 'Sophia Brown', 'Assistant', '08/06/2023', 'Day Shift'),
(117, 'Matthew Wilson', 'Operator', '25/09/2020', 'Night Shift'),
(116, 'Olivia Smith', 'Technician', '17/12/2021', 'Day Shift'),
(119, 'Jacob Thompson', 'Supervisor', '04/03/2021', 'Night Shift'),
(114, 'Isabella Davis', 'Technician', '29/05/2010', 'Evening Shift'),
(118, 'William Johnson', 'Assistant', '13/08/2011', 'Day Shift'),
(120, 'Emily Wilson', 'Operator', '21/11/2020', 'Night Shift');
SELECT * FROM Employee;
ALTER TABLE Employee ADD COLUMN Reports_to TEXT;
UPDATE Employee SET Reports_to = 'Manager' WHERE Employee_Position != 'Manager';

CREATE TABLE Vehicle (
Vehicle_ID SERIAL PRIMARY KEY,
Customer_ID INT NOT NULL,
Car_Brand VARCHAR(200) NOT NULL,
FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);
SELECT * FROM vehicle;
INSERT INTO Vehicle (Customer_ID, Car_Brand) 
VALUES (15, 'Toyota'),
(18, 'Honda'),
(12, 'Ford'),
(19, 'Chevrolet'),
(14, 'BMW'),
(16, 'Mercedes-Benz'),
(20, 'Nissan'),
(13, 'Volkswagen'),
(11, 'Audi'),
(17, 'Hyundai'),
(10, 'Kia'),
(9, 'Mazda'),
(7, 'Subaru'),
(8, 'Lexus'),
(6, 'Jeep'),
(5, 'Volvo'),
(4, 'Mitsubishi'),
(3, 'Chrysler'),
(2, 'Land Rover'),
(1, 'Tesla');
SELECT * FROM vehicle;
SELECT * FROM customer JOIN vehicle ON customer.customer_ID = vehicle.customer_ID;

SELECT Customer.customer_name, customer.customer_ID, customer.customer_contact, vehicle.vehicle_ID, vehicle.car_brand FROM Customer JOIN VEHICLE ON customer.customer_ID = vehicle.customer_ID;

CREATE TABLE FuelType (
  fuel_id INT PRIMARY KEY,
  fuel_name VARCHAR(50),
  price_per_litre DECIMAL(5,2) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);
SELECT * FROM FuelType;
INSERT INTO FuelType (fuel_id, fuel_name, price_per_litre, Customer_ID)
VALUES
  (1, 'Gasoline', 20.75, 1),
  (2, 'Diesel', 18.95, 2),
  (3, 'Electric', 14.5, 3),
  (4, 'Hybrid', 23.10, 4),
  (5, 'Ethanol', 17.80, 5),
  (6, 'Biodiesel', 19.25, 6),
  (7, 'Compressed Natural Gas (CNG)', 14.8, 7),
  (8, 'Liquefied Petroleum Gas (LPG)', 16.45, 8),
  (9, 'Hydrogen', 21.30, 9),
  (10, 'Propane', 24.90, 10),
  (11, 'Methanol', 22.75, 11),
  (12, 'Liquefied Natural Gas (LNG)', 15.60, 12),
  (13, 'Biofuel', 18.25, 13),
  (14, 'Synthetic Fuel', 23.50, 14),
  (15, 'Aviation Fuel', 25.20, 15),
  (16, 'Kerosene', 16.75, 16),
  (17, 'Methane', 20.40, 17),
  (18, 'Butane', 19.90, 18),
  (19, 'Jet Fuel', 21.50, 19),
  (20, 'Biomethane', 17.95, 20);
  SELECT* FROM Fueltype;
 --CREATING FUELPUMP TABLE
 CREATE TABLE FuelPump(
 Pump_ID SERIAL PRIMARY KEY,
 Fuel_ID INT NOT NULL,
 Status VARCHAR(50) NOT NULL,
 FOREIGN KEY (Fuel_ID) REFERENCES FuelType (fuel_ID)
);

INSERT INTO FuelPump(Fuel_ID, Status)
VALUES
  (1, 'Active'),
  (2, 'Active'),
  (3, 'Active'),
  (4, 'Active'),
  (5, 'Active'),
  (6, 'Active'),
  (7, 'Active'),
  (8, 'Active'),
  (9, 'Active'),
  (10, 'Active'),
  (11, 'Active'),
  (12, 'Active'),
  (13, 'Active'),
  (14, 'Active'),
  (15, 'Active'),
  (16, 'Active'),
  (17, 'Active'),
  (18, 'Active'),
  (19, 'Active'),
  (20, 'Active');
SELECT * FROM FuelPump; 
SELECT FuelPump.Pump_ID, FuelType.Fuel_Name, FuelPump.Status
FROM FuelPump
JOIN FuelType ON FuelPump.Fuel_ID = FuelType.Fuel_ID;
  
 CREATE TABLE FuelSales (
  sales_id SERIAL PRIMARY KEY,
  fuel_id INT NOT NULL,
  quantity DECIMAL(10, 2) NOT NULL,
  total_price DECIMAL(10, 2),
  sale_date VARCHAR(100) NOT NULL,
  FOREIGN KEY (fuel_id) REFERENCES FuelType (fuel_id)
);
INSERT INTO FuelSales(fuel_id, quantity, sale_date)
VALUES(1, 50, '01/04/2023'),
  (2, 30, '02/04/2023'), 
  (3, 20, '03/04/2023'),
  (4, 40, '04/04/2023'),
  (5, 25, '05/04/2023'),
  (6, 35, '06/04/2023'),
  (7, 15, '07/04/2023'),
  (8, 45, '08/04/2023'),
  (9, 55, '09/04/2023'),
  (10, 50, '10/04/2023'),
  (11, 20, '11/04/2023'),
  (12, 30, '12/04/2023'),
  (13, 40, '13/04/2023'),
  (14, 25, '14/04/2023'),
  (15, 35, '15/04/2023'),
  (16, 15, '16/04/2023'),
  (17, 45, '17/04/2023'),
  (18, 55, '18/04/2023'),
  (19, 50, '19/04/2023'),
  (20, 20, '20/04/2023');
  SELECT* FROM FuelSales;
-- trigger function to calculate the total price 
CREATE OR REPLACE FUNCTION update_total_price()
RETURNS TRIGGER AS $$
BEGIN
  NEW.total_price := (
    SELECT price_per_litre * NEW.quantity
    FROM FuelType
    WHERE FuelType.fuel_id = NEW.fuel_id
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER fuel_sales_trigger
BEFORE INSERT ON FuelSales
FOR EACH ROW
EXECUTE PROCEDURE update_total_price();
SELECT * FROM FuelSales;
INSERT INTO FuelSales(fuel_id, quantity, sale_date)
VALUES(1, 39, '17/03/2023');
--join statement betwee the FuelSales table and the FuelType table
SELECT FuelSales.sales_id, FuelSales.fuel_id, FuelType.fuel_name, FuelType.price_per_litre, FuelSales.quantity, FuelSales.total_price, FuelSales.sale_date
FROM FuelSales
JOIN FuelType ON FuelSales.fuel_id = FuelType.fuel_id;
--creating PaymentMethod table
  CREATE TABLE PaymentMethod (
  payment_id SERIAL PRIMARY KEY,
  payment_name VARCHAR(200) NOT NULL,
  payment_type VARCHAR(100) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
SELECT * FROM paymentmethod;
INSERT INTO PaymentMethod (payment_name, payment_type, Customer_ID)
VALUES
  ('Credit Card', 'Card Payment', 1),
  ('PayPal', 'Online Payment', 2),
  ('Cash', 'Cash Payment', 3),
  ('Bank Transfer', 'Bank Payment', 4),
  ('Mobile Wallet', 'Digital Payment', 5),
  ('Cheque', 'Paper Payment', 6),
  ('Cryptocurrency', 'Digital Payment', 7),
  ('Gift Card', 'Prepaid Payment', 8),
  ('Money Order', 'Secure Payment', 9),
  ('Direct Debit', 'Automatic Payment', 10),
  ('Google Pay', 'Digital Payment', 11),
  ('Apple Pay', 'Mobile Payment', 12),
  ('Venmo', 'Peer-to-Peer Payment', 13),
  ('Stripe', 'Online Payment', 14),
  ('Square', 'Card Payment', 15),
  ('Zelle', 'Bank Transfer', 16),
  ('Western Union', 'Money Transfer', 17),
  ('Amazon Pay', 'Digital Wallet', 18),
  ('Alipay', 'Mobile Payment', 19),
  ('Samsung Pay', 'Mobile Payment', 20); 
 --join statement between the Customer table and the PaymentMethod Table
SELECT Customer.customer_name, Customer.customer_ID, Customer.customer_contact, PaymentMethod.payment_name, PaymentMethod.payment_type
FROM Customer
JOIN PaymentMethod ON Customer.Customer_ID = PaymentMethod.Customer_ID;

SELECT Customer.customer_name, Customer.customer_ID, Customer.customer_contact, Vehicle.Vehicle_ID, Vehicle.Car_Brand,PaymentMethod.payment_name, PaymentMethod.payment_type
FROM Customer
JOIN Vehicle ON Customer.Customer_ID = Vehicle.Customer_ID
JOIN PaymentMethod ON Customer.Customer_ID = PaymentMethod.Customer_ID;
--JOIN STATEMENT BETWEEN THE CUSTOMER TABLE, VEHICLE TABLE, PAYMENT METHOD TABLE AND FUEL TYPE TABLE
SELECT  
  Customer.customer_ID,
  customer.customer_name,
  Customer.customer_contact,
  Vehicle.Car_Brand,
  PaymentMethod.payment_name,
  PaymentMethod.payment_type,
  FuelType.fuel_name,
  FuelType.price_per_litre
FROM
  Customer
JOIN Vehicle ON Customer.Customer_ID = Vehicle.Customer_ID
JOIN PaymentMethod ON Customer.Customer_ID = PaymentMethod.Customer_ID
JOIN FuelType ON Customer.Customer_ID = FuelType.Customer_ID;

SELECT * FROM FuelSales;

