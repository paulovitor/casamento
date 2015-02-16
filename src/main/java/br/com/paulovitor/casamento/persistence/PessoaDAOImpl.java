package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Pessoa;

@Transactional
public class PessoaDAOImpl extends BaseDAOImpl<Pessoa> implements PessoaDAO {

	@Inject
	public PessoaDAOImpl(EntityManager manager) {
		super(manager, Pessoa.class);
	}

	@Deprecated
	public PessoaDAOImpl() {
		this(null);
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
	public void salva(Pessoa pessoa) {
		if (pessoa.getId() == null)
			this.manager.persist(pessoa);
		else
			this.manager.merge(pessoa);
	}

}
