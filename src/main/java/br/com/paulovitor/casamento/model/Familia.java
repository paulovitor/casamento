package br.com.paulovitor.casamento.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Familia {

	@Id
	@GeneratedValue
	private Integer id;
//
//	@MapsId
//	@OneToOne
//	@JoinColumn(name = "id")
//	private Presente presente;
	private String nome;

	@Column(unique = true)
	private String email;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	public Presente getPresente() {
//		return presente;
//	}
//
//	public void setPresente(Presente presente) {
//		this.presente = presente;
//	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
