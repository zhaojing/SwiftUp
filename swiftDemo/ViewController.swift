import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = UserTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        requestUser()
    }
    
    func requestUser() {
        viewModel.getUsers(success: {
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUserCount()
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let reuseName = NSStringFromClass(UserCell.classForCoder()).components(separatedBy: ".").last,
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseName) as? UserCell {
            cell.configureUserData(user: viewModel.getUserData(indexPath))
            return cell
        }
        return UITableViewCell()
    }
}
