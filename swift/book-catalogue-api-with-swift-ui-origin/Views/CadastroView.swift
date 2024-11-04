//
//  CadastroView.swift
//  book-catalogue-api-with-swift-ui
//
//  Created by VINICIUS DOS SANTOS ANDRADE on 04/11/24.
//

import SwiftUI

/// Tela que permite cadastrar um novo livro.
struct CadastroView: View {
    /// Objeto ViewModel para adicionar o livro.
    @ObservedObject var viewModel: LivroViewModel

    /// Campos de entrada do formulário.
    @State private var titulo = ""
    @State private var autor = ""
    @State private var descricao = ""
    @State private var genero = ""
    @State private var urlImagem = ""
    @State private var mostrandoAlerta = false
    @State private var mensagemAlerta = ""

    /// Validação para habilitar/desabilitar o botão de cadastro.
    var formularioValido: Bool {
        return !titulo.isEmpty && !autor.isEmpty && !descricao.isEmpty && !genero.isEmpty && !urlImagem.isEmpty
    }

    var body: some View {
        Form {
            Section(header: Text("Informações do Livro")) {
                TextField("Título", text: $titulo)
                TextField("Autor", text: $autor)
                TextField("Gênero", text: $genero)
                TextField("URL da Imagem", text: $urlImagem)
                TextEditor(text: $descricao)
                    .frame(height: 100)
            }

            Button(action: {
                let novoLivro = Livro(titulo: titulo, autor: autor, descricao: descricao, genero: genero, urlImagem: urlImagem)
                viewModel.addLivro(livro: novoLivro) { sucesso in
                    if sucesso {
                        mensagemAlerta = "Livro cadastrado com sucesso!"
                    } else {
                        mensagemAlerta = "Erro ao cadastrar o livro."
                    }
                    mostrandoAlerta = true
                }
            }) {
                Text("Cadastrar")
                    .frame(maxWidth: .infinity)
            }
            .disabled(!formularioValido)
        }
        .navigationTitle("Novo Livro")
        .alert(isPresented: $mostrandoAlerta) {
            Alert(title: Text("Cadastro"), message: Text(mensagemAlerta), dismissButton: .default(Text("OK")))
        }
    }
}

