package br.com.paulovitor.casamento.controller;

import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Restrito;

@Controller
public class FamiliasController extends BaseController<Familia> {

	private Parentesco parentesco;

	@Inject
	public FamiliasController(Parentesco parentesco, Result result,
			ResourceBundle bundle, Validator validator) {
		super(result, bundle, validator);
		this.parentesco = parentesco;
	}

	@Deprecated
	FamiliasController() {
		this(null, null, null, null);
	}

	@Get("/familias/buscaPorNome/{nome}")
	public void buscaPorNome(String nome) {
		List<Familia> familias = parentesco.buscaFamilias(nome);
		result.use(Results.json()).from(familias).serialize();
	}

	@Restrito
	@Get
	@Path(value = "/familias/{id}", priority = Path.LOW)
	public void edita(Integer id) {
		editaEntity(id);
	}

	@Restrito
	@Get
	@Path(value = "/familias/exclui/{id}", priority = Path.HIGH)
	public void exclui(Integer id) {
		excluiEntity(id, "familias.mensagem.excluido.sucesso",
				"familias.mensagem.excluido.erro");
	}

	@Override
	protected void excluiEntity(Integer id) {
		parentesco.excluiFamilia(id);
	}

	@Restrito
	@Get
	@Path(value = "/familias/formulario", priority = Path.HIGH)
	@Override
	public void formulario() {
		includeParametros(null);
	}

	@Get
	@Path(value = "/familias/popUp", priority = Path.HIGH)
	public void popUp(Integer id) {
		result.include("id", id);
	}

	@Get
	@Path(value = "/familias/presenca", priority = Path.HIGH)
	public void presenca() {

	}

	@Restrito
	@Post("/familias")
	public void salva(Familia familia) {
		salvaEntity(familia);
	}

	@Override
	protected Familia recuperaEntity(Integer id) {
		return parentesco.getFamilia(id);
	}

	@Override
	protected String getMensagem(Familia familia) {
		return bundle
				.getString(familia.getId() == null ? "familias.mensagem.adicionado.sucesso"
						: "familias.mensagem.editado.sucesso");
	}

	@Override
	protected void grava(Familia familia, String mensagem) {
		parentesco.salva(familia);

		includeParametros(null);
		includeParametrosDeSucesso(mensagem);

		result.of(this).formulario();
	}

	@Override
	protected void includeParametros(Familia familia) {
		result.include("familiasList", parentesco.listaTodasFamilias());
		result.include("familia", familia);
	}

}
