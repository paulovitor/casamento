package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:/application-test-context.xml" })
public class ParentescoTest {

	@Autowired
	private Parentesco parentesco;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void deveRecuperarQuantidadeDePessoasConfirmadas() {
		// give
		Pessoa pessoa = new Pessoa();
		pessoa.setNome("nome");
		pessoa.setEmail("nome@email.com");
		pessoa.setConfirmado(true);
		parentesco.salva(pessoa);

		// when
		Long quantidadeDePessoasConfirmadas = parentesco
				.getQuantidadeDePessoasConfirmadas();

		// then
		assertEquals(new Long(1), quantidadeDePessoasConfirmadas);
	}

}
