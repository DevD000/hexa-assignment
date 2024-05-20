from abc import ABC, abstractmethod
from Util.DBConnUtil import DBConnection
from entity import event
from tabulate import tabulate
from exception.exception import EventNotFoundException


class IEvent_service(ABC):
    @abstractmethod
    def calculate_total_revenue(self):
         pass

    @abstractmethod
    def get_booked_no_of_tickets(self):
        pass

    @abstractmethod
    def get_event_details(self):
        pass



class event_service(DBConnection, IEvent_service):

    def calculate_total_revenue(self):
        try:
            self.cursor.execute(
                "SELECT Event_Id,Total_seats,available_seats,ticket_price FROM Event_table"
            )
            event_data = [list(row) for row in self.cursor.fetchall()]
            revenue_data = []
            if event_data:
                for row in event_data:
                    event_id, total_seats, available_seats, ticket_price = row
                    total_revenue = (total_seats - available_seats) * ticket_price
                    revenue_data.append((event_id, total_revenue))
                headers = [event_id, revenue_data]
                print("Total revenue generated from the tickets is:")
                print(tabulate(revenue_data, headers=headers, tablefmt="grid"))
            else:
                raise EventNotFoundException
        except Exception as e:
            print(e)

    def get_event_details(self):
        
        try:
            self.cursor.execute("SELECT * FROM EVENT_table")
            events = self.cursor.fetchall()
            self.conn.commit()  # Usually not needed for SELECT statements

            if events:
                for event in events:
                    print(event)
            else:
                print("No events found in the EVENT table.")
        except Exception as e:
            print(f"An error occurred: {e}")

        
        # try:
        #     self.cursor.execute("SELECT * FROM EVENT")
        #     events= self.cursor.fetchall()
        #     self.conn.commit()
        #     for event in events:
        #         print(event)

        #     # if event_data:
        #     #     print(tabulate(event_data, headers=headers, tablefmt="grid"))
        #     # else:
        #     #     raise EventNotFoundException
        # except Exception as e:
        #     print(e)

    def get_booked_no_of_tickets(self):
        self.cursor.execute("SELECT EVENT_ID,TOTAL_SEATS,AVAILABLE_SEATS FROM Event_table")
        event_data = [list(row) for row in self.cursor.fetchall()]
        booked_data = []
        for row in event_data:
            event_id, total_seats, available_seats = row
            booked_tickets = total_seats - available_seats
            booked_data.append((event_id, booked_tickets))
        headers = [event_id, booked_data]
        print(tabulate(booked_data, headers=headers, tablefmt="grid"))

