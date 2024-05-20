from DAO import BookingService
from DAO.event_services import event_service
from DAO.venue_service import VenueService
from DAO.customer_service import CustomerService
class MainMenu:
    event_service = event_service()
    booking_service = BookingService()
    venue_service=VenueService()
    customer_service=CustomerService()

    def booking_menu(self):
        while True:
                print(
                    """
                    1] Calculate Booking Cost
                    2] Book the tickets
                    3] Cancel Booking
                    4] Get available Tickets
                    5] Display Event Details
                    6] Exit"""
                )
                choice = int(input("Please choose one from the above options:"))
                if choice == 1:
                    event_id = input(
                        "Enter the event id of event which you want to book your tickets : "
                    )
                    num_tickets = int(input("Enter no. of tickets you want to book :"))
                    self.booking_service.calculate_booking_cost(event_id,num_tickets)
                elif choice == 2:
                    event_id = input(
                        "Enter the event id which you want to book your tickets(event ID in the form of E001):"
                    )
                    num_tickets = int(input("Enter no of tickets to book :"))
                    print(self.booking_service.book_tickets(event_id, num_tickets))
                elif choice == 3:
                    event_id = input(
                        "Enter the event id which you want to book your tickets:"
                    )
                    num_tickets = int(input("Enter no of tickets to book :"))
                    print(self.booking_service.cancel_booking(event_id, num_tickets))
                elif choice == 4:
                    event_id = input(
                        "Enter the event id which you want to book your tickets:"
                    )
                    print(self.booking_service.get_available_no_of_tickets(event_id))
                elif choice == 5:
                    self.booking_service.get_event_details()
                elif choice == 6:
                    break
                else:
                    print("Sorry Please Enter a valid option ❌")

    def event_menu(self):
        while True:
            print(
                """
                  1] Calculate total revenue
                  2] Get Booked Tickets
                  3] Display event Details
                  4] Exit
                
            """
            )
            choice = int(input("Please choose from above options:"))
            if choice == 1:
                self.event_service.calculate_total_revenue()
            elif choice == 2:
                self.event_service.get_booked_no_of_tickets()
            elif choice == 3:
                self.event_service.get_event_details()
            elif choice == 4:
                break
            else:
                print("Sorry Please Enter a valid option")
              


def main():
    main_menu = MainMenu()

    while True:
        print(
            """
              1] Booking Management
              2] Event Management
              3] Get Venue Details
              4] Get Customer Details
              5] Exit"""
        )
        choice = int(input("Please choose from on of options:"))
        if choice == 1:
            main_menu.booking_menu()
        elif choice == 2:
             main_menu.event_menu()
        elif choice == 3:
            main_menu.venue_service.display_venue_details()
        elif choice == 4:
            main_menu.customer_service.display_customer_details()
        elif choice == 5:
             main_menu.booking_service.close()
             main_menu.event_service.close()
             break


if __name__ == "__main__":
    print("Welcome to the ticket booking app")
    main()