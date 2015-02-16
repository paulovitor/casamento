package br.com.paulovitor.casamento.model;

import java.util.List;

public interface Parentesco {

	public Familia buscaFamilia(String email);

	public List<Familia> buscaFamilias(String nome);

	public List<Pessoa> buscaPessoas(Integer idFamilia);

	public Familia getFamilia(Integer id);

	public Pessoa getPessoa(Integer id);

	public List<Familia> listaTodasFamilias();

	public List<Pessoa> listaTodasPessoas();

	public void salva(Pessoa pessoa);

}
