package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Presente;

@Transactional
public class PresenteDAOImpl implements PresenteDAO {

	private final EntityManager manager;

	@Inject
	public PresenteDAOImpl(EntityManager manager) {
		this.manager = manager;
	}

	/**
	 * @deprecated Usado no CDI
	 */
	PresenteDAOImpl() {
		this(null);
	}

	@Override
	public List<Presente> todos() {
		return (List<Presente>) this.manager.createQuery(
				"select p from Presente p", Presente.class).getResultList();
	}

	@Override
	public void adiciona(Presente presente) {
		this.manager.persist(presente);
	}

}
