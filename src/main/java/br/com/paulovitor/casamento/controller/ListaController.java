package br.com.paulovitor.casamento.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Presente;

@Controller
public class ListaController {

	public List<Presente> index() {
		List<Presente> presentes = new ArrayList<Presente>();
		presentes.add(criaPresente(1, "Açucareiro", null, false));
		presentes.add(criaPresente(2, "Jogo de Panela", null, false));
		presentes.add(criaPresente(3, "Vasilhas", createFamilia(1, "Freitas", "freitas@gmail.com"), true));
		return presentes;
	}

	private Presente criaPresente(int id, String nome, Familia familia,
			boolean ok) {
		Presente presente = new Presente();
		presente.setId(id);
		presente.setNome(nome);
		presente.setFamilia(familia);
		presente.setOk(ok);
		return presente;
	}
	
	private Familia createFamilia(int id, String nome, String email) {
		Familia familia = new Familia();
		familia.setId(id);
		familia.setNome(nome);
		familia.setEmail(email);
		return familia;
	}
}
