require_relative "passenger"

class Flight 
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity 
        @passengers = []
    end 

    def passengers
        @passengers
    end 

    def full?
        if @passengers.length == @capacity
            return true 
        else 
            return false 
        end 
    end 

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && self.full? == false
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|passenger| passenger.name}
    end

    def [](index)
        return @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end 