import Foundation
import SwiftyJSON

public struct WithPrimitiveTyperefs: JSONSerializable {
    
    public let intField: Int?
    
    public let longField: Int?
    
    public let floatField: Float?
    
    public let doubleField: Double?
    
    public let booleanField: Bool?
    
    public let stringField: String?
    
    public let bytesField: String?
    
    public init(
        intField: Int?,
        longField: Int?,
        floatField: Float?,
        doubleField: Double?,
        booleanField: Bool?,
        stringField: String?,
        bytesField: String?
    ) {
        self.intField = intField
        self.longField = longField
        self.floatField = floatField
        self.doubleField = doubleField
        self.booleanField = booleanField
        self.stringField = stringField
        self.bytesField = bytesField
    }
    
    public static func read(json: JSON) -> WithPrimitiveTyperefs {
        return WithPrimitiveTyperefs(
            intField: json["intField"].int,
            longField: json["longField"].int,
            floatField: json["floatField"].float,
            doubleField: json["doubleField"].double,
            booleanField: json["booleanField"].bool,
            stringField: json["stringField"].string,
            bytesField: json["bytesField"].string
        )
    }
    public func write() -> JSON {
        var json: [String : JSON] = [:]
        if let intField = self.intField {
            json["intField"] = JSON(intField)
        }
        if let longField = self.longField {
            json["longField"] = JSON(longField)
        }
        if let floatField = self.floatField {
            json["floatField"] = JSON(floatField)
        }
        if let doubleField = self.doubleField {
            json["doubleField"] = JSON(doubleField)
        }
        if let booleanField = self.booleanField {
            json["booleanField"] = JSON(booleanField)
        }
        if let stringField = self.stringField {
            json["stringField"] = JSON(stringField)
        }
        if let bytesField = self.bytesField {
            json["bytesField"] = JSON(bytesField)
        }
        return JSON(json)
    }
}