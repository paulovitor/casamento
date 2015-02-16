package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Familia;

public interface FamiliaDAO {

	public Familia buscaPorEmail(String email);

	public List<Familia> buscaPorNome(String nome);

	public Familia get(Integer id);

	public List<Familia> todas();

}
