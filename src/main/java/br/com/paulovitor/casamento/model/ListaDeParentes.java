package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.inject.Inject;

import br.com.paulovitor.casamento.persistence.FamiliaDAO;

public class ListaDeParentes implements Parentesco {

	private FamiliaDAO dao;

	@Inject
	public ListaDeParentes(FamiliaDAO dao) {
		this.dao = dao;
	}

	@Deprecated
	ListaDeParentes() {
		this(null);
	}

	@Override
	public Familia buscaFamilia(String email) {
		return this.dao.buscaPorEmail(email);
	}

	@Override
	public List<Familia> buscaFamilias(String nome) {
		return this.dao.buscaPorNome(nome);
	}

}
