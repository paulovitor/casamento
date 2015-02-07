package br.com.paulovitor.casamento.model;

import java.util.List;

public interface Checklist {

	public void adiciona(List<Presente> presentes);

	public Presente get(Integer id);

	public List<Presente> lista(TipoPresente tipoPresente);

	public List<Presente> listaTodos();

	public void salva(Presente presente);

}
