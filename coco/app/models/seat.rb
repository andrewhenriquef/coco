class Seat < ActiveRecord::Base
    belongs_to :flight
    validate :bagagem
    
    def bagagem
        
        if baggage > flight.baggage_allowance
            
            errors.add(:baggage, "Você tm bagagem em excesso!")
            
        end
        
        if flight.seats.size >= flight.capacity
            errors.add(:capacity, "As reservas para este voo estao esgotadas")
        end
        
    end
    
end
