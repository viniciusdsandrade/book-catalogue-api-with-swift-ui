package com.restful.book.configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;


@Configuration
@OpenAPIDefinition(
        info = @Info(
                title = "Livro API",
                description = "API RESTful para gerenciamento de livros.",
                version = "v1.0.0",
                termsOfService = "https://github.com/viniciusdsandrade/book-catalogue-api-with-swift-ui", // Substitua pelo repositório da sua aplicação
                contact = @Contact(
                        name = "Vinícius dos Santos Andrade", // Substitua pelo seu nome
                        email = "vinicius_andrade2010@hotmail.com", // Substitua pelo seu email
                        url = "https://www.linkedin.com/in/viniciusdsandrade/" // Substitua pela URL do seu LinkedIn ou site pessoal
                )
        )
)
public class SwaggerConfig {
}
