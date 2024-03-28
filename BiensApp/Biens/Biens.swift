import Foundation

struct Biens: Codable, Hashable{
    var id:Int
    var title:String
    var image:String
    var price:Int
    var description:String
}
