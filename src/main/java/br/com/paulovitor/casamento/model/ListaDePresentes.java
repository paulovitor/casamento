package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

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
	@Transactional
	public void adiciona(List<Presente> presentes) {
		for (Presente presente : presentes) {
			this.dao.salva(presente);
		}
	}

	@Override
	public Presente get(Integer id) {
		return dao.get(id);
	}

	@Override
	public List<Presente> lista(TipoPresente tipoPresente) {
		return this.dao.todosPorTipo(tipoPresente);
	}

	@Override
	public List<Presente> listaTodos() {
		return this.dao.todos();
	}

	@Override
	@Transactional
	public void salva(Presente presente) {
		if (presente.getId() == null)
			dao.salva(presente);
		else
			dao.atualiza(presente);
	}

}
