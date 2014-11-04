package br.com.paulovitor.casamento.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Presente {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(unique = true)
	private String nome;
	private int quantidade;

//	@OneToOne
//	@PrimaryKeyJoinColumn
//	private Familia familia;
	private boolean ok;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

//	public Familia getFamilia() {
//		return familia;
//	}
//
//	public void setFamilia(Familia familia) {
//		this.familia = familia;
//	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

}
