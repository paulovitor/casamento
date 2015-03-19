package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Pessoa;

@Transactional
public class PessoaDAOImpl extends BaseDAOImpl<Pessoa> implements PessoaDAO {

	public PessoaDAOImpl() {
		super(Pessoa.class);
	}

	@Override
	public List<Pessoa> buscaPorFamilia(Familia familia) {
		return this.manager
				.createQuery(
						"select p from Pessoa p where p.familia like :familia",
						Pessoa.class).setParameter("familia", familia)
				.getResultList();
	}

	@Override
	public List<Pessoa> buscarPorNome(String nome) {
		return this.manager
				.createQuery("select p from Pessoa p where p.nome like :nome",
						Pessoa.class).setParameter("nome", "%" + nome + "%")
				.getResultList();
	}

	@Override
	public Long getQuantidadeDePessoasConfirmadas() {
		try {
			return this.manager.createQuery(
					"select count(*) from Pessoa p where p.confirmado = true",
					Long.class).getSingleResult();
		} catch (NoResultException e) {
			return 0L;
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
