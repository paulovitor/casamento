-- phpMyAdmin SQL Dump
-- version 4.0.10.5
-- http://www.phpmyadmin.net
--
-- Máquina: 127.7.228.130:3306
-- Data de Criação: 24-Nov-2014 às 00:50
-- Versão do servidor: 5.5.40
-- versão do PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `casamento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `familia`
--

CREATE TABLE IF NOT EXISTS `familia` (
  `id` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t2vka1ktnbats8sf4hl3mlwx4` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `familia`
--

INSERT INTO `familia` (`id`, `email`, `nome`) VALUES
(66, 'resinhasds@gmail.com', 'Caio e Renata'),
(67, 'chiko2003@ig.com.br', 'Francisco e Cassia'),
(68, 'laycrys6@gmail.com', 'Vó Rosa Mariza'),
(69, 'fabiana7440@hotmail.com', 'Elimar e Família'),
(70, 'jocelia_freitas@hotmail.com', 'Joelino e Família'),
(71, 'dani8freitas@gmail.com', 'Dani Ferreira'),
(72, 'jussarafreitadesouza@hotmail.com', 'Jussara e Família'),
(73, 'mayarachrisostomo@hotmail.com', 'Nilcéia e Família'),
(74, 'nayara.ncsouza@gmail.com', 'Nayara e Rodrigo'),
(75, 'rosirochameirerosa@gmail.com', 'Ir. Beatriz PMRM'),
(76, 'fbf63530@opayq.com', 'Ludmilla'),
(77, 'ludy.freitas@gmail.com', 'Ademilton e Família'),
(78, 'tanialuz_@hotmail.com', 'Gilberto e Família'),
(79, 'bsb1081510@terra.com.br', 'Paulinho/Viviane e Família'),
(80, 'loi_lorena@hotmail.com', 'Marcia e Família'),
(81, 's.sandrafreitas@gmail.com', 'Sandra e Paulo'),
(82, 'juelicesousa@gmail.com', 'Juelice e Otacilia'),
(83, 'fatimagomes29@hotmail.com', 'Benjamin e Família'),
(84, 'josinasv1990@hotmail.com', 'Josina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(85);

-- --------------------------------------------------------

--
-- Estrutura da tabela `presente`
--

CREATE TABLE IF NOT EXISTS `presente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `ok` bit(1) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `familia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2pdcfvsma8y2ewpsj5kskehaf` (`nome`),
  KEY `FK_b70h70risswhwop5q306vq2jf` (`familia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `presente`
--

INSERT INTO `presente` (`id`, `nome`, `ok`, `quantidade`, `tipo`, `familia_id`) VALUES
(1, 'AÇUCAREIRO', b'0', 1, 0, NULL),
(2, 'APARELHO DE JANTAR', b'1', 1, 0, 79),
(3, 'BANDEJA INOX', b'0', 1, 0, NULL),
(5, 'BATEDEIRA DE BOLO', b'0', 1, 0, NULL),
(6, 'BATEDOR DE ALHO DE FERRO', b'0', 1, 0, NULL),
(7, 'BOLEIRA', b'1', 1, 0, 70),
(8, 'CONCHA INOX', b'0', 1, 0, NULL),
(9, 'COLHER DE TIRAR ARROZ INOX', b'0', 1, 0, NULL),
(10, 'CONJUNTO DE MANTIMENTOS', b'0', 1, 0, NULL),
(11, 'CUSCUZEIRA', b'1', 1, 0, 72),
(12, 'CENTRIFUGA', b'1', 1, 0, 77),
(13, 'DESCANSO PARA PANELA INOX', b'0', 1, 0, NULL),
(14, 'ESCOMADEIRA', b'0', 1, 0, NULL),
(15, 'ESCORREDOR DE PRATOS INOX', b'0', 1, 0, NULL),
(16, 'ESCORREDOR DE MACARRÃO INOX', b'1', 1, 0, 74),
(17, 'ESCORREDOR DE ARROZ INOX', b'0', 1, 0, NULL),
(18, 'ESPREMEDOR DE BATATA', b'0', 1, 0, NULL),
(19, 'ESPREMEDOR DE LARANJA ELÉTRICO', b'0', 1, 0, NULL),
(20, 'FAQUEIRO VERDE', b'0', 1, 0, NULL),
(21, 'FRIGIDEIRA', b'0', 1, 0, NULL),
(22, 'FERRO DE PASSAR ROUPA A VAPOR', b'0', 1, 0, NULL),
(23, 'FACA DE COZINHA', b'0', 1, 0, NULL),
(24, 'FARINHEIRO', b'0', 1, 0, NULL),
(25, 'FRUTEIRA IN0X', b'0', 1, 0, NULL),
(26, 'FORMA DE BOLO REDONDA', b'1', 1, 0, 75),
(27, 'FORMA DE BOLO QUADRADA', b'1', 1, 0, 80),
(28, 'GARRAFA TÉRMICA', b'1', 1, 0, 69),
(29, 'GARRAFA DE ÁGUA DE VIDRO', b'1', 2, 0, 73),
(30, 'JOGO DE PANELA INOX', b'0', 1, 0, NULL),
(31, 'JOGO DE COPOS', b'1', 1, 0, 67),
(32, 'JOGO DE TAÇAS', b'1', 1, 0, 68),
(33, 'JARRA DE SUCO COM COPOS DE VIDRO', b'1', 1, 0, 84),
(35, 'JOGO DE XÍCARA DE CHÁ', b'1', 1, 0, 81),
(36, 'JOGO DE XÍCARA DE CAFÉ', b'1', 1, 0, 66),
(37, 'JOGO DE SOBREMESA', b'0', 1, 0, NULL),
(38, 'JOGO DE FACA PRA CHUARRASCO', b'0', 1, 0, NULL),
(39, 'JOGO DE TEMPERO', b'0', 1, 0, NULL),
(40, 'JOGO DE COLHER DE PAU', b'0', 1, 0, NULL),
(41, 'JOGO DE VIDRO (saleiro, paliteiro, vinagre e azeite)', b'0', 1, 0, NULL),
(42, 'JOGO DE BACIAS, BUCHA E BALDE', b'1', 1, 0, 71),
(43, 'JOGO DE PANELA DE ALUMÍNIO', b'0', 1, 0, NULL),
(44, 'LEITEIRA', b'0', 1, 0, NULL),
(45, 'LIXEIRA DE COZINHEIRA', b'0', 1, 0, NULL),
(46, 'LIXEIRA DE BANHEIRO', b'0', 1, 0, NULL),
(47, 'LIQUIDIFICADOR', b'0', 1, 0, NULL),
(48, 'MARINEX PARA LASANHA COM SUPORTE', b'1', 1, 0, 82),
(49, 'MARINEX', b'0', 2, 0, NULL),
(50, 'MICROONDAS', b'1', 1, 0, 83),
(51, 'PANELA DE PRESSÃO', b'0', 1, 0, NULL),
(52, 'PORTA SABÃO LÍQUIDO E SABÃO DE BARRA', b'0', 1, 0, NULL),
(53, 'PRATOS DE VIDRO', b'1', 6, 0, 82),
(54, 'PORTA COADOR', b'0', 1, 0, NULL),
(55, 'PIPOQUEIRA', b'0', 1, 0, NULL),
(56, 'PORTA ROLO DE PAPEL TOALHA', b'0', 1, 0, NULL),
(57, 'PANELA ELÉTRICA DE ARROZ', b'0', 1, 0, NULL),
(58, 'RALADOR INOX', b'1', 1, 0, 76),
(59, 'SALEIRA', b'0', 1, 0, NULL),
(60, 'SANDUICHEIRA', b'1', 1, 0, 78),
(61, 'TÁBUA DE PASSAR ROUPA', b'0', 1, 0, NULL),
(62, 'TÁBUA DE CARNE', b'0', 1, 0, NULL),
(63, 'VASILHA DE PLÁSTICO GRANDE', b'0', 1, 0, NULL),
(64, 'VENTILADOR', b'0', 1, 0, NULL),
(65, 'QUEJEIRA', b'0', 1, 0, NULL);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `presente`
--
ALTER TABLE `presente`
  ADD CONSTRAINT `FK_b70h70risswhwop5q306vq2jf` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
