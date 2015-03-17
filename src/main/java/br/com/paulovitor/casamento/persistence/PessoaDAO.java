package br.com.paulovitor.casamento.persistence;

import java.util.List;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Pessoa;

public interface PessoaDAO extends BaseDAO<Pessoa> {

	public List<Pessoa> buscaPorFamilia(Familia familia);

	public List<Pessoa> buscarPorNome(String nome);

	public Long getQuantidadeDePessoasConfirmadas();

}
