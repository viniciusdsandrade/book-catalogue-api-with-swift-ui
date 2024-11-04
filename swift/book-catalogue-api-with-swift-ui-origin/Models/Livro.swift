//
//  Livro.swift
//  book-catalogue-api-with-swift-ui
//
//  Created by VINICIUS DOS SANTOS ANDRADE on 04/11/24.
//

import Foundation

/// Modelo que representa um Livro.
struct Livro: Codable, Identifiable {
    /// Identificador único do livro.
    var id: UUID = UUID()
    /// Título do livro.
    var titulo: String
    /// Autor do livro.
    var autor: String
    /// Descrição do livro.
    var descricao: String
    /// Gênero do livro.
    var genero: String
    /// URL da imagem da capa do livro.
    var urlImagem: String
}
