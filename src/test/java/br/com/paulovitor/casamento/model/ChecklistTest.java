package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ChecklistTest extends SpringIntegrationTestCase {

	@Autowired
	private Checklist checklist;

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarUmPresenteSemTipo() {
		checklist.salva(criaPresente("CHURRASQUEIRA", 1, null));
	}

	@Test
	public void deveAdicionarVariosPresentes() {
		List<Presente> presentes = Arrays.asList(
				criaPresente("CHURRASQUEIRA", 1, TipoPresente.CASAMENTO),
				criaPresente("PANELA", 1, TipoPresente.CASAMENTO));

		checklist.adiciona(presentes);

		assertEquals(2, checklist.listaTodos().size());
	}

	private Presente criaPresente(String nome, int quantidade, TipoPresente tipo) {
		Presente presente = new Presente();
		presente.setNome(nome);
		presente.setQuantidade(quantidade);
		presente.setTipo(tipo);
		return presente;
	}

}
