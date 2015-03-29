package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.validation.ConstraintViolationException;

import org.dbunit.DatabaseUnitException;
import org.dbunit.dataset.DataSetException;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ChecklistTest extends SpringIntegrationTestCase {

	private static final Integer ID_PRESENTE_COM_FAMILIA = 10;
	private static final Integer ID_PRESENTE_SEM_DEPENDENCIAS = 30;
	private static final Integer ID_PRESENTE_INEXISTENTE = 50;

	@Autowired
	private Checklist checklist;

	@Before
	public void setUp() throws DataSetException, DatabaseUnitException,
			SQLException {
		cleanAndInsert("/META-INF/dbtest/familias.xml",
				"/META-INF/dbtest/pessoas.xml",
				"/META-INF/dbtest/presentes.xml");
	}

	@Test
	public void deveAdicionarVariosPresentes() {
		// give
		List<Presente> presentes = Arrays.asList(
				criaPresente("CHURRASQUEIRA", 1, TipoPresente.CASAMENTO),
				criaPresente("PANELA", 1, TipoPresente.CASAMENTO));

		// when
		checklist.adiciona(presentes);

		// then
		assertEquals(5, checklist.listaTodos().size());
	}

	@Test
	public void deveBuscarPresentesDoTipoCasamento() {
		// when
		List<Presente> presentes = checklist.lista(TipoPresente.CASAMENTO);

		// then
		assertEquals(1, presentes.size());
	}

	@Test
	public void deveBuscarQuantidadeDePresentesEscolhidos() {
		// then
		Long quantidadeDePresentesEscolhidos = checklist
				.getQuantidadeDePresentesEscolhidos();

		// when
		assertEquals(new Long(1), quantidadeDePresentesEscolhidos);
	}

	@Test
	public void naoDeveBuscarNenhumPresenteEscolhido() {
		// give
		Presente presente = checklist.get(ID_PRESENTE_COM_FAMILIA);
		presente.setOk(false);
		checklist.salva(presente);

		// then
		Long quantidadeDePresentesEscolhidos = checklist
				.getQuantidadeDePresentesEscolhidos();

		// when
		assertEquals(new Long(0), quantidadeDePresentesEscolhidos);
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarUmPresenteSemTipo() {
		// when
		checklist.salva(criaPresente("CHURRASQUEIRA", 1, null));
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarUmPresenteSemNome() {
		// when
		checklist.salva(criaPresente(null, 1, TipoPresente.CASAMENTO));
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarUmPresenteComQuantidadeMenorQueValorMinimo() {
		// when
		checklist.salva(criaPresente("TV", 0, TipoPresente.CASAMENTO));
	}

	@Test
	public void deveSalvarPresente() {
		// give
		Presente presente = criaPresente("CAMA", 1, TipoPresente.CASAMENTO);

		// when
		checklist.salva(presente);

		// then
		assertEquals(4, checklist.listaTodos().size());
	}

	@Test(expected = EntityNotFoundException.class)
	public void naoDeveExcluirPresenteInexistente() {
		// when
		checklist.exclui(ID_PRESENTE_INEXISTENTE);

		// then
		assertEquals(3, checklist.listaTodos().size());
	}

	@Test
	public void deveExcluirPresente() {
		// when
		checklist.exclui(ID_PRESENTE_SEM_DEPENDENCIAS);

		// then
		assertEquals(2, checklist.listaTodos().size());
	}

	private Presente criaPresente(String nome, int quantidade, TipoPresente tipo) {
		Presente presente = new Presente();
		presente.setNome(nome);
		presente.setQuantidade(quantidade);
		presente.setTipo(tipo);
		return presente;
	}

}
