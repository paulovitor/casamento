package br.com.paulovitor.casamento.model;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.springtestdbunit.annotation.DatabaseSetup;

public class ParentescoTest extends BaseModelTest {

	@Autowired
	private Parentesco parentesco;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	// Pessoas

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

	// Famílias

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
	@DatabaseSetup("/META-INF/dbtest/familias.xml")
	public void deveEditarFamilia() {
		// give
		int id = 1;
		Familia familia = parentesco.getFamilia(id);

		// when
		String novoNome = "novo nome";
		familia.setNome(novoNome);
		parentesco.salva(familia);

		// then
		assertEquals(novoNome, parentesco.getFamilia(id).getNome());
	}

}
