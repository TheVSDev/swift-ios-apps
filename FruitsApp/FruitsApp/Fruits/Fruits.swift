import Foundation

struct Fruits: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var description: String
    var colorLight: String
    var colorDark: String
}
