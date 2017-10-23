import UIKit
import Kingfisher

class UserCell: UITableViewCell {
    
    @IBOutlet weak var portrait: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var activeStatus: UILabel!
    func configureUserData(user: User) {
        portrait.kf.setImage(with: URL(string: user.image))
        name.text = user.name
        phone.text = user.phone
        address.text = user.address
        activeStatus.isHidden = (user.activeStatus == 0)
        setGender(user)
    }
    
    func setGender(_ user: User) {
        switch user.gender {
        case 0:
            gender.image = UIImage(named: "female")
        case 1:
            gender.image = UIImage(named: "male")
        default:
            gender.image = UIImage(named: "gender")
        }
    }
}
