package br.com.paulovitor.casamento.model;

import org.apache.commons.mail.EmailException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

import br.com.caelum.vraptor.environment.Environment;
import br.com.caelum.vraptor.simplemail.Mailer;
import br.com.caelum.vraptor.simplemail.aws.MockMailer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:/application-test-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
		DirtiesContextTestExecutionListener.class })
public class MensageiroTest {

	private Mensageiro mensageiro;
	private Mailer mailer;

	@Autowired
	private Environment ambiente;

	@Before
	public void setUp() throws Exception {
		mailer = new MockMailer();
		mensageiro = new EncaminhadorDeEmails(mailer);
	}

	@Test
	public void deveEnviarEmail() throws EmailException {
		String mensagem = "Oi";
		String email = "user@gmail.com";
		mensageiro.enviaEmail(email, mensagem);
	}
}
