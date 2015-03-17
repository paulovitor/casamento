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
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.Restrito;
import br.com.paulovitor.casamento.model.TipoPresente;
import br.com.paulovitor.casamento.persistence.ListaDePresentesInicial;

@Controller
public class PresentesController extends BaseController<Presente> {

	private Checklist checklist;
	private Parentesco parentesco;

	@Inject
	public PresentesController(Checklist checklist, Parentesco parentesco,
			Result result, ResourceBundle bundle, Validator validator) {
		super(result, bundle, validator);
		this.checklist = checklist;
		this.parentesco = parentesco;
	}

	@Deprecated
	PresentesController() {
		this(null, null, null, null, null);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/adicionaTodos", priority = Path.HIGH)
	public void adicionaTodos() {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adiciona(presentes.getPresentes());

		result.redirectTo(this).listaComMensagem();
	}

	@Get("/presentes")
	public List<Presente> casamento() {
		return checklist.lista(TipoPresente.CASAMENTO);
	}

	@Get
	@Path(value = "/presentes/cha", priority = Path.HIGH)
	public List<Presente> cha() {
		return checklist.lista(TipoPresente.CHA_DE_PANELA);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/formulario", priority = Path.HIGH)
	@Override
	public void formulario() {
		includeParametros(null);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/{id}", priority = Path.LOW)
	public void edita(Integer id) {
		edita(id);
	}

	@Get("/presentes/listaComMensagem")
	public void listaComMensagem() {
		includeParametrosDeSucesso(
				bundle.getString("presentes.mensagem.escolhido.sucesso"),
				checklist.lista(TipoPresente.CASAMENTO));

		result.of(this).casamento();
	}

	@Restrito
	@Post("/presentes")
	public void salva(Presente presente) {
		salva(presente);
	}

	@Override
	protected Presente recuperaEntity(Integer id) {
		return checklist.get(id);
	}

	@Override
	protected String getMensagem(Presente presente) {
		return bundle
				.getString(presente.getId() == null ? "presentes.mensagem.adicionado.sucesso"
						: "presentes.mensagem.editado.sucesso");
	}

	@Override
	protected void valida(Presente presente) {
		if (presente.getFamilia().getId() == null) {
			presente.setFamilia(null);
			presente.setPessoa(parentesco.getPessoa(presente.getPessoa()
					.getId()));
		}
		if (presente.getPessoa().getId() == null) {
			presente.setPessoa(null);
			presente.setFamilia(parentesco.getFamilia(presente.getFamilia()
					.getId()));
		}

		valida(presente);
	}

	@Override
	protected void grava(Presente presente, String mensagem) {
		checklist.salva(presente);

		includeParametros(null);
		includeParametrosDeSucesso(mensagem);

		result.of(this).formulario();
	}

	@Override
	protected void includeParametros(Presente presente) {
		result.include("familiasList", parentesco.listaTodasFamilias());
		result.include("pessoasList", parentesco.listaTodasPessoas());
		result.include("presenteList", checklist.listaTodos());
		result.include("presente", presente);
	}

	private void includeParametrosDeSucesso(String mensagem,
			List<Presente> presentes) {
		includeParametrosDeSucesso(mensagem);
		result.include("presenteList", presentes);
	}

}
