package br.com.paulovitor.casamento.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

@Controller
public class FamiliasController {

	private Checklist checklist;
	private Parentesco parentesco;
	private Result result;
	private Validator validator;

	@Inject
	public FamiliasController(Checklist checklist, Parentesco parentesco,
			Result result, Validator validator) {
		this.checklist = checklist;
		this.parentesco = parentesco;
		this.result = result;
		this.validator = validator;
	}

	@Deprecated
	FamiliasController() {
		this(null, null, null, null);
	}

	@Post("/familias")
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

	@Get("/familias/formulario")
	public void formulario(Integer id) {
		result.include("id", id);
	}

	@Get("/familias/presenca")
	public void presenca() {

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

}
