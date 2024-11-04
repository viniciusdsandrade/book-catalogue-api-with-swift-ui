package com.restful.book.repository;

import com.restful.book.model.Livro;
import org.springframework.data.mongodb.repository.MongoRepository;

/// Interface que gerencia o acesso aos dados do Livro no MongoDB.
public interface LivroRepository extends MongoRepository<Livro, String> {
}