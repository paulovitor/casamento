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

public class FamiliaTest extends SpringIntegrationTestCase {

	private static final Integer ID_FAMILIA_COM_PESSOAS = 10;
	private static final Integer ID_FAMILIA_QUE_ESCOLHEU_PRESENTES = 20;
	private static final Integer ID_FAMILIA_SEM_DEPENDENCIAS = 30;
	private static final Integer ID_FAMILIA_INEXISTENTE = 50;

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
	public void deveBuscarFamiliasPorNome() {
		// when
		List<Familia> familias = parentesco.buscaFamilias("Rodrigues");

		// then
		assertEquals(1, familias.size());
	}

	@Test
	public void naoDeveEncontrarNenhumRegistroNaBuscaDeFamiliasPorNome() {
		// when
		List<Familia> familias = parentesco.buscaFamilias("Silva");

		// then
		assertEquals(0, familias.size());
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
		Familia familia = parentesco.getFamilia(ID_FAMILIA_COM_PESSOAS);

		// then
		assertNotNull(familia);
	}

	@Test
	public void deveBuscarTodasAsFamilias() {
		// when
		List<Familia> familias = parentesco.listaTodasFamilias();

		// then
		assertEquals(4, familias.size());
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
		assertEquals(5, parentesco.listaTodasFamilias().size());
	}

	@Test
	public void deveEditarFamilia() {
		// give
		Familia familia = parentesco.getFamilia(ID_FAMILIA_COM_PESSOAS);

		// when
		String novoNome = "novo nome";
		familia.setNome(novoNome);
		parentesco.salva(familia);

		// then
		assertEquals(novoNome, parentesco.getFamilia(ID_FAMILIA_COM_PESSOAS)
				.getNome());
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveExcluirFamiliaComPessoas() {
		// when
		parentesco.excluiFamilia(ID_FAMILIA_COM_PESSOAS);
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveExcluirFamiliaQueEscolheuPresentes() {
		// when
		parentesco.excluiFamilia(ID_FAMILIA_QUE_ESCOLHEU_PRESENTES);
	}

	@Test
	public void naoDeveExcluirFamiliaInexistente() {
		// when
		parentesco.excluiFamilia(ID_FAMILIA_INEXISTENTE);

		// then
		assertEquals(4, parentesco.listaTodasFamilias().size());
	}

	@Test
	public void deveExcluirFamilia() {
		// when
		parentesco.excluiFamilia(ID_FAMILIA_SEM_DEPENDENCIAS);

		// then
		assertEquals(3, parentesco.listaTodasFamilias().size());
	}

}
