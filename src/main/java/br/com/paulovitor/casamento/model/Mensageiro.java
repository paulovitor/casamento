package br.com.paulovitor.casamento.model;

import org.apache.commons.mail.EmailException;

public interface Mensageiro {

	void enviaEmail(String email, String mensagem) throws EmailException;

}
