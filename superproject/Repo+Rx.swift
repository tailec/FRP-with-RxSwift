import Foundation
import RxSwift

extension Observable {
    func mapToRepos() -> Observable<[Repo]> {
        return self.map { json in
            let dict = json as? [String: AnyObject]
            if let items = dict?["items"] as? [AnyObject] {
                return Repo.fromJSONArray(items)
            } else {
                return []
            }
        }
    }
}