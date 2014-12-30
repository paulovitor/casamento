package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.inject.Inject;

import br.com.paulovitor.casamento.persistence.PresenteDAO;

public class ListaDePresentes implements Checklist {

	private PresenteDAO dao;

	@Inject
	public ListaDePresentes(PresenteDAO dao) {
		this.dao = dao;
	}

	@Deprecated
	ListaDePresentes() {
		this(null);
	}

	@Override
	public Presente get(Integer id) {
		return dao.get(id);
	}

	@Override
	public void salva(Presente presente) {
		dao.salva(presente);
	}

	@Override
	public List<Presente> lista(TipoPresente tipoPresente) {
		return this.dao.todosPorTipo(tipoPresente);
	}

	@Override
	public void adiciona(List<Presente> presentes) {
		for (Presente presente : presentes) {
			this.dao.salva(presente);
		}
	}

}
