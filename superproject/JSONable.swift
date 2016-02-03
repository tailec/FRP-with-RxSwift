// Credits goes to Artsy Eidelon (Ash Furrow, Orta Therox)

import Foundation

protocol JSONable {
    static func fromJSON(json: AnyObject) -> Self
}

extension JSONable {
    static func fromJSONArray(json: [AnyObject]) -> [Self] {
        return json.map { Self.fromJSON($0) }
    }
}
