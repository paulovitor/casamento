package br.com.paulovitor.casamento.controller;

import java.util.ResourceBundle;

import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import br.com.caelum.vraptor.util.test.MockSerializationResult;
import br.com.caelum.vraptor.util.test.MockValidator;

public abstract class BaseControllerTest {

	protected MockSerializationResult result;
	@Mock
	protected MockValidator validator;
	protected ResourceBundle bundle;

	protected void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);

		result = new MockSerializationResult();
		validator = new MockValidator();
		bundle = ResourceBundle.getBundle("messages");
	}

}
