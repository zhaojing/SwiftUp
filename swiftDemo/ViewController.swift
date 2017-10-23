import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 5
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
