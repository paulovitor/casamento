package br.com.paulovitor.casamento.persistence;

import java.util.List;

public interface BaseDAO<T> {

	public T get(Integer id);

	public void salva(T entity);

	public List<T> todos();
}
