struct RepositorieModel: Codable {
    
    let identifier: Int
    let name: String
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case fullName = "full_name"
    }
}
