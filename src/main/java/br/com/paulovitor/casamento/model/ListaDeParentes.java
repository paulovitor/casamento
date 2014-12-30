package br.com.paulovitor.casamento.model;

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

}
