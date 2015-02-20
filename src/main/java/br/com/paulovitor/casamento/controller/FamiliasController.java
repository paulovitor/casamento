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
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.Restrito;
import br.com.paulovitor.casamento.model.TipoPresente;

@Controller
public class FamiliasController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";

	private Checklist checklist;
	private Parentesco parentesco;
	private Result result;
	private ResourceBundle bundle;
	private Validator validator;

	@Inject
	public FamiliasController(Checklist checklist, Parentesco parentesco,
			Result result, ResourceBundle bundle, Validator validator) {
		this.checklist = checklist;
		this.parentesco = parentesco;
		this.result = result;
		this.bundle = bundle;
		this.validator = validator;
	}

	@Deprecated
	FamiliasController() {
		this(null, null, null, null, null);
	}

	@Post("/familias/adiciona")
	public void adiciona(@NotNull Integer idPresente, Familia familia) {
		valida(familia);

		Presente presente = checklist.get(idPresente);
		adicionaFamilia(familia, presente);
		presente.setOk(true);
		checklist.salva(presente);

		result.redirectTo(PresentesController.class).listaComMensagem();
	}

	@Get("/familias/buscaPorNome/{nome}")
	public void buscaPorNome(String nome) {
		List<Familia> familias = parentesco.buscaFamilias(nome);
		result.use(Results.json()).from(familias).serialize();
	}

	@Restrito
	@Get
	@Path(value = "/familias/{id}", priority = Path.LOW)
	public void edita(Integer id) {
		Familia familia = parentesco.getFamilia(id);
		if (familia == null) {
			result.notFound();
		} else {
			includeParametros(familia);

			result.of(this).formulario();
		}
	}

	@Restrito
	@Get
	@Path(value = "/familias/formulario", priority = Path.HIGH)
	public void formulario() {
		includeParametros(null);
	}

	@Get
	@Path(value = "/familias/popUp", priority = Path.HIGH)
	public void popUp(Integer id) {
		result.include("id", id);
	}

	@Get
	@Path(value = "/familias/presenca", priority = Path.HIGH)
	public void presenca() {

	}

	@Restrito
	@Post("/familias")
	public void salva(Familia familia) {
		String mensagem = bundle
				.getString(familia.getId() == null ? "familias.mensagem.adicionado.sucesso"
						: "familias.mensagem.editado.sucesso");
		validator.validate(familia);
		includeParametros(familia);
		validator.onErrorUsePageOf(this).formulario();

		parentesco.salva(familia);

		includeParametros(null);
		includeParametrosDeSucesso(mensagem);

		result.of(this).formulario();
	}

	private void valida(Familia familia) {
		validator.validate(familia);
		result.include("presenteList", checklist.lista(TipoPresente.CASAMENTO));
		validator.onErrorUsePageOf(PresentesController.class).casamento();
	}

	private void adicionaFamilia(Familia familia, Presente presente) {
		Familia familiaExistente = parentesco.buscaFamilia(familia.getEmail());
		presente.setFamilia(familiaExistente == null ? familia
				: familiaExistente);
	}

	private void includeParametrosDeSucesso(String mensagem) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
	}

	private void includeParametros(Familia familia) {
		result.include("familiasList", parentesco.listaTodasFamilias());
		result.include("familia", familia);
	}

}
