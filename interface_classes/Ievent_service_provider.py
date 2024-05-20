from abc import ABC, abstractmethod
from Util.DBConnUtil import DBConnection
from entity import Event


class IEvent_Service_Provider(ABC, DBConnection):

    @abstractmethod
    def create_event(self, event: Event):
        pass

    @abstractmethod
    def get_event_details(self):
        pass

    @abstractmethod
    def get_available_no_of_tickets(self):
        pass