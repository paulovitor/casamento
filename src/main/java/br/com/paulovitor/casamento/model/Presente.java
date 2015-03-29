package br.com.paulovitor.casamento.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "presente")
public class Presente extends Entidade {

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Length(min = 3, max = 255, message = "{erro.campo.tamanho}")
	@Column(unique = true)
	private String nome;

	@Min(1)
	private int quantidade;

	@ManyToOne
	@JoinColumn(name = "familia_id", nullable = true)
	private Familia familia;

	@ManyToOne
	@JoinColumn(name = "pessoa_id", nullable = true)
	private Pessoa pessoa;

	private boolean ok = false;

	@NotNull(message = "{erro.campo.obrigatorio}")
	@Enumerated(EnumType.ORDINAL)
	private TipoPresente tipo;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Familia getFamilia() {
		return familia;
	}

	public void setFamilia(Familia familia) {
		this.familia = familia;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public TipoPresente getTipo() {
		return tipo;
	}

	public void setTipo(TipoPresente tipo) {
		this.tipo = tipo;
	}

}
