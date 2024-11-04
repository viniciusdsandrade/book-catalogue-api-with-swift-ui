//
//  DetalhesView.swift
//  book-catalogue-api-with-swift-ui
//
//  Created by VINICIUS DOS SANTOS ANDRADE on 04/11/24.
//

import SwiftUI

/// Tela que exibe os detalhes de um livro.
struct DetalhesView: View {
    /// O livro a ser exibido.
    var livro: Livro

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: livro.urlImagem)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                Text("Título: \(livro.titulo)")
                    .font(.title2)
                    .bold()
                Text("Autor: \(livro.autor)")
                    .font(.title3)
                Text("Gênero: \(livro.genero)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Descrição:")
                    .font(.headline)
                Text(livro.descricao)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(livro.titulo)
        // Apply the modifier only on iOS
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}
