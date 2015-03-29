package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

public interface PresenteDAO extends BaseDAO<Presente> {

	public List<Presente> todosPorTipo(TipoPresente chaDePanela);

	public Long getQuantidadeDePresentesEscolhidos();

}
