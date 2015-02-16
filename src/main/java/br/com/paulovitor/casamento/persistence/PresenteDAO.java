package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

public interface PresenteDAO {

	public Presente get(Integer id);

	public void salva(Presente presente);

	public List<Presente> todos();

	public List<Presente> todosPorTipo(TipoPresente chaDePanela);

}
