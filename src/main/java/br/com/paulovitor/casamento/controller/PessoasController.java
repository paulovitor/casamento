package br.com.paulovitor.casamento.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.paulovitor.casamento.model.Pessoa;

@Controller
public class PessoasController {
	
	private Result result;

	@Inject
	public PessoasController(Result result) {
		this.result = result;
	}

	@Deprecated
	public PessoasController() {
		this(null);
	}

	@Get("/pessoas/{idFamilia}")
	public void lista(Integer idFamilia) {
		ArrayList<Pessoa> pessoas = new ArrayList<Pessoa>();
		Pessoa pessoa = new Pessoa();
		pessoa.setId(1);
		pessoa.setNome("Pessoa nome");
		pessoas.add(pessoa);
		result.include("pessoasList", pessoas);
	}

}
