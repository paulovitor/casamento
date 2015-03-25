package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@SuppressWarnings("unchecked")
public abstract class BaseDAOImpl<T> implements BaseDAO<T> {

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
	public void exclui(T entity) {
		this.manager.remove(entity);
	}

	@Override
	public void salva(T entity) {
		this.manager.persist(entity);
	}

	@Override
	public List<T> todos() {
		return this.manager.createQuery(
				("FROM " + this.persistentClass.getName()) + " ORDER BY nome")
				.getResultList();
	}

}
