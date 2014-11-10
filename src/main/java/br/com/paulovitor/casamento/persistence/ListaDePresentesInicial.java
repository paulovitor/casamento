package br.com.paulovitor.casamento.persistence;

import java.util.ArrayList;
import java.util.List;

import br.com.paulovitor.casamento.model.Familia;
import br.com.paulovitor.casamento.model.Presente;
import br.com.paulovitor.casamento.model.TipoPresente;

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
		for (String nome : nomes) {
			presentes.add(criaPresente(nome, getQuantidade(nome), null));
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
				"CUSCUZEIRA", "CENTRIFUGA", "DESCANSO PARA PANELA INOX",
				"ESCOMADEIRA", "ESCORREDOR DE PRATOS INOX",
				"ESCORREDOR DE MACARRÃO", "ESCORREDOR DE ARROZ INOX",
				"ESPREMEDOR DE BATATA", "ESPREMEDOR DE LARANJA ELÉTRICO",
				"FAQUEIRO VERDE", "FRIGIDEIRA",
				"FERRO DE PASSAR ROUPA A VAPOR", "FACA DE COZINHA",
				"FARINHEIRO", "FRUTEIRA IN0X", "FORMA DE BOLO REDONDA",
				"FORMA DE BOLO QUADRADA", "GARRAFA TÉRMICA",
				"GARRAFA DE ÁGUA DE VIDRO", "JOGO DE PANELA INOX",
				"JOGO DE COPOS", "JOGO DE FACAS",
				"JARRA DE SUCO COM COPOS DE VIDRO", "JOGO DE XÍCARA",
				"JOGO DE XÍCARA DE CHÁ", "JOGO DE XÍCARA DE CAFÉ",
				"JOGO DE SOBREMESA", "JOGO DE FACA PRA CHUARRASCO",
				"JOGO DE TEMPERO", "JOGO DE COLHER DE PAU",
				"JOGO DE VIDRO (saleiro, paliteiro, vinagre e azeite)",
				"JOGO DE BACIAS , BUCHA E BALDE", "JOGO DE PANELA DE ALUMÍNIO",
				"LEITEIRA", "LIXEIRA DE COZINHEIRA", "LIXEIRA DE BANHEIRO",
				"LIQUIDIFICADOR", "MARINEX PARA LASANHA COM SUPORTE",
				"MARINEX", "MICROONDAS", "PANELA DE PRESSÃO",
				"PORTA SABÃO LÍQUIDO E SABÃO DE BARRA", "PRATOS DE VIDRO",
				"PORTA COADOR", "PIPOQUEIRA", "PORTA ROLO DE PAPEL TOALHA",
				"PANELA ELÉTRICA DE ARROZ", "RALADOR", "SALEIRA",
				"SANDUICHEIRA", "TÁBUA DE PASSAR ROUPA",
				"TÁBUA DE CARNE", "VASILHA DE PLÁSTICO GRANDE",
				"VENTILADOR", "QUEJEIRA" };
	}

	private Presente criaPresente(String nome, int quantidade, Familia familia) {
		Presente presente = new Presente();
		presente.setNome(nome);
		presente.setQuantidade(quantidade);
		presente.setFamilia(familia);
		presente.setTipo(TipoPresente.CHA_DE_PANELA);
		return presente;
	}

}
