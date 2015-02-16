package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.inject.Inject;

import br.com.paulovitor.casamento.persistence.FamiliaDAO;
import br.com.paulovitor.casamento.persistence.PessoaDAO;

public class ListaDeParentes implements Parentesco {

	private FamiliaDAO familiaDAO;
	private PessoaDAO pessoaDAO;

	@Inject
	public ListaDeParentes(FamiliaDAO familiaDAO, PessoaDAO pessoaDAO) {
		this.familiaDAO = familiaDAO;
		this.pessoaDAO = pessoaDAO;
	}

	@Deprecated
	ListaDeParentes() {
		this(null, null);
	}

	@Override
	public Familia buscaFamilia(String email) {
		return this.familiaDAO.buscaPorEmail(email);
	}

	@Override
	public List<Familia> buscaFamilias(String nome) {
		return this.familiaDAO.buscaPorNome(nome);
	}

	@Override
	public List<Pessoa> buscaPessoas(Integer idFamilia) {
		Familia familia = getFamilia(idFamilia);
		return this.pessoaDAO.buscaPorFamilia(familia);
	}

	@Override
	public Familia getFamilia(Integer id) {
		return this.familiaDAO.get(id);
	}

	@Override
	public Pessoa getPessoa(Integer id) {
		return this.pessoaDAO.get(id);
	}

	@Override
	public List<Familia> listaTodasFamilias() {
		return this.familiaDAO.todos();
	}

	@Override
	public List<Pessoa> listaTodasPessoas() {
		return this.pessoaDAO.todos();
	}

	@Override
	public void salva(Pessoa pessoa) {
		pessoaDAO.salva(pessoa);
	}

}
