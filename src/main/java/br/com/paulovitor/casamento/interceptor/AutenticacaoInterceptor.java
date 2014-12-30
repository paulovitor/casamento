package br.com.paulovitor.casamento.interceptor;

import javax.inject.Inject;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.com.paulovitor.casamento.controller.LoginController;
import br.com.paulovitor.casamento.model.Restrito;
import br.com.paulovitor.casamento.model.UsuarioLogado;

@Intercepts
public class AutenticacaoInterceptor {

	private UsuarioLogado usuario;
	private Result result;

	@Inject
	public AutenticacaoInterceptor(UsuarioLogado usuario, Result result) {
		this.usuario = usuario;
		this.result = result;
	}

	@Deprecated
	AutenticacaoInterceptor() {
		this(null, null);
	}

	@Accepts
	public boolean ehRestrito(ControllerMethod method) {
		return method.containsAnnotation(Restrito.class);
	}

	@AroundCall
	public void autentica(SimpleInterceptorStack stack) {
		if (usuario.isLogado())
			stack.next();
		else
			result.redirectTo(LoginController.class).formulario();
	}
}
