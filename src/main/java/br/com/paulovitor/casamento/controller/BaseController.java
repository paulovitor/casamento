package br.com.paulovitor.casamento.controller;

import java.util.ResourceBundle;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

public abstract class BaseController<T> {

	protected static String TIPO_MESSAGEM_SUCESSO = "success";

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

	protected void edita(Integer id) {
		T entity = recuperaEntity(id);
		if (entity == null) {
			result.notFound();
		} else {
			includeParametros(entity);

			result.of(this).formulario();
		}
	}

	protected abstract T recuperaEntity(Integer id);

	protected void salva(T entity) {
		String mensagem = getMensagem(entity);

		valida(entity);

		grava(entity, mensagem);
	}

	protected abstract String getMensagem(T entity);

	protected void valida(T entity) {
		validator.validate(entity);
		includeParametros(entity);
		validator.onErrorUsePageOf(this).formulario();
	}

	protected abstract void grava(T entity, String mensagem);

	public abstract void formulario();
	
	protected void includeParametrosDeSucesso(String mensagem) {
		result.include("mensagem", mensagem);
		result.include("tipo", TIPO_MESSAGEM_SUCESSO);
	}

	protected abstract void includeParametros(T entity);

}
