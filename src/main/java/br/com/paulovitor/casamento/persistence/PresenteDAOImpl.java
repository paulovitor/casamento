package br.com.paulovitor.casamento.persistence;

import java.util.List;

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
	public void salva(Presente presente) {
		if (presente.getId() == null)
			this.manager.persist(presente);
		else
			this.manager.merge(presente);
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
