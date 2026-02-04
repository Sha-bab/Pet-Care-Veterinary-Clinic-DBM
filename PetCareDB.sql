-- =========================
-- DATABASE
-- =========================
CREATE DATABASE PetCareDB;
USE PetCareDB;

-- =========================
-- CUSTOMERS
-- =========================
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255)
);

INSERT INTO Customers (first_name, last_name, phone, email, address) VALUES
('John', 'Doe', '01711111111', 'john@example.com', 'Dhaka'),
('Sara', 'Khan', '01822222222', 'sara@example.com', 'Chittagong'),
('Amit', 'Roy', '01933333333', 'amit@example.com', 'Khulna');

-- =========================
-- PETS
-- =========================
CREATE TABLE Pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    pet_name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    date_of_birth DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Pets (customer_id, pet_name, species, breed, date_of_birth) VALUES
(1, 'Buddy', 'Dog', 'Golden Retriever', '2020-05-10'),
(2, 'Milo', 'Cat', 'Persian', '2021-03-15'),
(3, 'Rocky', 'Dog', 'German Shepherd', '2019-08-20');

-- =========================
-- VETS
-- =========================
CREATE TABLE Vets (
    vet_id INT AUTO_INCREMENT PRIMARY KEY,
    vet_name VARCHAR(100),
    specialization VARCHAR(100)
);

INSERT INTO Vets (vet_name, specialization) VALUES
('Dr. Hasan', 'Surgery'),
('Dr. Rahman', 'Dermatology'),
('Dr. Smith', 'General Care');

-- =========================
-- APPOINTMENTS
-- =========================
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    vet_id INT,
    appointment_date DATE,
    appointment_time TIME,
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id),
    FOREIGN KEY (vet_id) REFERENCES Vets(vet_id)
);

INSERT INTO Appointments (pet_id, vet_id, appointment_date, appointment_time) VALUES
(1, 1, '2025-02-10', '10:00:00'),
(2, 2, '2025-02-11', '11:30:00'),
(3, 3, '2025-02-12', '09:45:00');

-- =========================
-- MEDICAL RECORDS
-- =========================
CREATE TABLE Medical_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    vet_id INT,
    diagnosis TEXT,
    treatment TEXT,
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id),
    FOREIGN KEY (vet_id) REFERENCES Vets(vet_id)
);

INSERT INTO Medical_Records (pet_id, vet_id, diagnosis, treatment) VALUES
(1, 1, 'Broken leg', 'Surgery and rest'),
(2, 2, 'Skin allergy', 'Medication'),
(3, 3, 'Fever', 'Antibiotics');

-- =========================
-- ORDERS
-- =========================
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-02-01', 2500.00),
(2, '2025-02-02', 1800.00),
(3, '2025-02-03', 3200.00);

-- =========================
-- CATEGORIES
-- =========================
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO Categories (category_name) VALUES
('Food'),
('Medicine'),
('Accessories');

-- =========================
-- SUPPLIERS
-- =========================
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100)
);

INSERT INTO Suppliers (supplier_name) VALUES
('PetSupplies Ltd'),
('VetMeds Co'),
('AnimalCare Inc');

-- =========================
-- PRODUCTS
-- =========================
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

INSERT INTO Products (category_id, supplier_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- =========================
-- EMPLOYEES
-- =========================
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100)
);

INSERT INTO Employees (employee_name) VALUES
('Rahim'),
('Karim'),
('Ayesha');

-- =========================
-- SERVICES
-- =========================
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100)
);

INSERT INTO Services (service_name) VALUES
('Grooming'),
('Vaccination'),
('Training');

-- =========================
-- SERVICE BOOKINGS
-- =========================
CREATE TABLE Service_Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    service_id INT,
    employee_id INT,
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Service_Bookings (pet_id, service_id, employee_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- =========================
-- PAYMENTS
-- =========================
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payments (order_id, payment_date, amount) VALUES
(1, '2025-02-01', 2500.00),
(2, '2025-02-02', 1800.00),
(3, '2025-02-03', 3200.00);

-- =========================
-- ORDER ITEMS
-- =========================
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 1200.00),
(2, 2, 1, 1800.00),
(3, 3, 3, 1000.00);

SELECT * FROM Payments;
SELECT * FROM Customers;



