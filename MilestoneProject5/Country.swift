import Foundation

//capital city, size, population, currency
struct Country: Decodable {
    var name: String
    var capital: String
    var size: String
    var population: Int
    var currency: String
}
