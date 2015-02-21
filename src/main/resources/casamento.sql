-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Máquina: 127.7.228.130:3306
-- Data de Criação: 20-Fev-2015 às 10:36
-- Versão do servidor: 5.5.41
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
(83, 'fatimagomes29@hotmail.com;lucasofg@gmail.com', 'Benjamin e Família'),
(84, 'josinasv1990@hotmail.com', 'Josina'),
(85, 'greyci.l@hotmail.com', 'Pedro e Grayci'),
(86, 'graziellemoriza.gm@gmail.com', 'Grazi e Luis'),
(87, 'dinahelpsouza@hotmail.com', 'Wilha e Dina'),
(88, 'masan_2006@hotmail.com', 'Edvaldo e Família'),
(89, 'izabelivete9@gmail.com', 'Izabel e Família'),
(90, 'ivone.gs08@hotmail.com', 'Eyler e Ivone'),
(91, 'eylerlombre@gmail.com', 'Wlson e Catia'),
(92, 'mmmartaos@gmail.com', 'Antonio Carlos e Família '),
(93, 'lorenaosilva@gmail.com', 'Lorena e Família'),
(94, 'milk.leo@gmail.com', 'Edil e Família'),
(95, 'jocelmafsouza@hotmail.com', 'Tia Jocelma'),
(96, 'marcosjoliv@hotmail.com', 'Marcos e Família'),
(97, 'victorwilliam47@gmail.com', 'Victor'),
(98, 'brunoo.silva@gmail.com', 'Flávia e Bruno'),
(99, 'dalvaosilva@gmail.com', 'Maria Dalva'),
(100, 'daltair.freitas@gmail.com', 'Daltair e Sheila'),
(101, 'eljunior14@gmail.com', 'Ti Junin e Tia Selma'),
(102, 'daltono@brturbo.com.br', 'Daltono & Rosângela'),
(103, 'glauciaalbanez@gmail.com', 'Gláucia'),
(104, 'nubiafonoaudiologia@yahoo.com.br', 'Gulherme & Núbia'),
(105, 'mucioalbanez@gmail.com', 'Mucio'),
(106, 'fabioalbanez@gmail.com', 'Fábio & Maria Clara'),
(108, 'wbertis_sazon@hotmail.com', 'Wbertis e Carol'),
(110, 'celio@snews.tv', 'Celio e Família');

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
(128);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL,
  `confirmado` bit(1) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `familia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t4fs81y7kli721xai9cx4ro6i` (`familia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `confirmado`, `nome`, `familia_id`) VALUES
(111, b'0', 'Ademilton', 77),
(112, b'0', 'Jocema', 77),
(113, b'0', 'Maurício', 77),
(114, b'0', 'Daniel', 77),
(115, b'0', 'Ludmila', 77),
(116, b'0', 'Antônio Carlos', 92),
(117, b'0', 'Marta', 92),
(118, b'0', 'Marina', 92),
(119, b'0', 'Mateus', 92),
(120, b'0', 'Benjamin', 83),
(121, b'0', 'Fatima', 83),
(122, b'0', 'Paula', 83),
(123, b'0', 'Lucas', 83),
(124, b'0', 'Raquel', 83),
(125, b'0', 'Caio', 66),
(126, b'0', 'Renata', 66),
(127, b'0', 'Celio', 110);

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
(1, 'AÇUCAREIRO', b'1', 1, 0, 105),
(2, 'APARELHO DE JANTAR', b'1', 1, 0, 79),
(3, 'BANDEJA INOX', b'1', 1, 0, 102),
(5, 'BATEDEIRA DE BOLO', b'1', 1, 0, 96),
(6, 'BATEDOR DE ALHO DE FERRO', b'0', 1, 1, NULL),
(7, 'BOLEIRA', b'1', 1, 0, 70),
(8, 'CONCHA INOX', b'1', 1, 0, 83),
(9, 'COLHER DE TIRAR ARROZ INOX', b'1', 1, 0, 83),
(10, 'CONJUNTO DE MANTIMENTOS', b'1', 1, 0, 106),
(11, 'CUSCUZEIRA', b'1', 1, 0, 72),
(12, 'CENTRIFUGA', b'1', 1, 0, 77),
(13, 'DESCANSO PARA PANELA INOX', b'1', 1, 0, 103),
(14, 'ESCOMADEIRA', b'1', 1, 0, 86),
(15, 'ESCORREDOR DE PRATOS INOX', b'1', 1, 0, 102),
(16, 'ESCORREDOR DE MACARRÃO INOX', b'1', 1, 0, 74),
(17, 'ESCORREDOR DE ARROZ INOX', b'1', 1, 0, 102),
(18, 'ESPREMEDOR DE BATATA', b'1', 1, 0, 103),
(19, 'ESPREMEDOR DE LARANJA ELÉTRICO', b'1', 1, 0, 93),
(20, 'FAQUEIRO VERDE', b'1', 1, 0, 101),
(21, 'FRIGIDEIRA', b'1', 1, 0, 85),
(22, 'FERRO DE PASSAR ROUPA A VAPOR', b'1', 1, 0, 99),
(23, 'FACA DE COZINHA', b'1', 1, 0, 97),
(24, 'FARINHEIRO', b'1', 1, 0, 105),
(25, 'FRUTEIRA INOX', b'1', 1, 0, 89),
(26, 'FORMA DE BOLO REDONDA', b'1', 1, 0, 75),
(27, 'FORMA DE BOLO QUADRADA', b'1', 1, 0, 80),
(28, 'GARRAFA TÉRMICA', b'1', 1, 0, 69),
(29, 'GARRAFA DE ÁGUA DE VIDRO', b'1', 2, 0, 73),
(30, 'JOGO DE PANELA INOX', b'1', 1, 0, 92),
(31, 'JOGO DE COPOS', b'1', 1, 0, 67),
(32, 'JOGO DE TAÇAS', b'1', 1, 0, 68),
(33, 'JARRA DE SUCO COM COPOS DE VIDRO', b'1', 1, 0, 84),
(35, 'JOGO DE XÍCARA DE CHÁ', b'1', 1, 0, 81),
(36, 'JOGO DE XÍCARA DE CAFÉ', b'1', 1, 0, 66),
(37, 'JOGO DE SOBREMESA', b'1', 1, 0, 87),
(38, 'JOGO DE FACA PRA CHUARRASCO', b'1', 1, 0, 94),
(39, 'JOGO DE TEMPERO', b'1', 1, 0, 98),
(40, 'JOGO DE COLHER DE PAU', b'1', 1, 0, 91),
(41, 'JOGO DE VIDRO (saleiro, paliteiro, vinagre e azeite)', b'0', 1, 1, NULL),
(42, 'JOGO DE BACIAS, BUCHA E BALDE', b'1', 1, 0, 71),
(43, 'JOGO DE PANELA DE ALUMÍNIO', b'0', 1, 1, NULL),
(44, 'LEITEIRA', b'1', 1, 0, 105),
(45, 'LIXEIRA DE COZINHA', b'1', 1, 0, 91),
(46, 'LIXEIRA DE BANHEIRO', b'0', 1, 1, NULL),
(47, 'LIQUIDIFICADOR', b'1', 1, 0, 88),
(48, 'MARINEX PARA LASANHA COM SUPORTE', b'1', 1, 0, 82),
(49, 'MARINEX', b'1', 2, 0, 90),
(50, 'MICROONDAS', b'1', 1, 0, 83),
(51, 'PANELA DE PRESSÃO', b'1', 1, 0, 104),
(52, 'PORTA SABÃO LÍQUIDO E SABÃO DE BARRA', b'1', 1, 0, 71),
(53, 'PRATOS DE VIDRO', b'1', 6, 0, 82),
(54, 'PORTA COADOR', b'1', 1, 0, 70),
(55, 'PIPOQUEIRA', b'0', 1, 1, NULL),
(56, 'PORTA ROLO DE PAPEL TOALHA', b'0', 1, 1, NULL),
(57, 'PANELA ELÉTRICA DE ARROZ', b'1', 1, 0, 100),
(58, 'RALADOR INOX', b'1', 1, 0, 76),
(59, 'SALEIRA', b'0', 1, 1, NULL),
(60, 'SANDUICHEIRA', b'1', 1, 0, 78),
(61, 'TÁBUA DE PASSAR ROUPA', b'0', 1, 1, NULL),
(62, 'TÁBUA DE CARNE', b'1', 1, 0, 97),
(63, 'VASILHA DE PLÁSTICO GRANDE', b'0', 1, 1, NULL),
(64, 'VENTILADOR', b'0', 1, 1, NULL),
(65, 'QUEJEIRA', b'1', 1, 0, 95),
(107, 'FRIGIDEIRA ELÉTRICA', b'1', 1, 0, 108),
(109, 'APARELHO DE JANTAR DE PORCELANA', b'1', 1, 0, 110);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `FK_t4fs81y7kli721xai9cx4ro6i` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`);

--
-- Limitadores para a tabela `presente`
--
ALTER TABLE `presente`
  ADD CONSTRAINT `FK_b70h70risswhwop5q306vq2jf` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
