package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.dbunit.DatabaseUnitException;
import org.dbunit.dataset.DataSetException;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ParentescoTest extends SpringIntegrationTestCase {

	private static final Integer PESSOA_ID = 10;
	private static final Integer FAMILIA_ID = 10;

	@Autowired
	private Parentesco parentesco;

	@Before
	public void setUp() throws DataSetException, DatabaseUnitException,
			SQLException {
		clean("/META-INF/dbtest/familias.xml", "/META-INF/dbtest/pessoas.xml");
		insert("/META-INF/dbtest/familias.xml", "/META-INF/dbtest/pessoas.xml");
	}

	// Pessoas

	@Test
	public void deveBuscarPessoasPorFamilia() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas(PESSOA_ID);

		// then
		assertEquals(2, pessoas.size());
	}

	@Test
	public void deveBuscarPessoasPorNome() {
		// when
		List<Pessoa> pessoas = parentesco.buscaPessoas("Fred");

		// then
		assertEquals(1, pessoas.size());
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
	public void deveEditarPessoaComEmailNull() {
		// give
		Pessoa pessoa = parentesco.getPessoa(PESSOA_ID);
		pessoa.setEmail(null);

		// when
		parentesco.salva(pessoa);
	}

	// Famílias

	@Test
	public void deveBuscarFamiliasPorNome() {
		// when
		List<Familia> familias = parentesco.buscaFamilias("Rodrigues");

		// then
		assertEquals(1, familias.size());
	}

	@Test
	public void deveBuscarFamiliaPorEmail() {
		// when
		Familia familia = parentesco.buscaFamilia("oliveira@gmail.com");

		// then
		assertNotNull(familia);
	}

	@Test
	public void deveBuscarFamiliaPorId() {
		// when
		Familia familia = parentesco.getFamilia(FAMILIA_ID);

		// then
		assertNotNull(familia);
	}

	@Test
	public void deveBuscarTodasAsFamilias() {
		// when
		List<Familia> familias = parentesco.listaTodasFamilias();

		// then
		assertEquals(2, familias.size());
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarFamiliaSemPreencherCamposObrigatorios() {
		// give
		Familia familia = new Familia();

		// when
		parentesco.salva(familia);
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarFamiliaComEmailInvalido() {
		// give
		Familia familia = new Familia();
		familia.setNome("nome");
		familia.setEmail("email");

		// when
		parentesco.salva(familia);
	}

	@Test
	public void deveSalvarFamiliaSemDependencias() {
		// give
		Familia familia = new Familia();
		familia.setNome("nome");
		familia.setEmail("email@dominio.com.br");

		// when
		parentesco.salva(familia);

		// then
		assertEquals(3, parentesco.listaTodasFamilias().size());
	}

	@Test
	public void deveEditarFamilia() {
		// give
		Familia familia = parentesco.getFamilia(FAMILIA_ID);

		// when
		String novoNome = "novo nome";
		familia.setNome(novoNome);
		parentesco.salva(familia);

		// then
		assertEquals(novoNome, parentesco.getFamilia(FAMILIA_ID).getNome());
	}

}
