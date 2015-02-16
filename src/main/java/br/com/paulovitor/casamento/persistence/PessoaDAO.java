package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Pessoa;

public interface PessoaDAO {

	public List<Pessoa> buscaPorFamilia(Familia familia);

	public Pessoa get(Integer id);

	public void salva(Pessoa pessoa);

	public List<Pessoa> todas();

}
