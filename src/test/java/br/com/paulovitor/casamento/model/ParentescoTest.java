package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import com.github.springtestdbunit.DbUnitTestExecutionListener;
import com.github.springtestdbunit.annotation.DatabaseSetup;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:/application-test-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
		DbUnitTestExecutionListener.class })
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
	@DatabaseSetup("/META-INF/dbtest/pessoas.xml")
	public void deveAtualizarPessoaComEmailNull() {
		// give
		Pessoa pessoa = parentesco.getPessoa(1);
		pessoa.setEmail(null);

		// when
		parentesco.salva(pessoa);
	}

	@Test
	@DatabaseSetup("/META-INF/dbtest/pessoas.xml")
	public void deveBuscarPessoasPorNome() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas("Fred");

		// then
		assertEquals(1, pessoas.size());
	}

	@Test
	@DatabaseSetup("/META-INF/dbtest/pessoas.xml")
	public void deveRecuperarQuantidadeDePessoasConfirmadas() {
		// when
		Long quantidadeDePessoasConfirmadas = parentesco
				.getQuantidadeDePessoasConfirmadas();

		// then
		assertEquals(new Long(1), quantidadeDePessoasConfirmadas);
	}

}
