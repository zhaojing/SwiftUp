import SwiftyJSON
import Alamofire

let BASEURL = "http://127.0.0.1:3003/"

class NetworkFetcher: NSObject {
    func get(url: URL, success: @escaping ((JSON) -> Void), error: @escaping ((Error)-> Void)) {
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                success(JSON(value))
            case .failure(let errorResponse):
                error(errorResponse)
            }
        }
    }
}
