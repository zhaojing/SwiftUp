struct User: Codable {
    let id: Int
    let name: String
    let activeStatus: Int
    let age: Int
    let status: Int
    let gender: Int
    let email: String
    let phone: String
    let image: String
    let address: String
}

struct Users: Codable {
    let body: [User]
}
