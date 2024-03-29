import Foundation

struct Posts: Codable, Hashable, Identifiable {
    var id: Int
    var username: String
    var post: String
}
