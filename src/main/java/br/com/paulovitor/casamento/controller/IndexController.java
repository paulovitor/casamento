package br.com.paulovitor.casamento.controller;

import javax.inject.Inject;

import org.apache.commons.mail.EmailException;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.paulovitor.casamento.model.Mensageiro;

@Controller
public class IndexController {

	private Result result;
	private Mensageiro mensageiro;

	@Inject
	public IndexController(Result result, Mensageiro mensageiro) {
		this.result = result;
		this.mensageiro = mensageiro;
	}

	@Deprecated
	IndexController() {
	}

	@Path("/")
	public void index() {

	}

	@Get("/localizacao/cha")
	public void localizacao() {

	}

	@Get("/email")
	public void enviaMensagem() throws EmailException {
		String mensagem = "Oi";
		String email = "user@gmail.com";
		mensageiro.enviaEmail(email, mensagem);
		result.of(this).index();
	}

}
