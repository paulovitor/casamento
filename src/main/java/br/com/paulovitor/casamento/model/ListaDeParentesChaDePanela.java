package br.com.paulovitor.casamento.model;

import javax.inject.Inject;

import br.com.paulovitor.casamento.persistence.FamiliaDAO;

public class ListaDeParentesChaDePanela implements Parentesco {

	private FamiliaDAO dao;

	@Inject
	public ListaDeParentesChaDePanela(FamiliaDAO dao) {
		this.dao = dao;
	}

	/**
	 * @deprecated Usado no CDI
	 */
	ListaDeParentesChaDePanela() {
		this(null);
	}

	@Override
	public Familia buscaFamilia(String email) {
		return this.dao.buscaPorEmail(email);
	}

}
