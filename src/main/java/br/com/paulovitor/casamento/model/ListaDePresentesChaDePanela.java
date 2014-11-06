package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.inject.Inject;

import br.com.paulovitor.casamento.persistence.PresenteDAO;

public class ListaDePresentesChaDePanela implements Checklist {

	private PresenteDAO dao;

	@Inject
	public ListaDePresentesChaDePanela(PresenteDAO dao) {
		this.dao = dao;
	}

	/**
	 * @deprecated Usado no CDI
	 */
	ListaDePresentesChaDePanela() {
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
	public List<Presente> lista() {
		return this.dao.todos();
	}

	@Override
	public void adicionaTodos(List<Presente> presentes) {
		for (Presente presente : presentes) {
			this.dao.salva(presente);
		}
	}

}
