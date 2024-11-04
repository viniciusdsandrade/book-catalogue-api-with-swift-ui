package com.restful.book.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.restful.book.model.Livro;
import com.restful.book.repository.LivroRepository;
import com.restful.book.service.LivroService;

import jakarta.validation.Valid;

/// Implementação da interface LivroService.
@Service
public class LivroServiceImpl implements LivroService {

    /// Injeção de dependência do repositório de Livro.
    private final LivroRepository livroRepository;

    /// Construtor que injeta o repositório de Livro.
    public LivroServiceImpl(LivroRepository livroRepository) {
        this.livroRepository = livroRepository;
    }

    /// {@inheritDoc}
    @Override
    public List<Livro> getAllLivros() {
        return livroRepository.findAll();
    }

    /// {@inheritDoc}
    @Override
    public Livro createLivro(@Valid Livro livro) {
        return livroRepository.save(livro);
    }

    /// {@inheritDoc}
    @Override
    public Livro getLivroById(String id) {
        return livroRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Livro não encontrado"));
    }

    /// {@inheritDoc}
    @Override
    public Livro updateLivro(String id, @Valid Livro livroAtualizado) {
        Livro livro = livroRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Livro não encontrado"));

        livro.setTitulo(livroAtualizado.getTitulo());
        livro.setAutor(livroAtualizado.getAutor());
        livro.setDescricao(livroAtualizado.getDescricao());
        livro.setGenero(livroAtualizado.getGenero());
        livro.setUrlImagem(livroAtualizado.getUrlImagem());

        return livroRepository.save(livro);
    }

    /// {@inheritDoc}
    @Override
    public void deleteLivro(String id) {
        Livro livro = livroRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Livro não encontrado"));

        livroRepository.delete(livro);
    }
}