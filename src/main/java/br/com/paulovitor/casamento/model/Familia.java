package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Familia {

	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty(message = "{familia.erro.nome.obrigatorio}")
	private String nome;

	@NotEmpty(message = "{familia.erro.email.obrigatorio}")
	@Email(message = "{familia.erro.email.invalido}")
	@Column(unique = true)
	private String email;

	@OneToMany(mappedBy = "familia")
	private List<Presente> presentes;

	public Familia(String nome, String email) {
		this.nome = nome;
		this.email = email;
	}

	public Familia() {
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Presente> getPresentes() {
		return presentes;
	}

	public void setPresentes(List<Presente> presentes) {
		this.presentes = presentes;
	}

}
