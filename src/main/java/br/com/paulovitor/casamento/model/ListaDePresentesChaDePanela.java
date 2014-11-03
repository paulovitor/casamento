package br.com.paulovitor.casamento.model;

import java.util.ArrayList;
import java.util.List;

public class ListaDePresentesChaDePanela implements Checklist<Presente> {

	private List<Presente> presentes = new ArrayList<Presente>();

	public ListaDePresentesChaDePanela() {
		String[] nomes = createArrayDeNomes();
		int index = 1;
		for (String nome : nomes) {
			// TODO: Temporário
			if (index == 1)
				presentes
						.add(criaPresente(
								index,
								nome,
								1,
								createFamilia(1, "Freitas", "freitas@gmail.com"),
								true));
			else
				presentes.add(criaPresente(index, nome, 1, null, false));
			index++;
		}
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
				"GARRAFA DE AGUA DE VIDRO ( QTDD 2)", "JOGO DE PANELA INOX",
				"JOGO DE COPOS", "JOGO DE TACAS",
				"JARRA DE SUCO COM COPOS DE VIDRO", "JOGO DE XICARA",
				"JOGO DE XICARA DE CHÁ", "JOGO DE XICARA DE CAFÉ",
				"JOGO DE SOBREMESA", "JOGO DE FACA PRA CHUARRASCO",
				"JOGO DE TEMPEIRO", "JOGO DE COLHER DE PAU",
				"JOGO DE VIDRO (saleiro, paliteiro, vinagre e azeite)",
				"JOGO DE BACIAS , BUCHA E BALDE", "JOGO DE PANELA DE ALUMINIO",
				"LEITEIRA", "LIXEIRA DE COZINHEIRA", "LIXEIRA DE BANHEIRO",
				"LIQUIDIFICADOR", "MARINEX PARA LASANHA COM SUPORTE",
				"MARINEX (QTDD 2)", "MICROONDAS", "PANELA DE PRESSAO",
				"PORTA SABAO LIQUIDO,SABAO DE BARRA",
				"PRATOS DE VIDRO (Qtdd 6)", "PORTA COADOR", "PIPOQUEIRA",
				"PORTA ROLO DE PAPEL TOALHA", "PANELA ELETRICA DE ARROZ",
				"RALADOR", "SALEIRA", "SANDUICHEIRA", "TABUA DE PASSAR ROUPA",
				"TALBA DE CARNE DE VIDRO", "VASILHA DE PLASTICO GRANDE",
				"VENTILADOR", "QUEJEIRA" };
	}

	private Presente criaPresente(int id, String nome, int quantidade,
			Familia familia, boolean ok) {
		Presente presente = new Presente();
		presente.setId(id);
		presente.setNome(nome);
		presente.setQuantidade(quantidade);
		presente.setFamilia(familia);
		presente.setOk(ok);
		return presente;
	}

	private Familia createFamilia(int id, String nome, String email) {
		Familia familia = new Familia();
		familia.setId(id);
		familia.setNome(nome);
		familia.setEmail(email);
		return familia;
	}

	@Override
	public List<Presente> lista() {
		return presentes;
	}

}
