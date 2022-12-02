require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
    it "exists" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn).to be_an_instance_of(Turn)
    end

    it "can give a player's name" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn.player1.name).to eq("Megan")
        expect(turn.player2.name).to eq("Aurora")
    end

    it 'tests spoils of war' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 

        expect(turn.spoils_of_war).to eq([])
    end

    it 'tests for :basic type of game' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn.type).to eq(:basic)
    end

    it 'tests for :war type of game' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, 'Jack', 11)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn.type).to eq(:war)
    end

    it 'tests for :mult. assured dest. type of game' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:diamond, 'Jack', 11)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, '8', 8) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '3', 3) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it 'announces winner' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn.winner).to eq(player1)
    end

    it 'piles cards for :basic' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 

        expect(turn.type).to eq(:basic)

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it 'piles cards for :war' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, 'Jack', 11)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 

        expect(turn.type).to eq(:war)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3, card5, card6])
    end

    it 'piles cards for :mul.' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:diamond, 'Jack', 11)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, '8', 8) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '3', 3) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 
        expect(turn.type).to eq(:mutually_assured_destruction)

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3, card5, card6])
    end

    it 'awards spoils' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)  
        card6 = Card.new(:diamond, 'Queen', 12) 
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1) 
        player2 = Player.new("Aurora", deck2)  

        turn = Turn.new(player1, player2) 

        expect(turn.type).to eq(:basic)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
        turn.winner
        turn.award_spoils(player1)
        
        expect(player1.deck).to eq(deck1)
        expect(player2.deck).to eq(deck2)

    end

end    
