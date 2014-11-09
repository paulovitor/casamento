package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "familia")
public class Familia {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Length(min = 3, max = 30, message = "{erro.campo.tamanho}")
	private String nome;

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Email(message = "{erro.campo.invalido}")
	@Column(unique = true)
	@Length(min = 5, max = 30, message = "{erro.campo.tamanho}")
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
