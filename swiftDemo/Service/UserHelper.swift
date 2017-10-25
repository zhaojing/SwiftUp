import UIKit

class UserHelper: NSObject {
    func getUsers(_ fetcher: NetworkFetcher = NetworkFetcher(), success: @escaping (([User]) -> Void), error: @escaping ((Error)-> Void)) {
        if let url = URL(string: BASEURL + "users") {
            fetcher.get(url: url, success: { (data) in
                do {
                    let users = try JSONDecoder().decode(Users.self, from: data)
                    success(users.body)
                } catch {
                    
                }
            }) { (errorResponse) in
                error(errorResponse)
            }
        }
    }
}
