package br.com.paulovitor.casamento.controller;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.ResourceBundle;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import br.com.caelum.vraptor.util.test.MockSerializationResult;
import br.com.caelum.vraptor.util.test.MockValidator;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Pessoa;
import br.com.paulovitor.casamento.model.Presente;

public class PessoasControllerTest {

	@Mock
	private Checklist checklist;
	@Mock
	private Parentesco parentesco;
	private MockSerializationResult result;
	@Mock
	private ResourceBundle bundle;
	private MockValidator validator;
	private PessoasController controller;
	private Pessoa pessoa;

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);

		result = new MockSerializationResult();
		validator = new MockValidator();

		controller = new PessoasController(checklist, parentesco, result,
				bundle, validator);

		pessoa = new Pessoa();
		pessoa.setNome("Paulo");
	}

	@After
	public void tearDown() throws Exception {
		controller = null;
		pessoa = null;
	}

	@Test
	public void deveBuscarPessoasPorNome() throws Exception {
		when(parentesco.buscaPessoas(pessoa.getNome())).thenReturn(
				Arrays.asList(pessoa));

		controller.buscaPorNome(pessoa.getNome());

		assertNotNull(result.serializedResult());
	}

	@Test
	public void deveAdicionarPresenteAUmaPessoa() throws Exception {
		Presente presente = new Presente();
		presente.setId(1);
		when(checklist.get(1)).thenReturn(presente);
		when(parentesco.getPessoa(pessoa.getId())).thenReturn(pessoa);
		Mockito.doNothing().when(checklist).salva(presente);

		controller.adiciona(presente.getId(), pessoa);
	}

}
