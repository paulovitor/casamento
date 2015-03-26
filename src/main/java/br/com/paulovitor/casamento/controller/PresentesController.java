package br.com.paulovitor.casamento.controller;

import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.paulovitor.casamento.model.Checklist;
import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Parentesco;
import br.com.paulovitor.casamento.model.Pessoa;
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

	@Post
	@Path(value = "/presentes/adicionaFamilia", priority = Path.HIGH)
	public void adicionaFamilia(@NotNull Integer idPresente, Familia familia) {
		valida(familia);

		Presente presente = checklist.get(idPresente);
		adiciona(familia, presente);
		presente.setOk(true);
		checklist.salva(presente);

		listaComMensagem();
	}

	@Post
	@Path(value = "/presentes/adicionaPessoa", priority = Path.HIGH)
	public void adicionaPessoa(@NotNull Integer idPresente, Pessoa pessoa) {
		valida(pessoa);

		Presente presente = checklist.get(idPresente);
		adiciona(pessoa, presente);
		presente.setOk(true);
		checklist.salva(presente);

		listaComMensagem();
	}

	@Restrito
	@Get
	@Path(value = "/presentes/adicionaTodos", priority = Path.HIGH)
	public void adicionaTodos() {
		ListaDePresentesInicial presentes = new ListaDePresentesInicial();
		checklist.adiciona(presentes.getPresentes());

		listaComMensagem();
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
		editaEntity(id);
	}

	@Restrito
	@Get
	@Path(value = "/presentes/exclui/{id}", priority = Path.HIGH)
	public void exclui(Integer id) {
		excluiEntity(id, "presentes.mensagem.excluido.sucesso",
				"presentes.mensagem.excluido.erro");
	}

	@Override
	protected void excluiEntity(Integer id) {
		checklist.exclui(id);
	}

	@Restrito
	@Post
	@Path(value = "/presentes", priority = Path.LOW)
	public void salva(Presente presente) {
		salvaEntity(presente);
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
	protected void validaAntesDeGravar(Presente presente) {
		if (presente.getFamilia().getId() == null) {
			presente.setFamilia(null);
			presente.setPessoa(parentesco.getPessoa(presente.getPessoa()
					.getId()));
		} else if (presente.getPessoa().getId() == null) {
			presente.setPessoa(null);
			presente.setFamilia(parentesco.getFamilia(presente.getFamilia()
					.getId()));
		}

		super.validaAntesDeGravar(presente);
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

	private void listaComMensagem() {
		includeParametrosDeSucesso(bundle
				.getString("presentes.mensagem.escolhido.sucesso"));
		result.include("presenteList", checklist.lista(TipoPresente.CASAMENTO));
		result.of(this).casamento();
	}

	private void valida(Object entidade) {
		validator.validate(entidade);
		result.include("presenteList", checklist.lista(TipoPresente.CASAMENTO));
		validator.onErrorUsePageOf(this).casamento();
	}

	private void adiciona(Familia familia, Presente presente) {
		Familia familiaExistente = parentesco.buscaFamilia(familia.getEmail());
		presente.setFamilia(familiaExistente == null ? familia
				: familiaExistente);
	}

	private void adiciona(Pessoa pessoa, Presente presente) {
		Pessoa pessoaExistente = parentesco.getPessoa(pessoa.getId());
		presente.setPessoa(pessoaExistente == null ? pessoa : pessoaExistente);
	}

}
