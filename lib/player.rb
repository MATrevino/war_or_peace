class Player

    attr_reader :name, :deck
    
    def initialize (name, deck)
        @name = name
        @deck = deck

    end

    def has_lost?
        true if @deck == []
        false 
    end



end
