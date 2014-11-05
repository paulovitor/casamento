package br.com.paulovitor.casamento.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController {

	private Checklist<Presente> checklist;

	@Inject
	public PresentesController(Checklist<Presente> checklist) {
		this.checklist = checklist;
	}

	/**
	 * @deprecated Usado no CDI
	 */
	PresentesController() {
		this(null);
	}

	public List<Presente> index() {
		return checklist.lista();
	}

	public void adicionaTodos(Result result) {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adicionaTodos(presentes.getPresentes());
		
		result.redirectTo(this).index();
	}

}
