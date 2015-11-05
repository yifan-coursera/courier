import Foundation
import SwiftyJSON

public struct WithTypedDefinition: JSONSerializable, DataTreeSerializable, Equatable {
    
    public let value: TypedDefinition?
    
    public init(
        value: TypedDefinition?
    ) {
        self.value = value
    }
    
    public static func readJSON(json: JSON) -> WithTypedDefinition {
        return WithTypedDefinition(
            value: json["value"].json.map { TypedDefinition.readJSON($0) }
        )
    }
    public func writeJSON() -> JSON {
        return JSON(self.writeData())
    }
    public static func readData(data: [String: AnyObject]) -> WithTypedDefinition {
        return readJSON(JSON(data))
    }
    public func writeData() -> [String: AnyObject] {
        var dict: [String : AnyObject] = [:]
        if let value = self.value {
            dict["value"] = value.writeData()
        }
        return dict
    }
}
public func ==(lhs: WithTypedDefinition, rhs: WithTypedDefinition) -> Bool {
    return (
        (lhs.value == nil ? (rhs.value == nil) : lhs.value! == rhs.value!) &&
        true
    )
}
