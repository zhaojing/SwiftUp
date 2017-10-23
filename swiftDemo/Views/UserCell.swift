import UIKit
import Kingfisher
import Rswift

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
            gender.image = R.image.female()
        case 1:
            gender.image = R.image.male()
        default:
            gender.image = R.image.gender()
        }
    }
}
