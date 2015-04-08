package br.com.paulovitor.casamento.model;

import javax.inject.Inject;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.com.caelum.vraptor.simplemail.Mailer;

public class EncaminhadorDeEmails implements Mensageiro {

	private static final String TITULO_EMAIL = "Mensagem do casal (Paulo e Layanne)";

	private Mailer mailer;

	@Inject
	public EncaminhadorDeEmails(Mailer mailer) {
		this.mailer = mailer;
	}

	@Deprecated
	EncaminhadorDeEmails() {
		this(null);
	}

	@Override
	public void enviaEmail(String email, String mensagem) throws EmailException {
		Email simpleEmail = new SimpleEmail();
		simpleEmail.setSubject(TITULO_EMAIL);
		simpleEmail.addTo(email);
		simpleEmail.setMsg(mensagem);
		mailer.send(simpleEmail);
	}

}
