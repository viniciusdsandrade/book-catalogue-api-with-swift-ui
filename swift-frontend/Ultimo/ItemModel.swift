import Foundation

struct AppItem: Identifiable, Codable {
    var id: String?
    var title: String
    var description: String
    var imageUrl: String
    var category: String
    var price: Double
}
