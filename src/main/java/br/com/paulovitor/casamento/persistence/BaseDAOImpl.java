package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import br.com.paulovitor.casamento.model.Entidade;

@Transactional
@SuppressWarnings("unchecked")
public abstract class BaseDAOImpl<T extends Entidade> implements BaseDAO<T> {

	@PersistenceContext
	public EntityManager manager;
	private Class<T> persistentClass;

	public BaseDAOImpl(Class<T> persistentClass) {
		this.persistentClass = persistentClass;
	}

	@Override
	public void atualiza(T entity) {
		this.manager.merge(entity);
	}

	@Override
	public T get(Integer id) {
		return (T) this.manager.find(this.persistentClass, id);
	}

	@Override
	public void exclui(Integer id) {
		this.manager
				.remove(this.manager.getReference(this.persistentClass, id));
	}

	@Override
	public void salva(T entity) {
		this.manager.persist(entity);
	}

	@Override
	public void salvaOuAtualiza(T entity) {
		if (entity.getId() == null)
			salva(entity);
		else
			atualiza(entity);
	}

	@Override
	public List<T> todos() {
		return this.manager.createQuery(
				("FROM " + this.persistentClass.getName()) + " ORDER BY nome")
				.getResultList();
	}

}
