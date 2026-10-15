CREATE TABLE customer_dim_type2 (
    customer_sk BIGINT GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,
    customer_id INT NOT NULL,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    effective_from DATE NOT NULL,
    effective_to DATE,
    is_current BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO customer_dim_type2 (
    customer_id,
    customer_name,
    city,
    effective_from,
    effective_to,
    is_current
)
VALUES (
    101,
    'Rahul',
    'Bengaluru',
    DATE '2025-01-01',
    DATE '9999-12-31',
    TRUE
);

update customer_dim_type2
set is_current = FALSE, effective_to = date('2026-01-01')
where customer_id = 101 and city = 'Bengaluru';

INSERT INTO customer_dim_type2 (
    customer_id,
    customer_name,
    city,
    effective_from,
    effective_to,
    is_current
)
SELECT
    101,
    'Rahul',
    'Hyderabad',
    DATE '2026-01-01',
    DATE '2099-01-01',
    TRUE
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_dim_type2
    WHERE customer_name = 'Rahul'
      AND city = 'Hyderabad'
      AND is_current = TRUE
);


select * from customer_dim_type2;


CREATE TABLE customer_dim_type3 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    current_city VARCHAR(100),
    previous_city VARCHAR(100)
);


INSERT INTO customer_dim_type3
VALUES (101, 'Rahul', 'Bengaluru', NULL);

select * from customer_dim_type3;

UPDATE customer_dim_type3
SET previous_city = current_city,
    current_city = 'Hyderabad'
WHERE customer_id = 101
  AND current_city IS DISTINCT FROM 'Hyderabad';

UPDATE customer_dim_type3
SET previous_city = current_city,
    current_city = 'Pune'
WHERE customer_id = 101
  AND current_city IS DISTINCT FROM 'Pune';


select * from customer_dim_type3;