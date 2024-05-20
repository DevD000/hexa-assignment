# SQL Queries and Tasks

## Tables Creation

```sql
CREATE TABLE [Venue_Table ] (
  [venue_id] varchar(255),
  [venue_name] varchar(255),
  [address] varchar(255),
  PRIMARY KEY ([venue_id])
);

CREATE TABLE [Event_Table ] (
  [event_id] varchar(255),
  [event_name] varchar(255),
  [event_date] date,
  [Event_time] time,
  [venue_id] varchar(255),
  [total_seats] int,
  [available_seats] int,
  [ticket_price] decimal(30,2),
  [event_type] varchar(255),
  [booking_id] varchar(255),
  PRIMARY KEY ([event_id])
);

ALTER TABLE event_table
ADD CONSTRAINT [FK_Event_Table .booking_id]
FOREIGN KEY ([booking_id])
REFERENCES [Booking_Table ]([booking_id]),
CONSTRAINT [FK_Event_Table .venue_id]
FOREIGN KEY ([venue_id])
REFERENCES [Venue_Table ]([venue_id]);

CREATE TABLE [Customer_Table ] (
  [customer_id] varchar(255),
  [customer_name] varchar(255),
  [email] varchar(255),
  [phone_no] varchar(10),
  [booking_id] varchar(255),
  PRIMARY KEY ([customer_id])
);

ALTER TABLE customer_table
ADD CONSTRAINT [FK_Customer_Table .booking_id]
FOREIGN KEY ([booking_id])
REFERENCES [Booking_Table ]([booking_id]);

CREATE TABLE [Booking_Table ] (
  [booking_id] varchar(255),
  [customer_id] varchar(255),
  [event_id] varchar(255),
  [num_tickets] int,
  [booking_date] date,
  PRIMARY KEY ([booking_id])
);

ALTER TABLE booking_table 
ADD CONSTRAINT [FK_Booking_Table .event_id]
FOREIGN KEY ([event_id])
REFERENCES [Event_Table ]([event_id]),
CONSTRAINT [FK_Booking_Table .customer_id]
FOREIGN KEY ([customer_id])
REFERENCES [Customer_Table ]([customer_id]);
```

## Insert Data into Tables

```sql
	  INSERT INTO Venue_Table (venue_id, venue_name, address) VALUES
('V001', 'Jawaharlal Nehru Stadium', 'Bhishma Pitamah Marg, Pragati Vihar, New Delhi'),
('V002', 'Eden Gardens', 'Maidan, B.B.D. Bagh, Kolkata'),
('V003', 'Wankhede Stadium', 'D Road, Churchgate, Mumbai'),
('V004', 'M. Chinnaswamy Stadium', 'Queens Road, Shivaji Nagar, Bengaluru'),
('V005', 'Sardar Patel Stadium', 'Motera, Ahmedabad'),
('V006', 'MA Chidambaram Stadium', 'Wallajah Road, Chepauk, Chennai'),
('V007', 'Arun Jaitley Stadium', 'Bahadur Shah Zafar Marg, New Delhi'),
('V008', 'Green Park Stadium', 'Civil Lines, Kanpur'),
('V009', 'Rajiv Gandhi International Stadium', 'Uppal, Hyderabad'),
('V010', 'PCA Stadium', 'Mohali, Chandigarh');



INSERT INTO Event_Table (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
('E001', 'Cricket Match', '2024-06-15', '14:00:00', 'V001', 50000, 25000, 500.00, 'Sports', 'B001'),
('E002', 'Concert by Arijit Singh', '2024-07-10', '18:00:00', 'V002', 70000, 30000, 1500.00, 'Concert', 'B002'),
('E003', 'Drama - Shakuntala', '2024-08-20', '19:00:00', 'V003', 10000, 8000, 300.00, 'Movie', 'B003'),
('E004', 'Tech Conference', '2024-09-12', '09:00:00', 'V004', 20000, 15000, 2000.00, 'Sports', 'B004'),
('E005', 'Bollywood Night', '2024-10-05', '20:00:00', 'V005', 25000, 20000, 1000.00, 'Concert', 'B005'),
('E006', 'Stand-up Comedy by Zakir Khan', '2024-11-17', '20:00:00', 'V006', 15000, 10000, 800.00, 'Movie', 'B006'),
('E007', 'Yoga Workshop', '2024-12-05', '06:00:00', 'V007', 5000, 3000, 200.00, 'Sports', 'B007'),
('E008', 'Food Festival', '2024-12-25', '10:00:00', 'V008', 10000, 5000, 50.00, 'Concert', 'B008'),
('E009', 'Fashion Show', '2024-08-30', '19:00:00', 'V009', 12000, 7000, 1200.00, 'Movie', 'B009'),
('E010', 'Marathon', '2024-09-10', '05:00:00', 'V010', 30000, 15000, 100.00, 'Sports', 'B010');


INSERT INTO Customer_Table (customer_id, customer_name, email, phone_no, booking_id) VALUES
('C001', 'Rahul Sharma', 'rahul.sharma@example.com', '9876543210', 'B001'),
('C002', 'Priya Singh', 'priya.singh@example.com', '8765432109', 'B002'),
('C003', 'Amit Patel', 'amit.patel@example.com', '7654321098', 'B003'),
('C004', 'Neha Verma', 'neha.verma@example.com', '6543210987', 'B004'),
('C005', 'Vikram Kumar', 'vikram.kumar@example.com', '5432109876', 'B005'),
('C006', 'Anjali Mehta', 'anjali.mehta@example.com', '4321098765', 'B006'),
('C007', 'Suresh Reddy', 'suresh.reddy@example.com', '3210987654', 'B007'),
('C008', 'Kiran Gupta', 'kiran.gupta@example.com', '2109876543', 'B008'),
('C009', 'Rajesh Iyer', 'rajesh.iyer@example.com', '1098765432', 'B009'),
('C010', 'Rina Das', 'rina.das@example.com', '0987654321', 'B010');


INSERT INTO Booking_Table (booking_id, customer_id, event_id, num_tickets, booking_date) VALUES
('B001', 'C001', 'E001', 4, '2024-05-01'),
('B002', 'C002', 'E002', 2, '2024-06-01'),
('B003', 'C003', 'E003', 3, '2024-07-01'),
('B004', 'C004', 'E004', 1, '2024-08-01'),
('B005', 'C005', 'E005', 5, '2024-09-01'),
('B006', 'C006', 'E006', 2, '2024-10-01'),
('B007', 'C007', 'E007', 6, '2024-11-01'),
('B008', 'C008', 'E008', 8, '2024-12-01'),
('B009', 'C009', 'E009', 4, '2024-01-01'),
('B010', 'C010', 'E010', 10, '2024-02-01');
```

## Tasks

### Task 2.2: List all the events.

```sql
SELECT * FROM [Event_Table ];
```


### Task 2.3: Select events with available tickets.

```sql
SELECT * FROM [Event_Table ] WHERE available_seats != 0;
```

### Task 2.4: Select event names partially matching 'cup'.

```sql
SELECT * FROM [Event_Table ] WHERE event_name LIKE '%cup%';
```

### Task 2.5: Select events with ticket prices between 1000 and 2500.

```sql
SELECT * FROM [Event_Table ] WHERE ticket_price BETWEEN 1000 AND 2500;
```

### Task 2.6: Retrieve events with dates falling within a specific range.

```sql
SELECT * FROM [Event_Table ] WHERE event_date BETWEEN '2024-07-10' AND '2024-10-30';
```

### Task 2.7: Retrieve events with available tickets that also have "Concert" in their type.

```sql
SELECT * FROM [Event_Table ] WHERE event_type = 'concert' AND available_seats > 0;
```

### Task 2.8: Retrieve users in batches of 5, starting from the 6th user.

```sql
SELECT * FROM [Customer_Table ] ORDER BY customer_id OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
```

### Task 2.9: Retrieve booking details containing booked number of tickets more than 4.

```sql
SELECT * FROM [Booking_Table ] WHERE num_tickets > 4;
```


### Task 2.10: Retrieve customer information whose phone number ends with '000'.

```sql
SELECT * FROM [Customer_Table ] WHERE phone_no LIKE '%000';
```

### Task 2.11: Retrieve events in order whose seat capacity is more than 15000.

```sql
SELECT * FROM [Event_Table ] WHERE total_seats > 15000;
```

### Task 2.12: Select events names not starting with 'x', 'y', 'z'.

```sql
SELECT * FROM [Event_Table ] WHERE event_name NOT LIKE 'x%' AND event_name NOT LIKE 'y%' AND event_name NOT LIKE 'z%';
```

### Task 3: Aggregate functions, Having, Order By, Group By, and Joins:

### Task 3.1: Write a SQL query to list events and their average ticket prices.

```sql
SELECT event_type, AVG(ticket_price) AS average_ticket_price FROM [Event_Table ] GROUP BY event_type;
```

### Task 3.2: Write a SQL query to calculate the total revenue generated by events.

```sql
SELECT *, (total_seats - available_seats) * ticket_price AS total_revenue FROM [Event_Table ];
```

### Task 3.3: Write a SQL query to find the event with the highest ticket sales.

```sql
SELECT event_id, event_name, (total_seats - available_seats) AS tickets_sold 
FROM [Event_Table ] 
ORDER BY tickets_sold DESC 
LIMIT 1;
```

### Task 3.4: Write a SQL query to calculate the total number of tickets sold for each event.

```sql
SELECT *, (total_seats - available_seats) AS tickets_sold FROM [Event_Table ];
```

### Task 3.5: Write a SQL query to find events with no ticket sales.

```sql
SELECT * FROM [Event_Table ] WHERE total_seats = available_seats;
```

### Task 3.6: Write a SQL query to find the user who has booked the most tickets.

```sql
SELECT * FROM [Booking_Table ] ORDER BY num_tickets DESC LIMIT 1;
```

### Task 3.7: Write a SQL query to list events and the total number of tickets sold for each month.

```sql
SELECT EXTRACT(MONTH FROM event_date) AS month, COUNT(*) AS total_tickets_sold 
FROM [Event_Table ] 
GROUP BY EXTRACT(MONTH FROM event_date);
```

### Task 3.8: Write a SQL query to calculate the average ticket price for events in each venue.

```sql
SELECT venue_id, AVG(ticket_price) AS average_ticket_price FROM [Event_Table ] GROUP BY venue_id;
```

### Task 3.9: Write a SQL query to calculate the total number of tickets sold for each event type.

```sql
SELECT event_type, SUM(total_seats - available_seats) AS tickets_sold FROM [Event_Table ] GROUP BY event_type;
```

### Task 3.10: Write a SQL query to calculate the total revenue generated by events in each year.

```sql
SELECT YEAR(event_date) AS year, SUM((total_seats - available_seats) * ticket_price) AS total_revenue 
FROM [Event_Table ] 
GROUP BY YEAR(event_date);
```

###Task3.11. Write a SQL query to list users who have booked tickets for multiple events.

```sql
SELECT 
    [Customer_Table ] .customer_id, 
    customer_name
FROM 
    [Customer_Table ]
JOIN 
    [Booking_Table ] ON [Customer_Table ].customer_id = [Booking_Table ].customer_id
GROUP BY 
    [Customer_Table ].customer_id, 
    customer_name
HAVING 
    COUNT([Booking_Table ].booking_id) > 1;
```

Task3.12. Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
```sql
SELECT 
    C.customer_id,
    C.customer_name,
    SUM(B.num_tickets * E.ticket_price) AS total_revenue
FROM 
    [Customer_Table ] C
JOIN 
    [Booking_Table ] B ON C.customer_id = B.customer_id
JOIN 
    [Event_Table ] E ON B.event_id = E.event_id
GROUP BY 
    C.customer_id, C.customer_name;
```


### Task3.13 Write a Sql query to calculate the Average Ticket Price for Events in Each Category and Venue.
```sql
SELECT 
    V.venue_id,
    V.venue_name,
    E.event_type,
    AVG(E.ticket_price) AS average_ticket_price
FROM 
    [Venue_Table ] V
JOIN 
    [Event_Table ] E ON V.venue_id = E.venue_id
GROUP BY 
    V.venue_id, V.venue_name, E.event_type;
```
### Task3.14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days.

```sql

SELECT 
    C.customer_id,
    C.customer_name,
    COUNT(B.booking_id) AS total_tickets_purchased
FROM 
    [Customer_Table ] C
LEFT JOIN 
    [Booking_Table ] B ON C.customer_id = B.customer_id
WHERE 
    B.booking_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY 
    C.customer_id, C.customer_name;
```

...

### Task 4: Subqueries and Advanced Queries

### Task 4.1: Calculate the average ticket price for events in each venue using a subquery.

```sql
SELECT V.venue_id, V.venue_name, (SELECT AVG(E.ticket_price) FROM [Event_Table ] E WHERE E.venue_id = V.venue_id) AS average_ticket_price 
FROM [Venue_Table ] V;
```

### Task 4.2: Find events with more than 50% of tickets sold using a subquery.

(TBD)

### Task 4.3: Calculate the total number of tickets sold for each event.

```sql
SELECT *, (total_seats - available_seats) AS tickets_sold FROM [Event_Table ];
```

### Task 4.4: Find users who have not booked any tickets using a NOT EXISTS subquery.

```sql
SELECT * FROM [Customer_Table ] WHERE NOT EXISTS (SELECT * FROM [Booking_Table ] WHERE [Booking_Table ].customer_id = [Customer_Table ].customer_id);
```

### Task 4.5: List events with no ticket sales using a NOT IN subquery.

```sql
SELECT * FROM [Event_Table ] WHERE event_id NOT IN (SELECT event_id FROM [Event_Table ] WHERE available_seats != total_seats);
```

### Task 4.6: Calculate the total number of tickets sold for each event type using a subquery with GROUP BY.

```sql
SELECT event_type, SUM(total_seats - available_seats) AS total_tickets_sold 
FROM [Event_Table ] 
GROUP BY event_type;
```

### Task 4.7: Find events with ticket prices higher than the average ticket price using a subquery in the WHERE clause.

```sql
select * from [Event_Table ]
where ticket_price>(select avg(ticket_price) from [Event_Table ])
```

### Task 4.8: Calculate the total revenue generated by events for each user using a correlated subquery.

```sql
	SELECT 
    C.customer_id,
    C.customer_name,
    (
        SELECT SUM(E.ticket_price * B.num_tickets)
        FROM [Event_Table ] E
        INNER JOIN [Booking_Table ] B ON E.event_id = B.event_id
        WHERE B.customer_id = C.customer_id
    ) AS total_revenue
FROM 
    [Customer_Table ] C;
```

### Task 4.9: List users who have booked tickets for events in a given venue using a subquery in the WHERE clause.

```sql
select * from [Customer_Table ]
where customer_id in (select customer_id from [Booking_Table ] 
						where booking_id in 
						(select booking_id from 
						[Event_Table ] where venue_id ='V006') )
```
### Task 4.10: Calculate the total number of tickets sold for each event category using a subquery with GROUP BY.

```sql

 SELECT 
    E.event_type,
    T.total_tickets_sold
FROM 
    (
        SELECT 
            event_type,
            SUM(total_seats-available_seats) AS total_tickets_sold
        FROM 
            [Event_Table ]
        GROUP BY 
            event_type
    ) AS T
JOIN 
    [Event_Table ] E ON T.event_type = E.event_type;
```

### Task 4.11: Find users who have booked tickets for events in each month using a subquery with DATE FORMAT.

```sql

select *,(select month(booking_date) as month  from [Booking_Table ] b
where b.booking_id=c.booking_id ) from [Customer_Table ] c
```

### Task 4.12: Calculate the average ticket price for events in each venue using a subquery.

```sql
SELECT V.venue_id, V.venue_name, (SELECT AVG(E.ticket_price) FROM [Event_Table ] E WHERE E.venue_id = V.venue_id) AS average_ticket_price 
FROM [Venue_Table ] V;
```
