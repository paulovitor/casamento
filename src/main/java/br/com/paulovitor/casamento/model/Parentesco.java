package br.com.paulovitor.casamento.model;

import java.util.List;

public interface Parentesco {

	public Familia buscaFamilia(String email);

	public List<Familia> buscaFamilias(String nome);
}
