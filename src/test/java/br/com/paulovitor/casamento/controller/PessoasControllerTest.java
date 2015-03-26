package br.com.paulovitor.casamento.controller;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.when;

import java.util.Arrays;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;

import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Pessoa;

public class PessoasControllerTest extends BaseControllerTest {

	@Mock
	protected Parentesco parentesco;
	private PessoasController controller;
	private Pessoa pessoa;

	@Before
	public void setUp() throws Exception {
		super.setUp();

		controller = new PessoasController(parentesco, result, bundle,
				validator);

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
	public void deveExcluirPessoa() {
		Mockito.doNothing().when(parentesco).excluiPessoa(pessoa.getId());

		controller.exclui(pessoa.getId());
	}

}
