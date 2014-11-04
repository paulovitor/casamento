package br.com.paulovitor.casamento.persistence;

import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class FactoryDAO {

	@PersistenceContext
	private EntityManager manager;

	@Produces
	public EntityManager getManager() {
		return manager;
	}

}
