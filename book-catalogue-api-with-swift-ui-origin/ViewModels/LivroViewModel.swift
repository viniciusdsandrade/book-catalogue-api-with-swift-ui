//
//  LivroViewModel.swift
//  book-catalogue-api-with-swift-ui
//
//  Created by VINICIUS DOS SANTOS ANDRADE on 04/11/24.
//

import Foundation

/// ViewModel que gerencia os dados dos livros.
class LivroViewModel: ObservableObject {
    /// Lista de livros carregados.
    @Published var livros: [Livro] = []

    /// Instância do serviço de API.
    private var apiService = ApiService()

    /// Carrega a lista de livros da API.
    func fetchLivros() {
        apiService.fetchLivros { [weak self] livros in
            self?.livros = livros
        }
    }

    /// Adiciona um novo livro usando a API.
    func addLivro(livro: Livro, completion: @escaping (Bool) -> Void) {
        apiService.addLivro(livro: livro) { success in
            if success {
                self.fetchLivros()
            }
            completion(success)
        }
    }
}

