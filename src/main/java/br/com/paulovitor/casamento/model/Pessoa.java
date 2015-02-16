package br.com.paulovitor.casamento.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "pessoa")
public class Pessoa {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ManyToOne(cascade = { CascadeType.DETACH })
	@JoinColumn(name = "familia_id", nullable = true)
	private Familia familia;

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Length(min = 3, max = 80, message = "{erro.campo.tamanho}")
	private String nome;
	private boolean confirmado = false;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Familia getFamilia() {
		return familia;
	}

	public void setFamilia(Familia familia) {
		this.familia = familia;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public boolean isConfirmado() {
		return confirmado;
	}

	public void setConfirmado(boolean confirmado) {
		this.confirmado = confirmado;
	}

}
