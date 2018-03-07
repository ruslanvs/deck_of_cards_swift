//: Playground - noun: a place where people can play

import UIKit

enum Color {
    case Red, Blue, Green
}

struct Card {
    var color: Color
    var roll: Int //put in the random values?
}

class Deck {
    var cards: [Card]
    init() {
        cards = []
        for i in 1...10{
            var roll_value = arc4random_uniform(2)+3
            var new_card = Card( color: .Red, roll: Int(roll_value) )
            cards.append( new_card )
        }
        for i in 1...10{
            var roll_value = arc4random_uniform(2)+1
            roll_value
            var new_card = Card( color: .Blue, roll: Int(roll_value) )
            cards.append( new_card )
        }
        for i in 1...10{
            var roll_value = arc4random_uniform(3)+4
            roll_value
            var new_card = Card( color: .Green, roll: Int(roll_value) )
            cards.append( new_card )
        }
        
    }
    
    func deal() -> Card{
        let top_most = self.cards.count - 1
        var dealt = self.cards.remove( at: top_most )
        return dealt
    }
    
    func isEmpty() -> Bool{
        return self.cards.count == 0
    }
    
    func shuffle() -> Deck{
        let count = self.cards.count
        for i in 0..<count{
            for j in i..<count{
                let rand_index = Int( arc4random_uniform( UInt32( count ) ) )
                let temp = self.cards[j]
                self.cards[j] = self.cards[rand_index]
                self.cards[rand_index] = temp
            }
        }
        return self
    }
}

class Player{
    var name: String
    var hand: [Card]
    init( name: String, hand: [Card] ){
        self.name = name
        self.hand = hand
    }
    func draw( deck: Deck ) -> Card{
        let drawn_card = deck.deal()
        hand.append( drawn_card )
        return drawn_card
    }
    
    func rollDice() -> Int {
        return Int( arc4random_uniform(7) )
    }
    
    func matchingCards( color: Color, roll: Int ) -> Int {
        var count: Int = 0
        for card in self.hand{
            if card.color == color && card.roll == roll{
                count += 1
            }
        }
        print( "The matching cards count is: \( count )" )
        return count
    }
}

var deck: Deck = Deck()
deck.shuffle()

for card in deck.cards{
    print( card )
}

var player = Player( name: "Jonathan", hand: [] )


player.draw( deck: deck )
player.draw( deck: deck )
player.draw( deck: deck )
player.draw( deck: deck )

print ( "player hand \( player.hand )" )

player.matchingCards( color: .Green, roll: 5)
