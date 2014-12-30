package br.com.paulovitor.casamento.model;

import java.util.Set;

public class RegistroDeUsuariosNaMemoria implements RegistroDeUsuarios {

	private Usuario usuario;

	public RegistroDeUsuariosNaMemoria() {
		usuario = new Usuario();
		usuario.setLogin("root");
		usuario.setSenha("pauloelay");
		usuario.setAdmin(true);
	}

	@Override
	public Set<String> listaPermissoesPorPerfil(String role) {
		return null;
	}

	@Override
	public Set<String> listaPerfisPorLogin(String login) {
		return null;
	}

	@Override
	public Usuario selecionaUsuarioPorLoginESenha(String login, String senha) {
		return login.equals(usuario.getLogin())
				&& senha.equals(usuario.getSenha()) ? usuario : null;
	}

}
