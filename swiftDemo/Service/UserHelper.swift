import SwiftyJSON
import UIKit

class UserHelper: NSObject {
    func getUsers(_ fetcher: NetworkFetcher = NetworkFetcher(), success: @escaping (([User]) -> Void), error: @escaping ((Error)-> Void)) {
        if let url = URL(string: BASEURL + "users") {
            fetcher.get(url: url, success: { (dic) in
                success(dic["body"].arrayValue.map({ (data: JSON) -> User in
                    return User(id: data["status"].intValue,
                                name: data["name"].stringValue,
                                activeStatus: data["activeStatus"].intValue,
                                age: data["age"].intValue,
                                status: data["status"].intValue,
                                gender: data["gender"].intValue,
                                email: data["email"].stringValue,
                                phone: data["phone"].stringValue,
                                image: data["image"].stringValue,
                                address: data["address"].stringValue)
                }))
            }) { (errorResponse) in
                error(errorResponse)
            }
        }
    }
}
