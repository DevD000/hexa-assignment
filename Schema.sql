create database TktBookingSystem
use TktBookingSystem

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
  PRIMARY KEY ([event_id]))

  alter table event_table
 add 
 CONSTRAINT [FK_Event_Table .booking_id]
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
  PRIMARY KEY ([customer_id]))

   alter table customer_table
 add CONSTRAINT [FK_Customer_Table .booking_id]
    FOREIGN KEY ([booking_id])
      REFERENCES [Booking_Table ]([booking_id]);



  
CREATE TABLE [Booking_Table ] (
  [booking_id] varchar(255),
  [customer_id] varchar(255),
  [event_id] varchar(255),
  [num_tickets] int,
  [booking_date] date,
  PRIMARY KEY ([booking_id]))

    alter table booking_table 
  add CONSTRAINT [FK_Booking_Table .event_id]
    FOREIGN KEY ([event_id])
      REFERENCES [Event_Table ]([event_id]),
   CONSTRAINT [FK_Booking_Table .customer_id]
    FOREIGN KEY ([customer_id])
      REFERENCES [Customer_Table ]([customer_id]);
