package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Presente;

public interface PresenteDAO {

	Presente get(Integer id);

	void salva(Presente presente);

	List<Presente> todos();

}
