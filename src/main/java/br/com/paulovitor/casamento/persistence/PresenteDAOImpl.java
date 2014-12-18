package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

@Transactional
public class PresenteDAOImpl implements PresenteDAO {

	private final EntityManager manager;

	@Inject
	public PresenteDAOImpl(EntityManager manager) {
		this.manager = manager;
	}

	@Deprecated
	PresenteDAOImpl() {
		this(null);
	}

	@Override
	public Presente get(Integer id) {
		try {
			return this.manager
					.createQuery("select p from Presente p where p.id = :id",
							Presente.class).setParameter("id", id)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void salva(Presente presente) {
		if (presente.getId() == null)
			this.manager.persist(presente);
		else
			this.manager.merge(presente);
	}

	@Override
	public List<Presente> todos() {
		return (List<Presente>) this.manager.createQuery(
				"select p from Presente p order by nome", Presente.class)
				.getResultList();
	}

	@Override
	public List<Presente> todosPorTipo(TipoPresente tipoPresente) {
		return (List<Presente>) this.manager
				.createQuery(
						"select p from Presente p where tipo = :tipo order by nome",
						Presente.class).setParameter("tipo", tipoPresente)
				.getResultList();
	}

}
