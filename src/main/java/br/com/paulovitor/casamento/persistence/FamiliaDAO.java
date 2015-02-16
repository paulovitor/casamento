package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Familia;

public interface FamiliaDAO extends BaseDAO<Familia> {

	public Familia buscaPorEmail(String email);

	public List<Familia> buscaPorNome(String nome);

}
