
import Foundation


class AbstractCard {
    var name: String?
    var mana: Int?
    var attack: Int?
    var defense: Int?
    
    init(name:String?, mana:Int?, attack:Int?, defense:Int?) {
        self.name = name
        self.attack = attack
        self.defense = defense
        self.mana = mana
    }
  
    func clone() -> AbstractCard {
        return AbstractCard(name:name,mana:mana,attack:attack,defense:defense)
    }
}


class Card: AbstractCard {
    
    override init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        super.init(name: name, mana: mana, attack: attack, defense: defense)
    }
    
}


var card = Card(name: "A", mana: 5, attack: 5, defense: 5)
var facelessManipulator = card.clone()
facelessManipulator.mana
facelessManipulator.name
