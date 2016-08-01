//: [Previous](@previous)

import Foundation


protocol Car {
    
    var model:String? {get set}
    var make :String? {get set}
    
}

class AbstractCar: NSObject,Car {
    
    private var _model:String?
    private var _make:String?
    
    init(model:String, make:String) {
        self._make = make
        self._model = model
    }
    
    override init() {
        super.init()
    }
    
    var model: String?{
        get { return _model }
        set { _model = newValue }
    }
    
    var make: String? {
        get { return _make }
        set { _make = newValue }
    }
    
}

enum CarType {
    case Fiat,Mazda
}

class Factory  {
    
    class func createCar(carType:CarType) -> AbstractCar {
        switch carType {
            
        case .Fiat:
            return Fiat()
            
        case .Mazda:
            return Mazda()
        }
    }
}

class Fiat : AbstractCar {
    
    override init() {
        super.init()
        self._make = "Fiat"
        self._model = "1990"
    }
}

class Mazda : AbstractCar {
    
    override init() {
        super.init()
        self._make = "Mazda"
        self._model = "1990"
    }
}

let fiat = Factory.createCar(.Fiat)
fiat._make
fiat._model


let mazda = Factory.createCar(.Mazda)
mazda._make
mazda._model

