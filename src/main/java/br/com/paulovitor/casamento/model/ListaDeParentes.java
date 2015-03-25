package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

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
	public List<Pessoa> buscaPessoas(Integer id) {
		Familia familia = getFamilia(id);
		return this.pessoaDAO.buscaPorFamilia(familia);
	}

	@Override
	public List<Pessoa> buscaPessoas(String nome) {
		return this.pessoaDAO.buscarPorNome(nome);
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
	public Long getQuantidadeDePessoasConfirmadas() {
		return this.pessoaDAO.getQuantidadeDePessoasConfirmadas();
	}

	@Override
	@Transactional
	public void excluiFamilia(Integer id) {
		Familia familia = this.familiaDAO.get(id);
		if (familia != null)
			this.familiaDAO.exclui(familia);
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
	@Transactional
	public void salva(Familia familia) {
		if (familia.getId() == null)
			this.familiaDAO.salva(familia);
		else
			this.familiaDAO.atualiza(familia);
	}

	@Override
	@Transactional
	public void salva(Pessoa pessoa) {
		if (pessoa.getId() == null)
			this.pessoaDAO.salva(pessoa);
		else
			this.pessoaDAO.atualiza(pessoa);
	}

}
