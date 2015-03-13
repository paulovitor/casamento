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
		// give
		parentesco.salva(criaPessoa("nome", "nome@email.com", true));
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void deveRecuperarQuantidadeDePessoasConfirmadas() {
		// when
		Long quantidadeDePessoasConfirmadas = parentesco
				.getQuantidadeDePessoasConfirmadas();

		// then
		assertEquals(new Long(1), quantidadeDePessoasConfirmadas);
	}

	@Test
	public void deveAtualizarPessoaComEmailNull() {
		// give
		Pessoa pessoa = parentesco.getPessoa(1);
		pessoa.setEmail(null);
		
		// when
		parentesco.salva(pessoa);
	}

	private Pessoa criaPessoa(String nome, String email, boolean confirmado) {
		Pessoa pessoa = new Pessoa();
		pessoa.setNome(nome);
		pessoa.setEmail(email);
		pessoa.setConfirmado(confirmado);
		return pessoa;
	}

}
