import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var deck = [Card]()
        
        for suit in suits {
            for value in values {
                deck.append(Card(suit: suit, value: value))
            }
        }
        return deck
    }

    public mutating func shuffle() {
        self.cards.shuffle()
    }

    public mutating func defineTrump() {
        self.trump = self.cards.last?.suit
        if let trump = self.trump {
            setTrumpCards(for: trump)
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for player in players {
            player.hand = Array(self.cards.dropLast(6))
            cards.removeLast(6)
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        for i in cards.indices {
            if cards[i].suit == trump {
                cards[i] = Card(suit: cards[i].suit, value: cards[i].value, isTrump: true)
            }
        }
    }
}

