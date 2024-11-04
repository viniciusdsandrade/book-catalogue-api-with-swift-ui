//
//  ContentView.swift
//  book-catalogue-api-with-swift-ui
//
//  Created by VINICIUS DOS SANTOS ANDRADE on 04/11/24.
//

import SwiftUI

/// Tela principal que exibe a lista de livros.
struct ContentView: View {
    /// Objeto ViewModel para gerenciar os dados.
    @ObservedObject var viewModel = LivroViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.livros) { livro in
                NavigationLink(destination: DetalhesView(livro: livro)) {
                    HStack {
                        AsyncImage(url: URL(string: livro.urlImagem)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 50, height: 70)
                        .clipped()
                        VStack(alignment: .leading) {
                            Text(livro.titulo)
                                .font(.headline)
                            Text(livro.autor)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Livros")
            .toolbar {
                // Use ToolbarItem to place the navigation link in the toolbar
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: CadastroView(viewModel: viewModel)) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.fetchLivros()
            }
        }
    }
}
