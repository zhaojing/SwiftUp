 import Alamofire

let BASEURL = "http://127.0.0.1:3003/"

class NetworkFetcher: NSObject {
    func get(url: URL, success: @escaping ((Data) -> Void), error: @escaping ((Error)-> Void)) {
        Alamofire.request(url, method: .get).validate().responseData{ response in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let errorResponse):
                error(errorResponse)
            }
        }
    }
}
