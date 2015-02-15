package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Familia;

public interface FamiliaDAO {

	Familia buscaPorEmail(String email);

	List<Familia> buscaPorNome(String nome);

}
