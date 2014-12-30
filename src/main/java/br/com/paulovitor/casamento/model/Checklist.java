package br.com.paulovitor.casamento.model;

import java.util.List;

public interface Checklist {

	public Presente get(Integer id);

	public void salva(Presente presente);

	public List<Presente> lista(TipoPresente tipoPresente);

	public void adiciona(List<Presente> presentes);

}
