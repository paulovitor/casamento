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
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.Restrito;
import br.com.paulovitor.casamento.model.TipoPresente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";

	private Checklist checklist;
	private Parentesco parentesco;
	private Result result;
	private ResourceBundle bundle;
	private Validator validator;

	@Inject
	public PresentesController(Checklist checklist, Parentesco parentesco,
			Result result, ResourceBundle bundle, Validator validator) {
		this.checklist = checklist;
		this.parentesco = parentesco;
		this.result = result;
		this.bundle = bundle;
		this.validator = validator;
	}

	@Deprecated
	PresentesController() {
		this(null, null, null, null, null);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/adicionaTodos", priority = Path.HIGH)
	public void adicionaTodos() {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adiciona(presentes.getPresentes());

		result.redirectTo(this).listaComMensagem();
	}

	@Get("/presentes")
	public List<Presente> casamento() {
		return checklist.lista(TipoPresente.CASAMENTO);
	}

	@Get
	@Path(value = "/presentes/cha", priority = Path.HIGH)
	public List<Presente> cha() {
		return checklist.lista(TipoPresente.CHA_DE_PANELA);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/formulario", priority = Path.HIGH)
	public void formulario() {
		includeParametros(null);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/{id}", priority = Path.LOW)
	public void edita(Integer id) {
		Presente presente = checklist.get(id);
		if (presente == null) {
			result.notFound();
		} else {
			includeParametros(presente);

			result.of(this).formulario();
		}
	}

	@Get("/presentes/listaComMensagem")
	public void listaComMensagem() {
		includeParametrosDeSucesso(
				bundle.getString("presentes.mensagem.escolhido.sucesso"),
				checklist.lista(TipoPresente.CASAMENTO));

		result.of(this).casamento();
	}

	@Restrito
	@Post("/presentes")
	public void salva(Presente presente) {
		String mensagem = bundle
				.getString(presente.getId() == null ? "presentes.mensagem.adicionado.sucesso"
						: "presentes.mensagem.editado.sucesso");
		if (presente.getFamilia().getId() == null)
			presente.setFamilia(null);
		if (presente.getPessoa().getId() == null)
			presente.setPessoa(null);
		validator.validate(presente);
		includeParametros(presente);
		validator.onErrorUsePageOf(this).formulario();

		checklist.salva(presente);

		includeParametros(null);
		includeParametrosDeSucesso(mensagem);

		result.of(this).formulario();
	}

	private void includeParametrosDeSucesso(String mensagem) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
	}

	private void includeParametrosDeSucesso(String mensagem,
			List<Presente> presentes) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
		result.include("presenteList", presentes);
	}

	private void includeParametros(Presente presente) {
		result.include("familiasList", parentesco.listaTodasFamilias());
		result.include("pessoasList", parentesco.listaTodasPessoas());
		result.include("presenteList", checklist.listaTodos());
		result.include("presente", presente);
	}

}
