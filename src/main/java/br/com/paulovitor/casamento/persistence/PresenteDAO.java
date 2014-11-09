package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

public interface PresenteDAO {

	Presente get(Integer id);

	void salva(Presente presente);

	List<Presente> todos();

	List<Presente> todosPorTipo(TipoPresente chaDePanela);

}
