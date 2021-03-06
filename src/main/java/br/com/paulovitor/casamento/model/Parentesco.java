package br.com.paulovitor.casamento.model;

import java.util.List;

public interface Parentesco {

	public Familia buscaFamilia(String email);

	public List<Familia> buscaFamilias(String nome);

	public List<Pessoa> buscaPessoas(Integer id);

	public List<Pessoa> buscaPessoas(String nome);

	public Familia getFamilia(Integer id);

	public Pessoa getPessoa(Integer id);

	public Long getQuantidadeDePessoasConfirmadas();

	public void excluiFamilia(Integer id);

	public void excluiPessoa(Integer id);

	public List<Familia> listaTodasFamilias();

	public List<Pessoa> listaTodasPessoas();

	public void salva(Familia familia);

	public void salva(Pessoa pessoa);

}
