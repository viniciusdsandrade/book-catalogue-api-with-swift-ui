package com.restful.book.service;

import java.util.List;

import com.restful.book.model.Livro;

/// Interface que define os métodos de serviço para o gerenciamento de livros.
public interface LivroService {

    /// Retorna a lista de todos os livros cadastrados.
    List<Livro> getAllLivros();

    /// Cadastra um novo livro.
    Livro createLivro(Livro livro);

    /// Retorna um livro específico por ID.
    Livro getLivroById(String id);

    /// Atualiza um livro existente.
    Livro updateLivro(String id, Livro livroAtualizado);

    /// Exclui um livro por ID.
    void deleteLivro(String id);
}
