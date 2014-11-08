package br.com.paulovitor.casamento.persistence;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Familia;

@Transactional
public class FamiliaDAOImpl implements FamiliaDAO {

	private final EntityManager manager;

	@Inject
	public FamiliaDAOImpl(EntityManager manager) {
		this.manager = manager;
	}

	@Deprecated
	FamiliaDAOImpl() {
		this(null);
	}

	@Override
	public Familia buscaPorEmail(String email) {
		try {
			return this.manager
					.createQuery(
							"select f from Familia f where f.email = :email",
							Familia.class).setParameter("email", email)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
