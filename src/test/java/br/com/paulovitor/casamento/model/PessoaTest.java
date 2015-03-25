package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.dbunit.DatabaseUnitException;
import org.dbunit.dataset.DataSetException;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class PessoaTest extends SpringIntegrationTestCase {

	private static final Integer ID_PESSOA_COM_FAMILIA = 10;
	private static final Integer ID_PESSOA_SEM_FAMILIA = 20;
	private static final Integer ID_PESSOA_QUE_ESCOLHEU_PRESENTES = 30;
	private static final Integer ID_PESSOA_SEM_DEPENDENCIAS = 40;
	private static final Integer ID_PESSOA_INEXISTENTE = 50;

	@Autowired
	private Parentesco parentesco;

	@Before
	public void setUp() throws DataSetException, DatabaseUnitException,
			SQLException {
		cleanAndInsert("/META-INF/dbtest/familias.xml",
				"/META-INF/dbtest/pessoas.xml",
				"/META-INF/dbtest/presentes.xml");
	}

	@Test
	public void deveBuscarPessoasPorFamilia() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas(ID_PESSOA_COM_FAMILIA);

		// then
		assertEquals(1, pessoas.size());
	}

	@Test
	public void naoDeveEncontrarNenhumaPessoaNaBuscaPorFamilia() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas(3);

		// then
		assertEquals(0, pessoas.size());
	}

	@Test
	public void deveBuscarPessoasPorNome() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas("Pepeta");

		// then
		assertEquals(1, pessoas.size());
	}

	public void naoDeveEncontrarNenhumaPessoaNaBuscaPorNome() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas("Tom");

		// then
		assertEquals(0, pessoas.size());
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
	public void naoDeveRecuperarNenhumaPessoaConfirmada() {
		// give
		Pessoa pessoa = parentesco.getPessoa(ID_PESSOA_SEM_FAMILIA);
		pessoa.setConfirmado(false);
		parentesco.salva(pessoa);

		// when
		Long quantidadeDePessoasConfirmadas = parentesco
				.getQuantidadeDePessoasConfirmadas();

		// then
		assertEquals(new Long(0), quantidadeDePessoasConfirmadas);
	}

	@Test
	public void deveEditarPessoaComEmailNull() {
		// give
		Pessoa pessoa = parentesco.getPessoa(ID_PESSOA_COM_FAMILIA);
		pessoa.setEmail(null);

		// when
		parentesco.salva(pessoa);
	}

	@Test
	public void deveSalvarPessoaSemEmail() {
		// give
		String nome = "José";
		Pessoa pessoa = new Pessoa();
		pessoa.setNome(nome);

		// when
		parentesco.salva(pessoa);

		// then
		assertEquals(1, parentesco.buscaPessoas(nome).size());
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarPessoaSemPreencherCamposObrigatorios() {
		// give
		Pessoa pessoa = new Pessoa();

		// when
		parentesco.salva(pessoa);
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarPessoaComEmailInvalido() {
		// give
		Pessoa pessoa = new Pessoa();
		pessoa.setNome("nome");
		pessoa.setEmail("email");

		// when
		parentesco.salva(pessoa);
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveExcluirPessoaComFamilia() {
		// when
		parentesco.excluiPessoa(ID_PESSOA_COM_FAMILIA);
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveExcluirPessoaQueEscolheuPresentes() {
		// when
		parentesco.excluiPessoa(ID_PESSOA_QUE_ESCOLHEU_PRESENTES);
	}

	@Test
	public void naoDeveExcluirPessoaInexistente() {
		// when
		parentesco.excluiPessoa(ID_PESSOA_INEXISTENTE);

		// then
		assertEquals(4, parentesco.listaTodasPessoas().size());
	}

	@Test
	public void deveExcluirPessoa() {
		// when
		parentesco.excluiPessoa(ID_PESSOA_SEM_DEPENDENCIAS);

		// then
		assertEquals(3, parentesco.listaTodasPessoas().size());
	}

}
