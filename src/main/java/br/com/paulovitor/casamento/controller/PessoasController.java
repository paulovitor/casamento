package br.com.paulovitor.casamento.controller;

import java.util.List;
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
public class PessoasController extends BaseController<Pessoa> {

	private Parentesco parentesco;

	@Inject
	public PessoasController(Parentesco parentesco, Result result,
			ResourceBundle bundle, Validator validator) {
		super(result, bundle, validator);
		this.parentesco = parentesco;
	}

	@Deprecated
	public PessoasController() {
		this(null, null, null, null);
	}

	@Get("/pessoas/buscaPorNome/{nome}")
	public void buscaPorNome(String nome) {
		List<Pessoa> pessoas = parentesco.buscaPessoas(nome);
		result.use(Results.json()).from(pessoas).serialize();
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
		editaEntity(id);
	}

	@Restrito
	@Get
	@Path(value = "/pessoas/formulario", priority = Path.HIGH)
	@Override
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
		salvaEntity(pessoa);
	}

	@Override
	protected Pessoa recuperaEntity(Integer id) {
		return parentesco.getPessoa(id);
	}

	@Override
	protected String getMensagem(Pessoa pessoa) {
		return bundle
				.getString(pessoa.getId() == null ? "pessoas.mensagem.adicionado.sucesso"
						: "pessoas.mensagem.editado.sucesso");
	}

	@Override
	protected void grava(Pessoa pessoa, String mensagem) {
		parentesco.salva(pessoa);

		includeParametros(null);
		includeParametrosDeSucesso(mensagem);

		result.of(this).formulario();
	}

	@Override
	protected void includeParametros(Pessoa entity) {
		result.include("familiasList", parentesco.listaTodasFamilias());
		result.include("pessoasList", parentesco.listaTodasPessoas());
		result.include("pessoa", entity);
		result.include("quantidadeDePessoasConfirmadas",
				parentesco.getQuantidadeDePessoasConfirmadas());
	}

}
