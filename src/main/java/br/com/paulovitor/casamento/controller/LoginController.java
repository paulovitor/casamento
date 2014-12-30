package br.com.paulovitor.casamento.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.paulovitor.casamento.model.RegistroDeUsuarios;
import br.com.paulovitor.casamento.model.Usuario;
import br.com.paulovitor.casamento.model.UsuarioLogado;

@Controller
public class LoginController {

	private Result result;
	private Validator validator;
	private RegistroDeUsuarios usuarios;
	private UsuarioLogado logado;

	@Inject
	public LoginController(Result result, Validator validator,
			RegistroDeUsuarios usuarios, UsuarioLogado logado) {
		this.result = result;
		this.validator = validator;
		this.usuarios = usuarios;
		this.logado = logado;
	}

	@Deprecated
	LoginController() {
		this(null, null, null, null);
	}

	@Get("/login/formulario")
	public void formulario() {

	}

	@Post("/login")
	public void login(Usuario usuario) {
		Usuario usuarioDoBanco = valida(usuario);

		logado.loga(usuarioDoBanco);

		result.redirectTo(PresentesController.class).formulario();
	}

	private Usuario valida(Usuario usuario) {
		validator.ensure(usuario != null && usuario.getLogin() != null
				&& usuario.getSenha() != null, new I18nMessage("login",
				"login.ou.senha.invalidos"));

		Usuario usuarioDoBanco = null;
		if (!validator.hasErrors()) {
			usuarioDoBanco = usuarios.selecionaUsuarioPorLoginESenha(
					usuario.getLogin(), usuario.getSenha());

			validator.ensure(usuarioDoBanco != null, new I18nMessage("login",
					"login.ou.senha.invalidos"));
		}

		validator.onErrorRedirectTo(this).formulario();

		return usuarioDoBanco;
	}

	@Get("/logout")
	public void logout() {
		logado.desloga();
		result.redirectTo(this).formulario();
	}

}
