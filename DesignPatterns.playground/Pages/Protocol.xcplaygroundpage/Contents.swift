//: [Previous](@previous)

import Foundation

// Use protocols instad of pure abstract classes

protocol RandonNumberGenerator {
    
    associatedtype Output
    
    func next() -> Output
    
}

struct RandomdoubleGenerator : RandonNumberGenerator {
    
    var range:ClosedRange<Double>
    init( range:ClosedRange<Double>){
        self.range = range
    }
    
    func next() -> Double {
        return 0.0
    }
}

struct RGBColor {
    var red:Double
    var green:Double
    var blue:Double
}

struct RandomRGBColorGenerator : RandonNumberGenerator {
    
    private let componentGenerator = RandomdoubleGenerator(range:0...1)
    
    func next() -> RGBColor {
        return RGBColor(red: componentGenerator.next(), green: componentGenerator.next(), blue: componentGenerator.next())
    }
    
}

// Composition over inheritance

enum Result<T> {
    
    case success(T)
    case failure(Error)
    
}


class DataRequest {
    
    static func requestData(from url:URL, completion:@escaping (Result<Data>) -> Void ){
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(error!))
            }
        }.resume()
    }
}

protocol JSONObjectDecodable {
    init ( fron jsonObject:[String:Any] ) throws
}

enum JSONParsingError: Error {
    case unexpectedType(expected:Any.Type, found:Any.Type)
    case missingKey(String)
}

class JSONRequest : DataRequest {
    
    static func decodeJSONObject<T: JSONObjectDecodable>(_ : T.Type, from data:Data) throws -> T {
        
        let decoded = try JSONSerialization.jsonObject(with: data, options: [])
        
        guard let jsonObject = decoded as? [String:Any] else {
            throw JSONParsingError.unexpectedType(expected: [String:Any].self , found: type(of: decoded))
        }
        
        return try T(fron: jsonObject)
    }
    
    
}

