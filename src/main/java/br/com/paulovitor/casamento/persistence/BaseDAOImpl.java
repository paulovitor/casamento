package br.com.paulovitor.casamento.persistence;

import java.util.List;

import javax.persistence.EntityManager;

@SuppressWarnings("unchecked")
public abstract class BaseDAOImpl<T> implements BaseDAO<T> {

	protected final EntityManager manager;
	private Class<T> persistentClass;

	public BaseDAOImpl(EntityManager manager, Class<T> persistentClass) {
		this.manager = manager;
		this.persistentClass = persistentClass;
	}

	@Override
	public T get(Integer id) {
		return (T) this.manager.find(this.persistentClass, id);
	}

	@Override
	public List<T> todos() {
		return this.manager.createQuery(
				("FROM " + this.persistentClass.getName()) + " ORDER BY nome")
				.getResultList();
	}

}
