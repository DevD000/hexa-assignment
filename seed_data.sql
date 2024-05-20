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