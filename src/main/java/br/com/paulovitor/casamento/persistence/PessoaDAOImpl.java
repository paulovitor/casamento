package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Pessoa;

@Transactional
public class PessoaDAOImpl implements PessoaDAO {

	private final EntityManager manager;

	@Inject
	public PessoaDAOImpl(EntityManager manager) {
		this.manager = manager;
	}

	@Override
	public List<Pessoa> buscaPorFamilia(Familia familia) {
		try {
			return this.manager
					.createQuery(
							"select p from Pessoa p where p.familia like :familia",
							Pessoa.class).setParameter("familia", familia)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Pessoa get(Integer id) {
		try {
			return this.manager
					.createQuery("select p from Pessoa p where p.id = :id",
							Pessoa.class).setParameter("id", id)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void salva(Pessoa pessoa) {
		if (pessoa.getId() == null)
			this.manager.persist(pessoa);
		else
			this.manager.merge(pessoa);
	}

	@Override
	public List<Pessoa> todas() {
		return (List<Pessoa>) this.manager.createQuery(
				"select p from Pessoa p order by nome", Pessoa.class)
				.getResultList();
	}

}
