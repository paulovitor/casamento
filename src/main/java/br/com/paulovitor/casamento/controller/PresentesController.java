package br.com.paulovitor.casamento.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.paulovitor.casamento.model.ListaDePresentesChaDePanela;
import br.com.paulovitor.casamento.model.Presente;

@Controller
public class PresentesController {

	public List<Presente> index() {
		ListaDePresentesChaDePanela listaDePresentesChaDePanela = new ListaDePresentesChaDePanela();
		return listaDePresentesChaDePanela.lista();
	}

}
