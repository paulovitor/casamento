package br.com.paulovitor.casamento.controller;

import java.util.ResourceBundle;

import javax.validation.ConstraintViolationException;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

public abstract class BaseController<T> {

	private static final String TIPO_MESSAGEM_ERRO = "danger";
	private static final String TIPO_MESSAGEM_SUCESSO = "success";

	protected Result result;
	protected ResourceBundle bundle;
	protected Validator validator;

	public BaseController(Result result, ResourceBundle bundle,
			Validator validator) {
		this.result = result;
		this.bundle = bundle;
		this.validator = validator;
	}

	public BaseController() {
	}

	protected void editaEntity(Integer id) {
		T entity = recuperaEntity(id);
		if (entity == null) {
			result.notFound();
		} else {
			includeParametros(entity);

			result.of(this).formulario();
		}
	}
	
	protected void excluiEntity(Integer id, String mensagemDeSucesso, String mensagemDeErro) {
		try {
			excluiEntity(id);

			includeParametrosDeSucesso(bundle
					.getString(mensagemDeSucesso));
		} catch (ConstraintViolationException exception) {
			includeParametrosDeErro(bundle
					.getString(mensagemDeErro));
		}

		includeParametros(null);

		result.of(this).formulario();
	}

	protected abstract void excluiEntity(Integer id);

	protected abstract T recuperaEntity(Integer id);

	protected void salvaEntity(T entity) {
		String mensagem = getMensagem(entity);

		validaAntesDeGravar(entity);

		grava(entity, mensagem);
	}

	protected abstract String getMensagem(T entity);

	protected void validaAntesDeGravar(T entity) {
		validator.validate(entity);
		includeParametros(entity);
		validator.onErrorUsePageOf(this).formulario();
	}

	protected abstract void grava(T entity, String mensagem);

	public abstract void formulario();

	protected void includeParametrosDeErro(String mensagem) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_ERRO);
	}

	protected void includeParametrosDeSucesso(String mensagem) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
	}

	protected abstract void includeParametros(T entity);

}
