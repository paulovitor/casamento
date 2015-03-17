package br.com.paulovitor.casamento.controller;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;

import java.util.Arrays;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;

public class FamiliasControllerTest extends BaseControllerTest {

	@Mock
	protected Parentesco parentesco;
	private FamiliasController controller;
	private Familia familia;

	@Before
	public void setUp() throws Exception {
		super.setUp();

		controller = new FamiliasController(parentesco, result, bundle,
				validator);

		familia = new Familia();
		familia.setNome("Paulo");
	}

	@After
	public void tearDown() throws Exception {
		controller = null;
		familia = null;
	}

	@Test
	public void deveBuscarFamiliasPorNome() throws Exception {
		when(parentesco.buscaFamilias(familia.getNome())).thenReturn(
				Arrays.asList(familia));

		controller.buscaPorNome(familia.getNome());

		assertNotNull(result.serializedResult());
	}

}
