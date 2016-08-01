//: [Previous](@previous)

import Foundation
import UIKit

// ******************* Abstract Products ************************

protocol IButton {
    var  color: UIColor {get set}
    var  frame: CGRect {get set}
    init (frame: CGRect)
}

protocol IMenu {
 
    var color: UIColor {get set}
    var frame: CGRect {get set}
    init(frame: CGRect)
    
}

// ******************* Product family 1 ************************

class IOSButton: IButton {
    
    var color: UIColor = UIColor.whiteColor()
    var frame: CGRect

    required init(frame: CGRect) {
        self.frame = frame
    }
    
}

class IOSMenu: IMenu {
    
    var color: UIColor = UIColor.whiteColor()
    var frame: CGRect
    
    required init(frame: CGRect) {
        self.frame = frame
    }
}

// ******************* Product family 2 ************************

class AndroidButton: IButton {
    
    var color: UIColor = UIColor.greenColor()
    var frame: CGRect
    
    required init(frame: CGRect) {
        self.frame = frame
    }
}

class AndroidMenu: IMenu {
    
    var color: UIColor = UIColor.whiteColor()
    var frame: CGRect
    
    required init(frame: CGRect) {
        self.frame = frame
    }
}

// ******************* Factory ************************

protocol IFactory  {
    
    func createButton(frame:CGRect) -> IButton
    func createMenu(frame:CGRect) -> IMenu
    
}

// ******************* iOS factory ************************

class IOSFactory: IFactory {
    
    func createButton(frame:CGRect) -> IButton {
        return IOSButton(frame:frame);
    }
    
    func createMenu(frame:CGRect) -> IMenu {
        return IOSMenu(frame:frame)
    }
}

// ******************* Android factory ************************

class AndroidFactory: IFactory {
    
    func createButton(frame:CGRect) -> IButton {
        return IOSButton(frame:CGRectMake(0, 0, 20, 20));
    }
    
    func createMenu(frame:CGRect) -> IMenu {
        return IOSMenu(frame:CGRectMake(0, 0, 50, 100))
    }
}

// ******************* Client ************************

class Client {
    
    var platform:Platform!
    var factory:IFactory!
    
    init(platform:Platform) {
        self.platform = platform
        if platform == .iOS {
            self.factory = IOSFactory()
        }else if platform == .Android {
            self.factory = AndroidFactory()
        }
    }
    
    func drawButton(frame:CGRect) -> Void {
        factory.createButton(frame)
    }
    
    func drawMenu(frame:CGRect) -> Void {
        factory.createMenu(frame)
    }

}

enum Platform : String {
    case iOS = "iOS",
    Android = "Android"
}



