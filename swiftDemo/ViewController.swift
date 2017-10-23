import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "用户列表"
        navigationController?.navigationBar.prefersLargeTitles = true
        requestUser()
    }
    
    func requestUser() {
        UserHelper().getUsers(success: { (users) in
            self.users = users
            self.tableView.reloadData()
        }, error: { (error) in
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let reuseName = NSStringFromClass(UserCell.classForCoder()).components(separatedBy: ".").last, let cell = tableView.dequeueReusableCell(withIdentifier: reuseName) as? UserCell {
            cell.configureUserData(user: users[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
