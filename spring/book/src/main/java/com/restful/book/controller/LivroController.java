package com.restful.book.controller;

import java.util.List;

import java.util.List;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.restful.book.model.Livro;
import com.restful.book.service.LivroService;

import jakarta.validation.Valid;

import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.NO_CONTENT;

/// Controlador REST que gerencia as operações de Livro.
@RestController
@RequestMapping("/api/livros")
@Validated
public class LivroController {

    /// Injeção de dependência do serviço de Livro.
    private final LivroService livroService;

    /// Construtor que injeta o serviço de Livro.
    public LivroController(LivroService livroService) {
        this.livroService = livroService;
    }

    /// Retorna a lista de todos os livros cadastrados.
    @GetMapping
    public List<Livro> getAllLivros() {
        return livroService.getAllLivros();
    }

    /// Cadastra um novo livro.
    @PostMapping
    @ResponseStatus(CREATED)
    public Livro createLivro(@Valid @RequestBody Livro livro) {
        return livroService.createLivro(livro);
    }

    /// Retorna um livro específico por ID.
    @GetMapping("/{id}")
    public Livro getLivroById(@PathVariable String id) {
        return livroService.getLivroById(id);
    }

    /// Atualiza um livro existente.
    @PutMapping("/{id}")
    public Livro updateLivro(@PathVariable String id, @Valid @RequestBody Livro livroAtualizado) {
        return livroService.updateLivro(id, livroAtualizado);
    }

    /// Exclui um livro por ID.
    @DeleteMapping("/{id}")
    @ResponseStatus(NO_CONTENT)
    public void deleteLivro(@PathVariable String id) {
        livroService.deleteLivro(id);
    }
}