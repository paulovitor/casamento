package br.com.paulovitor.casamento.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "pessoa")
public class Pessoa extends Entidade {

	@Valid
	@NotNull
	@ManyToOne(cascade = { CascadeType.DETACH })
	@JoinColumn(name = "familia_id", referencedColumnName = "id", nullable = true)
	private Familia familia;

	@NotEmpty(message = "{erro.campo.obrigatorio}")
	@Length(min = 3, max = 80, message = "{erro.campo.tamanho}")
	private String nome;

	@Email(message = "{erro.campo.invalido}")
	private String email;

	private boolean confirmado = false;

	@OneToMany(mappedBy = "pessoa")
	private List<Presente> presentes;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isConfirmado() {
		return confirmado;
	}

	public void setConfirmado(boolean confirmado) {
		this.confirmado = confirmado;
	}

	public List<Presente> getPresentes() {
		return presentes;
	}

	public void setPresentes(List<Presente> presentes) {
		this.presentes = presentes;
	}

}
