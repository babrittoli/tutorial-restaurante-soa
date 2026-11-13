package br.edu.soa.restaurante.dominio;

public record Categoria(  // Identificação técnica da categoria.
	    long id,
	    // Nome do grupo, por exemplo: Bebidas.
	    String nome,
	    // Texto de apresentação da categoria.
	    String descricao,
	    // Indicação que será considerada pelas regras da aplicação.
	    boolean ativo) {
}
