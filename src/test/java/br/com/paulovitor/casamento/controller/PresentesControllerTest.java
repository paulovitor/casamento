package br.com.paulovitor.casamento.controller;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;

import java.util.Arrays;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;

import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Pessoa;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

public class PresentesControllerTest extends BaseControllerTest {

	@Mock
	protected Checklist checklist;
	@Mock
	protected Parentesco parentesco;
	private PresentesController controller;
	private Presente presente;

	@Before
	public void setUp() throws Exception {
		super.setUp();

		controller = new PresentesController(checklist, parentesco, result,
				bundle, validator);

		presente = new Presente();
		presente.setId(1);
	}

	@After
	public void tearDown() {
		controller = null;
		presente = null;
	}

	@Test
	public void deveCarregarListaDePresentesParaTelaDeCasamento() {
		when(checklist.lista(TipoPresente.CASAMENTO)).thenReturn(
				Arrays.asList(presente));

		assertNotNull(controller.casamento());
	}

	@Test
	public void deveSalvarPresenteEscolhidoPorUmaPessoa() {
		Pessoa pessoa = new Pessoa();
		pessoa.setId(1);
		presente.setPessoa(pessoa);
		Familia familia = new Familia();
		presente.setFamilia(familia);
		presente.setId(1);

		when(parentesco.getPessoa(pessoa.getId())).thenReturn(pessoa);
		Mockito.doNothing().when(checklist).salva(presente);

		controller.salva(presente);
	}

	@Test
	public void deveAdicionarPresenteAUmaPessoa() throws Exception {
		Pessoa pessoa = new Pessoa();
		pessoa.setId(1);
		pessoa.setNome("Paulo");

		when(checklist.get(presente.getId())).thenReturn(presente);
		when(parentesco.getPessoa(pessoa.getId())).thenReturn(pessoa);
		Mockito.doNothing().when(checklist).salva(presente);

		controller.adicionaPessoa(presente.getId(), pessoa);
	}

	@Test
	public void deveAdicionarPresenteAUmaFamilia() {
		Familia familia = new Familia();
		familia.setId(1);
		familia.setNome("Oliveira");

		when(checklist.get(presente.getId())).thenReturn(presente);
		when(parentesco.getFamilia(familia.getId())).thenReturn(familia);
		Mockito.doNothing().when(checklist).salva(presente);

		controller.adicionaFamilia(presente.getId(), familia);
	}

}
