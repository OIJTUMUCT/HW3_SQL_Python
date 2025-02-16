CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(55),
    last_name VARCHAR(55),
    gender VARCHAR(10),
    DOB DATE,
    job_title VARCHAR(70),
    job_industry_category VARCHAR(20),
    wealth_segment VARCHAR(20),
    deceased_indicator CHAR(1),
    owns_car VARCHAR(3),
    address VARCHAR(80),
    postcode INT,
    state VARCHAR(50),
    country VARCHAR(50),
    property_valuation INT
);

CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT REFERENCES customer(customer_id),
    transaction_date DATE,
    online_order BOOLEAN,
    order_status VARCHAR(50),
    brand VARCHAR(100),
    product_line VARCHAR(50),
    product_class VARCHAR(50),
    product_size VARCHAR(50),
    list_price NUMERIC,
    standard_cost NUMERIC
);