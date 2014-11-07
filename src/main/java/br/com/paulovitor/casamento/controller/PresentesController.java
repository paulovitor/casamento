package br.com.paulovitor.casamento.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";
//	private static String TIPO_MESSAGEM_INFORMACAO = "info";
//	private static String TIPO_MESSAGEM_ATENCAO = "warning";
//	private static String TIPO_MESSAGEM_ERRO = "danger";

	private Checklist checklist;
	private Parentesco parentesco;
	private Result result;
	private Validator validator;

	@Inject
	public PresentesController(Checklist checklist, Parentesco parentesco,
			Result result, Validator validator) {
		this.checklist = checklist;
		this.parentesco = parentesco;
		this.result = result;
		this.validator = validator;
	}

	/**
	 * @deprecated Usado no CDI
	 */
	PresentesController() {
	}

	public List<Presente> index() {
		return checklist.lista();
	}

	public void adicionaTodos() {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adicionaTodos(presentes.getPresentes());

		result.redirectTo(this).index();
	}

	public void popover(Integer id) {
		result.include("id", id);
	}

	public void adicionaFamilia(@NotNull Integer idPresente, Familia familia) {
		validator.validate(familia);
		validator.onErrorRedirectTo(this).index();
		
		Presente presente = checklist.get(idPresente);
		Familia familiaExistente = parentesco.buscaFamilia(familia.getEmail());
		presente.setFamilia(familiaExistente == null ? familia
				: familiaExistente);
		presente.setOk(true);
		checklist.salva(presente);

		result.include("mensagem", "Presente escolhido com sucesso!");
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
		result.include("presenteList", checklist.lista());
		result.of(this).index();
	}

}
