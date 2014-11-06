package br.com.paulovitor.casamento.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController {

	private static String TIPO_MESSAGEM_SUCESSO = "success";
	private static String TIPO_MESSAGEM_INFORMACAO = "info";
	private static String TIPO_MESSAGEM_ATENCAO = "warning";
	private static String TIPO_MESSAGEM_ERRO = "danger";

	private Checklist checklist;
	private Parentesco parentesco;

	@Inject
	public PresentesController(Checklist checklist, Parentesco parentesco) {
		this.checklist = checklist;
		this.parentesco = parentesco;
	}

	/**
	 * @deprecated Usado no CDI
	 */
	PresentesController() {
	}

	public List<Presente> index() {
		return checklist.lista();
	}

	public void adicionaTodos(Result result) {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adicionaTodos(presentes.getPresentes());

		result.redirectTo(this).index();
	}

	public void popover(int id, Result result) {
		result.include("id", id);
	}

	public void adicionaFamilia(String nome, String email, int idPresente,
			Result result) {
		Presente presente = checklist.get(idPresente);
		Familia familia = parentesco.buscaFamilia(email);
		presente.setFamilia(familia == null ? new Familia(nome, email)
				: familia);
		presente.setOk(true);
		checklist.salva(presente);

		result.include("mensagem", "Presente escolhido com sucesso!");
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
		result.include("presenteList", checklist.lista());
		result.of(this).index();
	}

}
