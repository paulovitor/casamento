package br.com.paulovitor.casamento.controller;

import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Pessoa;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.Restrito;
import br.com.paulovitor.casamento.model.TipoPresente;

@Controller
public class PessoasController extends BaseController<Pessoa> {

	private Checklist checklist;
	private Parentesco parentesco;

	@Inject
	public PessoasController(Checklist checklist, Parentesco parentesco,
			Result result, ResourceBundle bundle, Validator validator) {
		super(result, bundle, validator);
		this.checklist = checklist;
		this.parentesco = parentesco;
	}

	@Deprecated
	public PessoasController() {
		this(null, null, null, null, null);
	}

	@Post("/pessoas/adiciona")
	public void adiciona(@NotNull Integer idPresente, Pessoa pessoa) {
		validator.validate(pessoa);
		result.include("presenteList", checklist.lista(TipoPresente.CASAMENTO));
		validator.onErrorUsePageOf(PresentesController.class).casamento();

		Presente presente = checklist.get(idPresente);
		adicionaPessoa(pessoa, presente);
		presente.setOk(true);
		checklist.salva(presente);

		result.redirectTo(PresentesController.class).listaComMensagem();
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
		edita(id);
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
		salva(pessoa);
	}

	private void adicionaPessoa(Pessoa pessoa, Presente presente) {
		Pessoa pessoaExistente = parentesco.getPessoa(pessoa.getId());
		presente.setPessoa(pessoaExistente == null ? pessoa : pessoaExistente);
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
