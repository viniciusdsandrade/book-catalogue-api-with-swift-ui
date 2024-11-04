package com.restful.book.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/// Modelo que representa um Livro.
@Data
@Document(collection = "livros")
public class Livro {

    /// Identificador único do livro.
    @Id
    private String id;

    /// Título do livro.
    @NotBlank(message = "Título é obrigatório")
    private String titulo;

    /// Autor do livro.
    @NotBlank(message = "Autor é obrigatório")
    private String autor;

    /// Descrição do livro.
    @NotBlank(message = "Descrição é obrigatória")
    private String descricao;

    /// Gênero do livro.
    @NotBlank(message = "Gênero é obrigatório")
    private String genero;

    /// URL da imagem da capa do livro.
    @NotBlank(message = "URL da imagem é obrigatória")
    private String urlImagem;
}