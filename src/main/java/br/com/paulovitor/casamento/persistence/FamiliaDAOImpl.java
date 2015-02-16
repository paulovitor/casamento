package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Familia;

@Transactional
public class FamiliaDAOImpl extends BaseDAOImpl<Familia> implements FamiliaDAO {

	@Inject
	public FamiliaDAOImpl(EntityManager manager) {
		super(manager, Familia.class);
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

	@Override
	public List<Familia> buscaPorNome(String nome) {
		try {
			return this.manager
					.createQuery(
							"select f from Familia f where f.nome like :nome",
							Familia.class)
					.setParameter("nome", "%" + nome + "%").getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void salva(Familia entity) {

	}

}
