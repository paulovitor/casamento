package br.com.paulovitor.casamento.persistence;

import br.com.paulovitor.casamento.model.Familia;

public interface FamiliaDAO {

	Familia buscaPorEmail(String email);

}
