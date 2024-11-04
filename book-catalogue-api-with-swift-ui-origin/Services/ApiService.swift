//
//  ApiService.swift
//  book-catalogue-api-with-swift-ui
//
//  Created by VINICIUS DOS SANTOS ANDRADE on 04/11/24.
//

import Foundation

/// Classe responsável pelas requisições à API.
class ApiService {
    /// URL base da API.
    let baseURL = "https://sua-api.com/api/livros" // Substitua pela URL da sua API.

    /// Realiza uma requisição GET para obter a lista de livros.
    func fetchLivros(completion: @escaping ([Livro]) -> Void) {
        guard let url = URL(string: baseURL) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let livros = try JSONDecoder().decode([Livro].self, from: data)
                    DispatchQueue.main.async {
                        completion(livros)
                    }
                } catch {
                    print("Erro ao decodificar: \(error)")
                }
            }
        }.resume()
    }

    /// Realiza uma requisição POST para adicionar um novo livro.
    func addLivro(livro: Livro, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: baseURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(livro)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let _ = data {
                    DispatchQueue.main.async {
                        completion(true)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
            }.resume()
        } catch {
            print("Erro ao codificar: \(error)")
            completion(false)
        }
    }
}
