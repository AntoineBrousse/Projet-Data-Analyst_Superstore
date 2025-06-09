-- Création de toutes les tables

CREATE TABLE customers (
    Customer_ID TEXT PRIMARY KEY,
    Customer_Name TEXT,
    Segment TEXT,
    City TEXT,
    State TEXT,
	Country TEXT,
    Region TEXT,
    Postal_Code TEXT
);


CREATE TABLE products (
    Product_ID TEXT PRIMARY KEY,
    Product_Name TEXT,
    Category TEXT,
    Sub_Category TEXT
);

-- Pour éviter les erreurs d’import liées au format de date (MM/DD/YYYY), j’ai d’abord importé toutes les dates en texte.
CREATE TABLE orders (
    Order_ID TEXT PRIMARY KEY,
    Order_Date TEXT,
    Ship_Date TEXT,
    Ship_Mode TEXT,
    Customer_ID TEXT REFERENCES customers(Customer_ID)
);


CREATE TABLE order_details (
    Order_ID TEXT,
    Product_ID TEXT,
    Sales NUMERIC,
    Quantity INTEGER,
    Discount NUMERIC,
    Profit NUMERIC,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);


-- Importations de toutes les tables

COPY customers(Customer_ID, Customer_Name, Segment, City, State, Country, Region, Postal_Code)
FROM 'C:/Users/tonio/Documents/superstore-project/data/customers.csv'
DELIMITER ','
CSV HEADER;

COPY products(Product_ID, Product_Name, Category, Sub_Category)
FROM 'C:/Users/tonio/Documents/superstore-project/data/products.csv'
DELIMITER ','
CSV HEADER;

COPY orders(Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID)
FROM 'C:/Users/tonio/Documents/superstore-project/data/orders.csv'
DELIMITER ','
CSV HEADER;

COPY order_details(Order_ID, Product_ID, Sales, Quantity, Discount, Profit)
FROM 'C:/Users/tonio/Documents/superstore-project/data/order_details.csv'
DELIMITER ','
CSV HEADER;


-- Remmetre les dates dans le bon format
ALTER TABLE orders
ALTER COLUMN Order_Date TYPE date USING TO_DATE(Order_Date, 'MM/DD/YYYY');

ALTER TABLE orders
ALTER COLUMN Ship_Date TYPE date USING TO_DATE(Ship_Date, 'MM/DD/YYYY');

-- Suppresion des colonnes inutiles
ALTER TABLE customers
DROP COLUMN Country;

ALTER TABLE customers
DROP COLUMN Postal_Code;

