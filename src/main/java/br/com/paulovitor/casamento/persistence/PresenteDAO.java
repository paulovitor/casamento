package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Presente;

public interface PresenteDAO {

	List<Presente> todos();

	void adiciona(Presente presente);

}
