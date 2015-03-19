package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.dbunit.DatabaseUnitException;
import org.dbunit.dataset.DataSetException;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ChecklistTest extends SpringIntegrationTestCase {

	@Autowired
	private Checklist checklist;

	@Before
	public void setUp() throws DataSetException, DatabaseUnitException,
			SQLException {
		cleanAndInsert("/META-INF/dbtest/presentes.xml");
	}

	@Test
	public void deveBuscarPresentesDoTipoCasamento() {
		// when
		List<Presente> presentes = checklist.lista(TipoPresente.CASAMENTO);

		// then
		assertEquals(1, presentes.size());
	}

	@Test(expected = ConstraintViolationException.class)
	public void naoDeveSalvarUmPresenteSemTipo() {
		// when
		checklist.salva(criaPresente("CHURRASQUEIRA", 1, null));
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
		assertEquals(4, checklist.listaTodos().size());
	}

	private Presente criaPresente(String nome, int quantidade, TipoPresente tipo) {
		Presente presente = new Presente();
		presente.setNome(nome);
		presente.setQuantidade(quantidade);
		presente.setTipo(tipo);
		return presente;
	}

}
