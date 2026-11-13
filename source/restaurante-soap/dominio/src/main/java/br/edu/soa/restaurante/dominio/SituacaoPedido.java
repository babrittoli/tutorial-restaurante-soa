package br.edu.soa.restaurante.dominio;

public enum SituacaoPedido {
	// O pedido ainda pode receber alterações.
    ABERTO,
    // A conta foi encerrada.
    FECHADO,
    // O pedido foi cancelado.
    CANCELADO
}
