package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "familia")
public class Familia extends Entidade {

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Length(min = 3, max = 80, message = "{erro.campo.tamanho}")
	private String nome;

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Email(message = "{erro.campo.invalido}")
	@Length(min = 5, max = 80, message = "{erro.campo.tamanho}")
	private String email;

	@OneToMany(mappedBy = "familia")
	private List<Presente> presentes;

	@OneToMany(mappedBy = "familia")
	private List<Pessoa> pessoas;

	public Familia(String nome, String email) {
		this.nome = nome;
		this.email = email;
	}

	public Familia() {
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

	public List<Pessoa> getPessoas() {
		return pessoas;
	}

	public void setPessoas(List<Pessoa> pessoas) {
		this.pessoas = pessoas;
	}

}
