import Foundation
import SwiftyJSON

struct Repo {
    let id: Int
    let fullName: String
    let description: String
    let language: String?
    let stargazers: Int
    let forks: Int
}

extension Repo: JSONable {
    static func fromJSON(json: AnyObject) -> Repo {
        let json = JSON(json)
        
        let id = json["id"].intValue
        let fullName = json["full_name"].stringValue
        let description = json["description"].stringValue
        let language = json["language"].string
        let stargazers = json["stargazers_count"].intValue
        let forks = json["forks"].intValue
        
        return Repo(id: id,
            fullName: fullName,
            description: description,
            language: language,
            stargazers: stargazers,
            forks: forks)
    }
}
