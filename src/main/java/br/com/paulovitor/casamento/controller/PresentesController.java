package br.com.paulovitor.casamento.controller;

import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.Restrito;
import br.com.paulovitor.casamento.model.TipoPresente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";

	private Checklist checklist;
	private Result result;
	private ResourceBundle bundle;
	private Validator validator;

	@Inject
	public PresentesController(Checklist checklist, Result result,
			ResourceBundle bundle, Validator validator) {
		this.checklist = checklist;
		this.result = result;
		this.bundle = bundle;
		this.validator = validator;
	}

	@Deprecated
	PresentesController() {
		this(null, null, null, null);
	}

	@Get("/presentes")
	public List<Presente> lista() {
		return checklist.lista(TipoPresente.CHA_DE_PANELA);
	}

	@Get("/presentes/listaComMensagem")
	public void listaComMensagem() {
		result.include("mensagem",
				bundle.getString("presentes.mensagem.escolhido.sucesso"));
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
		result.include("presenteList",
				checklist.lista(TipoPresente.CHA_DE_PANELA));
		result.of(this).lista();
	}

	@Restrito
	@Get("/presentes/adicionaTodos")
	public void adicionaTodos() {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adiciona(presentes.getPresentes());

		result.redirectTo(this).listaComMensagem();
	}

	@Restrito
	@Get("/presentes/formulario")
	public void formulario() {

	}

	@Restrito
	@Post("/presentes")
	public void adiciona(Presente presente) {
		validator.validate(presente);
		result.include("presente", presente);
		validator.onErrorUsePageOf(this).formulario();

		checklist.salva(presente);

		result.include("mensagem",
				bundle.getString("presentes.mensagem.adicionado.sucesso"));
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);

		result.of(this).formulario();
	}

}
