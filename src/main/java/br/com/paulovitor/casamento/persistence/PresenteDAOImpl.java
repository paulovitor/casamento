package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

@Transactional
public class PresenteDAOImpl extends BaseDAOImpl<Presente> implements
		PresenteDAO {

	public PresenteDAOImpl() {
		super(Presente.class);
	}

	@Override
	public Long getQuantidadeDePresentesEscolhidos() {
		try {
			return this.manager.createQuery(
					"select count(*) from Presente p where p.ok = true",
					Long.class).getSingleResult();
		} catch (NoResultException e) {
			return 0L;
		}
	}

	@Override
	public List<Presente> todosPorTipo(TipoPresente tipoPresente) {
		return this.manager
				.createQuery(
						"select p from Presente p where tipo = :tipo order by nome",
						Presente.class).setParameter("tipo", tipoPresente)
				.getResultList();
	}

}
