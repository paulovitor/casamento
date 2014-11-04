package br.com.paulovitor.casamento.model;

import java.util.List;

public interface Checklist<T> {

	public List<T> lista();

	public void adicionaTodos(List<Presente> presentes);

}
