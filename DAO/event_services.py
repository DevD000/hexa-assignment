from abc import ABC, abstractmethod
from Util.DBConnUtil import DBConnection
from entity import event
from tabulate import tabulate
from exception.exception import EventNotFoundException


class IEvent_service(ABC):
    @abstractmethod
    def create_event(self):
        pass

    @abstractmethod
    def get_available_no_of_tickets(self):
        pass

    @abstractmethod
    def get_event_details(self):
        pass



class event_service(DBConnection, IEvent_service):

    def create_event(self, Event):
        try:
            self.cursor.execute(
                """
                insert into event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
                """,
                (
                    Event.event_id,
                    Event.event_name,
                    Event.event_date,
                    Event.event_time,
                    Event.venue_id,
                    Event.total_seats,
                    Event.available_seats,
                    Event.ticket_price,
                    Event.event_type,
                ),
            )
            self.conn.commit()
            print("Event created successfully")
        except Exception as e:
            print(e)

    def get_event_details(self):
        try:
            print("Select the type of event details you want to see:")
            print("1] Movie event details")
            print("2] Concert event details")
            print("3] Sports event details")
            choice = int(input("Enter your choice (1/2/3): "))

            if choice == 1:
                event_type = "Movie"
            elif choice == 2:
                event_type = "Concert"
            elif choice == 3:
                event_type = "Sports"
            else:
                print("Invalid choice. Please enter a valid option.")
                return
            self.cursor.execute(
                "SELECT * FROM Event WHERE event_type = ?", (event_type,)
            )
            events = self.cursor.fetchall()
            if events:
                for event in events:
                    event_instance = events(
                        event_id=event[0],
                        event_name=event[1],
                        event_date=event[2],
                        event_time=event[3],
                        venue_id=event[4],
                        total_seats=event[5],
                        available_seats=event[6],
                        ticket_price=event[7],
                        event_type=event[8],
                    )
                    event_instance.display_event_details()
            else:
                raise EventNotFoundException(event_type)
        except Exception as e:
            print(e)

    def get_available_no_of_tickets(self):
        try:
            self.cursor.execute("SELECT event_name, available_seats FROM Event")
            events = self.cursor.fetchall()
            total_available_seats = sum(event[1] for event in events)
            return events, total_available_seats
        except Exception as e:
            print(e)
            return [], 0
