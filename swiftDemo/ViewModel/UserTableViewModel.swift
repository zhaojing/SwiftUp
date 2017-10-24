import Foundation

class UserTableViewModel: NSObject {
    var users = [User]()
    let title = "用户列表"
    
    func getUsers(_ fetcher: NetworkFetcher = NetworkFetcher(), success: @escaping (() -> Void), error: @escaping ((Error)-> Void)) {
        UserHelper().getUsers(fetcher, success: { (users) in
            self.users = users
            success()
        }, error: { (errorResponse) in
            error(errorResponse)
        })
    }
    
    func getUserCount() -> Int {
        return users.count
    }
    
    func getUserData(_ indexPath: IndexPath) -> User {
        return users[indexPath.row]
    }
}
