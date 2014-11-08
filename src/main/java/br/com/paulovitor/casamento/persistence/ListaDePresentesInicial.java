package br.com.paulovitor.casamento.persistence;

import java.util.ArrayList;
import java.util.List;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Presente;

public class ListaDePresentesInicial {

	private List<Presente> presentes = null;

	public List<Presente> getPresentes() {
		if (presentes == null) {
			presentes = new ArrayList<Presente>();
			adicionaPresentes();
		}
		return presentes;
	}

	private void adicionaPresentes() {
		String[] nomes = createArrayDeNomes();
		int index = 1;
		for (String nome : nomes) {
			presentes.add(criaPresente(nome, getQuantidade(nome), index == 1 ? new Familia(
					"Oliveira", "oliveira@gmail.com") : null, index == 1));
			index++;
		}
	}

	private int getQuantidade(String nome) {
		if (nome.equals("GARRAFA DE AGUA DE VIDRO") || nome.equals("MARINEX"))
			return 2;
		if (nome.equals("PRATOS DE VIDRO"))
			return 6;
		return 1;
	}

	private String[] createArrayDeNomes() {
		return new String[] { "AÇUCAREIRO", "APARELHO DE JANTAR",
				"BANDEJA INOX", "BALDE", "BATEDEIRA DE BOLO",
				"BATEDOR DE ALHO DE FERRO", "BOLEIRA", "CONCHA INOX",
				"COLHER DE TIRAR ARROZ INOX", "CONJUNTO DE MANTIMENTOS",
				"CUZCUZEIRA", "CENTRIFUGA", "DESCANSO PARA PANELA INOX",
				"ESCOMADEIRA", "ESCORREDOR DE PRATOS INOX",
				"ESCORREDOR DE MACARRAO", "ESCORREDOR DE ARROZ INOX",
				"ESPREMEDOR DE BATATA", "ESPREMEDOR DE LARANJA ELETRICO",
				"FAQUEIRO VERDE", "FRIGIDEIRA",
				"FERRO DE PASSAR ROUPA A VAPOR", "FACA DE COZINHA",
				"FARINHEIRO", "FRUTEIRA IN0X", "FORMA DE BOLO REDONDA",
				"FORMA DE BOLO QUADRADA", "GARRAFA TERMICA",
				"GARRAFA DE AGUA DE VIDRO", "JOGO DE PANELA INOX",
				"JOGO DE COPOS", "JOGO DE TACAS",
				"JARRA DE SUCO COM COPOS DE VIDRO", "JOGO DE XICARA",
				"JOGO DE XICARA DE CHÁ", "JOGO DE XICARA DE CAFÉ",
				"JOGO DE SOBREMESA", "JOGO DE FACA PRA CHUARRASCO",
				"JOGO DE TEMPEIRO", "JOGO DE COLHER DE PAU",
				"JOGO DE VIDRO (saleiro, paliteiro, vinagre e azeite)",
				"JOGO DE BACIAS , BUCHA E BALDE", "JOGO DE PANELA DE ALUMINIO",
				"LEITEIRA", "LIXEIRA DE COZINHEIRA", "LIXEIRA DE BANHEIRO",
				"LIQUIDIFICADOR", "MARINEX PARA LASANHA COM SUPORTE",
				"MARINEX", "MICROONDAS", "PANELA DE PRESSAO",
				"PORTA SABAO LIQUIDO,SABAO DE BARRA",
				"PRATOS DE VIDRO", "PORTA COADOR", "PIPOQUEIRA",
				"PORTA ROLO DE PAPEL TOALHA", "PANELA ELETRICA DE ARROZ",
				"RALADOR", "SALEIRA", "SANDUICHEIRA", "TABUA DE PASSAR ROUPA",
				"TALBA DE CARNE DE VIDRO", "VASILHA DE PLASTICO GRANDE",
				"VENTILADOR", "QUEJEIRA" };
	}

	private Presente criaPresente(String nome, int quantidade, Familia familia,
			boolean ok) {
		Presente presente = new Presente();
		presente.setNome(nome);
		presente.setQuantidade(quantidade);
		presente.setFamilia(familia);
		presente.setOk(ok);
		return presente;
	}

}
