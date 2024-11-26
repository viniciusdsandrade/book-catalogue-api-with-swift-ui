import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "http://localhost:5000/items"

    func fetchItems(completion: @escaping ([AppItem]?) -> Void) {
        guard let url = URL(string: baseURL) else { completion(nil); return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else { completion(nil); return }
            completion(try? JSONDecoder().decode([AppItem].self, from: data))
        }.resume()
    }
    
    func createItem(_ item: AppItem, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: baseURL) else { completion(false); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(item)
        
        URLSession.shared.dataTask(with: request) { _, response, _ in
            let success = (response as? HTTPURLResponse)?.statusCode == 201
            completion(success)
        }.resume()
    }
    
    func deleteItem(_ item: AppItem, completion: @escaping (Bool) -> Void) {
        guard let id = item.id, let url = URL(string: "\(baseURL)/\(id)") else { completion(false); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, _ in
            let success = (response as? HTTPURLResponse)?.statusCode == 200
            completion(success)
        }.resume()
    }
}
