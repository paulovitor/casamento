package br.com.paulovitor.casamento.controller;

import java.util.ResourceBundle;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Pessoa;
import br.com.paulovitor.casamento.model.Restrito;

@Controller
public class PessoasController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";

	private Result result;
	private Parentesco parentesco;
	private ResourceBundle bundle;
	private Validator validator;

	@Inject
	public PessoasController(Parentesco parentesco, Result result,
			ResourceBundle bundle, Validator validator) {
		this.parentesco = parentesco;
		this.result = result;
		this.bundle = bundle;
		this.validator = validator;
	}

	@Deprecated
	public PessoasController() {
		this(null, null, null, null);
	}

	@Get("/pessoas/confirma/{id}")
	public void confirma(Integer id) {
		Pessoa pessoa = parentesco.getPessoa(id);
		pessoa.setConfirmado(true);
		parentesco.salva(pessoa);
		result.use(Results.json()).from(pessoa).serialize();
	}

	@Restrito
	@Get
	@Path(value = "/pessoas/{id}", priority = Path.LOW)
	public void edita(Integer id) {
		Pessoa pessoa = parentesco.getPessoa(id);
		if (pessoa == null) {
			result.notFound();
		} else {
			includeParametros(pessoa);

			result.of(this).formulario();
		}
	}

	@Restrito
	@Get
	@Path(value = "/pessoas/formulario", priority = Path.HIGH)
	public void formulario() {
		includeParametros(null);
	}

	@Get("/pessoas/lista/{idFamilia}")
	public void lista(Integer idFamilia) {
		result.include("pessoasList", parentesco.buscaPessoas(idFamilia));
	}

	@Restrito
	@Post("/pessoas")
	public void salva(Pessoa pessoa) {
		String mensagem = bundle
				.getString(pessoa.getId() == null ? "pessoas.mensagem.adicionado.sucesso"
						: "pessoas.mensagem.editado.sucesso");
		validator.validate(pessoa);
		includeParametros(pessoa);
		validator.onErrorUsePageOf(this).formulario();

		parentesco.salva(pessoa);

		includeParametros(null);
		includeParametrosDeSucesso(mensagem);

		result.of(this).formulario();
	}

	private void includeParametrosDeSucesso(String mensagem) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
	}

	private void includeParametros(Pessoa pessoa) {
		result.include("familiasList", parentesco.listaTodasFamilias());
		result.include("pessoasList", parentesco.listaTodasPessoas());
		result.include("pessoa", pessoa);
	}

}
