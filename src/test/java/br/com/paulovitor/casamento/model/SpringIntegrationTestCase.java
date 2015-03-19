package br.com.paulovitor.casamento.model;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.dbunit.DatabaseUnitException;
import org.dbunit.database.DatabaseDataSourceConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ReplacementDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.dbunit.operation.DatabaseOperation;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:/application-test-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
		DirtiesContextTestExecutionListener.class,
		TransactionalTestExecutionListener.class })
public abstract class SpringIntegrationTestCase {

	@Autowired
	private DataSource dataSource;

	protected SpringIntegrationTestCase cleanAndInsert(String... xmls)
			throws DatabaseUnitException, SQLException, DataSetException {
		return clean(xmls).insert(xmls);
	}

	protected SpringIntegrationTestCase clean(String... xmls)
			throws DatabaseUnitException, SQLException, DataSetException {
		for (int i = xmls.length - 1; i >= 0; i--) {
			execute(DatabaseOperation.DELETE_ALL, xmls[i]);
		}
		return this;
	}

	protected SpringIntegrationTestCase insert(String... xmls)
			throws DataSetException, DatabaseUnitException, SQLException {
		for (int i = 0; i < xmls.length; i++) {
			execute(DatabaseOperation.INSERT, xmls[i]);
		}
		return this;
	}

	private void execute(DatabaseOperation operation, String xml)
			throws DatabaseUnitException, SQLException, DataSetException {
		operation.execute(getConnection(), createDataSet(xml));
	}

	private ReplacementDataSet createDataSet(String xml)
			throws DataSetException {
		IDataSet dataSet = new FlatXmlDataSetBuilder().build(getClass()
				.getResourceAsStream(xml));
		ReplacementDataSet replacement = new ReplacementDataSet(dataSet);
		replacement.addReplacementObject("null", null);
		return replacement;
	}

	private IDatabaseConnection getConnection() throws SQLException {
		return new DatabaseDataSourceConnection(dataSource);
	}

}
