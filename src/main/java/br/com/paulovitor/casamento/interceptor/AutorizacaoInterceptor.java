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

@Intercepts(after = AutenticacaoInterceptor.class)
public class AutorizacaoInterceptor {

	private UsuarioLogado usuario;
	private Result result;

	@Inject
	public AutorizacaoInterceptor(UsuarioLogado usuario, Result result) {
		this.usuario = usuario;
		this.result = result;
	}

	@Deprecated
	AutorizacaoInterceptor() {
		this(null, null);
	}

	@Accepts
	public boolean ehRestrito(ControllerMethod method) {
		return method.containsAnnotation(Restrito.class);
	}

	@AroundCall
	public void autoriza(SimpleInterceptorStack stack, ControllerMethod method) {
		if (podeAcessar(method))
			stack.next();
		else
			result.redirectTo(LoginController.class).formulario();
	}

	private boolean podeAcessar(ControllerMethod method) {
		return usuario.getUsuario().isAdmin();
	}

}
