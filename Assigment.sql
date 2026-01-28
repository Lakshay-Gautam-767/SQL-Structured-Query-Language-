/* Use this code to create table inside the database.
-- -------------------------
-- Create table: events
-- -------------------------
use correlated;
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;
*/

show tables;
select * from employee;
select * from events;
select * from ticket_sales;


# Ans-1: Find the total quantity sold per event_id.
select ts.event_id, count(ts.event_id) as 'total_quantiy_sold' from ticket_sales
as ts join events as ev ON ts.event_id = ev.event_id group by event_id;

# Ans-2: Find the total revenue per event_id.
select ts.event_id, sum(ts.qty * ts.price_per_ticket) as 'total_revenue' 
from ticket_sales as ts join events as ev on ts.event_id = ev.event_id 
group by ts.event_id;

# Ans-3: Find monthly total revenue (group by month of sale_date).
select * from ticket_sales;

# Ans-4: Find monthly total revenue (group by month of sale_date).
select month(sale_date), sum(qty * price_per_ticket) as 'total_revenue'
from ticket_sales group by month(sale_date);

# Ans-5: 

