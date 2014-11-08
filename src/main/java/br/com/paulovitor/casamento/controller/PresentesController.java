package br.com.paulovitor.casamento.controller;

import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";

	private Checklist checklist;
	private Result result;
	private ResourceBundle bundle;

	@Inject
	public PresentesController(Checklist checklist, Result result,
			ResourceBundle bundle) {
		this.checklist = checklist;
		this.result = result;
		this.bundle = bundle;
	}

	@Deprecated
	PresentesController() {
		this(null, null, null);
	}

	@Get("/presentes")
	public List<Presente> lista() {
		return checklist.lista();
	}

	@Get("/presentes/listaComMensagem")
	public void listaComMensagem() {
		result.include("mensagem",
				bundle.getString("presentes.mensagem.sucesso"));
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
		result.include("presenteList", checklist.lista());
		
		result.of(this).lista();
	}

	@Get("/presentes/adicionaTodos")
	public void adicionaTodos() {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adicionaTodos(presentes.getPresentes());

		result.redirectTo(this).lista();
	}

}
