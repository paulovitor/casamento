package br.com.paulovitor.casamento.controller;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.ResourceBundle;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import br.com.caelum.vraptor.util.test.MockResult;
import br.com.caelum.vraptor.util.test.MockValidator;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

public class PresentesControllerTest {

	@Mock
	private Checklist checklist;
	@Mock
	private Parentesco parentesco;
	private MockResult result;
	@Mock
	private ResourceBundle bundle;
	private MockValidator validator;
	private PresentesController controller;
	private Presente presente;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);

		result = new MockResult();
		validator = new MockValidator();
		controller = new PresentesController(checklist, parentesco, result,
				bundle, validator);

		presente = new Presente();
	}

	@After
	public void tearDown() {
		controller = null;
	}

	@Test
	public void testCasamento() {
		when(checklist.lista(TipoPresente.CASAMENTO)).thenReturn(
				Arrays.asList(presente));

		assertNotNull(controller.casamento());
	}

}
