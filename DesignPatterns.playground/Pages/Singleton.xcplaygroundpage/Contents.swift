//: [Previous](@previous)

import Foundation

class BoardgameManager {
    
    static let sharedInstance = BoardgameManager()
    
    init(){
        
    }
    
    func testFunction() -> String {
        return "test"
    }
}

BoardgameManager.sharedInstance.testFunction()


