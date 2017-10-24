import Foundation
import SwiftyJSON
@testable import SwiftDemo

class MockUserDataSuccessFetcher: NetworkFetcher {
    override  func get(url: URL, success: @escaping ((JSON) -> Void), error: @escaping ((Error)-> Void)) {
        let mockData: JSON = ["code": 0, "body":[[
        "id": 0,
        "name": "邱艳",
        "activeStatus": 0,
        "age": 69,
        "status": 0,
        "gender": 1,
        "nickName": "Kevin",
        "email": "v.mvva@@thoughtworks.com",
        "phone": "131956478014",
        "image": "http://dummyimage.com/100x100/79f2b2",
        "address": "广西壮族自治区 百色市 靖西县"],
        ["id": 1,
        "name": "张洋",
        "activeStatus": 1,
        "age": 33,
        "status": 0,
        "gender": 0,
        "nickName": "Robert",
        "email": "m.jhrnhlqbnr@@thoughtworks.com",
        "phone": "137254247583",
        "image": "http://dummyimage.com/100x100/f28f79",
        "address": "台湾 澎湖县 西屿乡"]]]
        success(mockData)
    }
}

class MockUserDataFailFetcher: NetworkFetcher {
    override func get(url: URL, success: @escaping ((JSON) -> Void), error: @escaping ((Error)-> Void)) {
        error(NSError(domain: NSUnderlyingErrorKey, code: NSURLErrorUnknown))
    }
}
