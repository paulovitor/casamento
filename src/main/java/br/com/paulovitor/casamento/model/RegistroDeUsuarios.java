package br.com.paulovitor.casamento.model;

import java.util.Set;

public interface RegistroDeUsuarios {

	Set<String> listaPermissoesPorPerfil(String role);

	Set<String> listaPerfisPorLogin(String login);

	Usuario selecionaUsuarioPorLoginESenha(String login, String senha);

}
