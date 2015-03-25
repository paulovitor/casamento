package br.com.paulovitor.casamento.persistence;

import java.util.List;

public interface BaseDAO<T> {

	public void atualiza(T entity);

	public T get(Integer id);

	public void exclui(T entity);

	public void salva(T entity);

	public List<T> todos();
}
