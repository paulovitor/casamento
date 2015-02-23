-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Máquina: 127.7.228.130:3306
-- Data de Criação: 23-Fev-2015 às 01:44
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
  PRIMARY KEY (`id`)
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
(72, 'jussarafreitadesouza@hotmail.com', 'Jocelma, Jussara e Família'),
(73, 'mayarachrisostomo@hotmail.com', 'Salvaerte/Nilcéia e Família'),
(74, 'nayara.ncsouza@gmail.com', 'Rodrigo e Nayara'),
(75, 'rosirochameirerosa@gmail.com', 'Ir. Beatriz PMRM'),
(76, 'fbf63530@opayq.com', 'Ludmilla'),
(77, 'ludy.freitas@gmail.com', 'Ademilton e Família'),
(78, 'tanialuz_@hotmail.com', 'Gilberto e Família'),
(79, 'bsb1081510@terra.com.br', 'Paulinho/Viviane e Família'),
(80, 'loi_lorena@hotmail.com', 'Gentil/Marcia e Família'),
(81, 's.sandrafreitas@gmail.com', 'Paulo e Sandra'),
(82, 'juelicesousa@gmail.com', 'Juelice e Otacilia'),
(83, 'fatimagomes29@hotmail.com;lucasofg@gmail.com', 'Benjamin e Família'),
(84, 'josinasv1990@hotmail.com', 'Josina'),
(85, 'greyci.l@hotmail.com', 'Pedro e Grayci'),
(86, 'graziellemoriza.gm@gmail.com', 'Luis/Grazi e Família'),
(87, 'dinahelpsouza@hotmail.com', 'Wilha e Dina'),
(88, 'masan_2006@hotmail.com', 'Edvaldo e Família'),
(89, 'izabelivete9@gmail.com', 'Izabel e Família'),
(90, 'ivone.gs08@hotmail.com', 'Eyler e Ivone'),
(91, 'eylerlombre@gmail.com', 'Wlson/Catia e Família'),
(92, 'mmmartaos@gmail.com', 'Antonio Carlos e Família '),
(93, 'lorenaosilva@gmail.com', 'Wemerson e Lorena'),
(94, 'milk.leo@gmail.com', 'Edil e Família'),
(95, 'jocelmafsouza@hotmail.com', 'Tia Jocelma'),
(96, 'marcosjoliv@hotmail.com', 'Marcos e Família'),
(97, 'victorwilliam47@gmail.com', 'Victor'),
(98, 'brunoo.silva@gmail.com', 'Bruno e Flávia'),
(99, 'dalvaosilva@gmail.com', 'Maria Dalva e Família'),
(100, 'daltair.freitas@gmail.com', 'Daltair e Sheila'),
(101, 'eljunior14@gmail.com', 'Vô Edson, Ti Junin e Tia Selma'),
(102, 'daltono@brturbo.com.br', 'Daltono e Família'),
(103, 'glauciaalbanez@gmail.com', 'Gláucia'),
(104, 'nubiafonoaudiologia@yahoo.com.br', 'Gulherme/Núbia e Família'),
(105, 'mucioalbanez@gmail.com', 'Mucio'),
(106, 'fabioalbanez@gmail.com', 'Fábio e Maria Clara'),
(108, 'wbertis_sazon@hotmail.com', 'Wbertis e Carol'),
(110, 'celio@snews.tv', 'Celio e Família'),
(230, 'paulovitor88@gmail.com', 'Vó Terezinha e Família'),
(235, 'paulovitor88@gmail.com', 'Fátima'),
(236, 'paulovitor88@gmail.com', 'Graça'),
(237, 'paulovitor88@gmail.com', 'Francisco Alberto e Família'),
(238, 'laycrys6@gmail.com', 'Renato e Família'),
(239, 'paulovitor88@gmail.com', 'Gilberto/Flávia e Família'),
(240, 'laycrys6@gmail.com', 'Ilário e Lurdes'),
(241, 'laycrys6@gmail.com', 'Vô Batista'),
(242, 'laycrys6@gmail.com', 'Davi e Karine'),
(243, 'luismonteiro15@hotmail.com', 'Luis Cesar'),
(244, 'paulovitor88@gmail.com', 'Kenji e Andreia'),
(245, 'paulovitor88@gmail.com', 'Lucas Thadeu'),
(246, 'laycrys6@gmail.com', 'Luciano'),
(247, 'laycrys6@gmail.com', 'Anselmo e Família'),
(248, 'laycrys6@gmail.com', 'Cassia e Raquel'),
(249, 'mihouse_2005@hotmail.com', 'Victor e Família'),
(250, 'laycrys6@gmail.com', 'Padre Katê'),
(251, 'laycrys6@gmail.com', 'Padre Cicero'),
(252, 'laycrys6@gmail.com', 'Sileide e Julia'),
(253, 'teresamessiaspsic@gmail.com', 'Daylor e Tereza'),
(254, 'laycrys6@gmail.com', 'Marcelo e Família'),
(255, 'lucas-futrica2010@hotmail.com', 'Lucas e Geovana'),
(275, 'laycrys6@gmail.com', 'Seminarista Lucas Thadeu '),
(276, 'laycrys6@gmail.com', 'Seminarista Daniel'),
(277, 'laycrys6@gmail.com', 'Seminarista Marlon'),
(278, 'laycrys6@gmail.com', 'Seminarista Junior');

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
(346);

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
(116, b'1', 'Antônio Carlos', 92),
(117, b'1', 'Marta', 92),
(118, b'1', 'Marina', 92),
(119, b'1', 'Mateus', 92),
(120, b'0', 'Benjamin', 83),
(121, b'0', 'Fatima', 83),
(122, b'0', 'Paula', 83),
(123, b'0', 'Lucas', 83),
(124, b'0', 'Raquel', 83),
(125, b'0', 'Caio', 66),
(126, b'0', 'Renata', 66),
(127, b'0', 'Celio', 110),
(128, b'0', 'Simone', 110),
(129, b'0', 'Victor', 110),
(130, b'0', 'Daltair', 100),
(131, b'0', 'Sheila', 100),
(132, b'0', 'Daltair Felippe', 100),
(133, b'0', 'Daltono', 102),
(134, b'0', 'Rosângela', 102),
(135, b'0', 'Mucio', 102),
(136, b'0', 'Mateus', 102),
(137, b'0', 'Glaucia', 102),
(138, b'0', 'Edil', 94),
(139, b'0', 'Claudia', 94),
(140, b'0', 'Leonardo', 94),
(141, b'0', 'Ana Clara', 94),
(142, b'0', 'Edvaldo', 88),
(143, b'0', 'Maria Auxiliadora', 88),
(144, b'0', 'Carlos Eduardo', 88),
(145, b'0', 'Elimar', 69),
(146, b'0', 'Fabiana', 69),
(147, b'0', 'Letícia', 69),
(148, b'0', 'Larissa', 69),
(149, b'0', 'Milena', 69),
(150, b'0', 'Eyler', 90),
(151, b'0', 'Ivone', 90),
(152, b'0', 'Fábio', 106),
(153, b'0', 'Maria Clara', 106),
(154, b'0', 'Bruno', 98),
(155, b'0', 'Flávia', 98),
(156, b'0', 'Francisco', 67),
(157, b'0', 'Cassia', 67),
(158, b'0', 'Gilberto', 78),
(159, b'0', 'Tania', 78),
(160, b'0', 'Bruno', 78),
(161, b'0', 'Hugo', 78),
(162, b'0', 'Namorada do Hugo', 78),
(163, b'0', 'Kelly', 78),
(164, b'0', 'Grazi', 86),
(165, b'0', 'Luis', 86),
(166, b'0', 'Ruan', 86),
(167, b'0', 'Guilherme', 104),
(168, b'0', 'Núbia', 104),
(169, b'0', 'Geovana', 104),
(170, b'0', 'Namorado da Geovana', 104),
(171, b'0', 'Irmã Beatriz', 75),
(172, b'0', 'Izabel', 89),
(173, b'0', 'Helton', 89),
(174, b'0', 'Hendril', 89),
(175, b'0', 'Namorada Hendril', 89),
(176, b'0', 'Isabeli', 89),
(177, b'0', 'Joelino', 70),
(178, b'0', 'Jocelia', 70),
(179, b'0', 'Daniele', 70),
(180, b'0', 'Marina', 70),
(181, b'0', 'Gabriel', 70),
(182, b'0', 'Josina', 84),
(183, b'0', 'Juelice', 82),
(184, b'0', 'Otacilia', 82),
(185, b'0', 'Jussara', 72),
(186, b'0', 'Jocelma', 72),
(187, b'0', 'Luis Henrique', 72),
(188, b'0', 'Namorada do Luis Henrique', 72),
(189, b'0', 'Wemerson', 93),
(190, b'0', 'Lorena', 93),
(191, b'0', 'Gentil', 80),
(192, b'0', 'Marcia', 80),
(193, b'0', 'Lorena', 80),
(194, b'0', 'Eduardo', 80),
(195, b'0', 'Marcos', 96),
(196, b'0', 'Regina', 96),
(197, b'0', 'Vinicius', 96),
(198, b'0', 'Gustavo', 96),
(199, b'0', 'Namorada do Gustavo', 96),
(200, b'0', 'Rodrigo', 74),
(201, b'0', 'Nayara', 74),
(202, b'0', 'Salvaerte', 73),
(203, b'0', 'Nilcéia', 73),
(204, b'0', 'Anderson', 73),
(205, b'0', 'Mariana', 73),
(206, b'0', 'Mayara', 73),
(207, b'0', 'Namorado da Mayara', 73),
(208, b'0', 'Marilda', 73),
(209, b'0', 'Paulo Roberto', 79),
(210, b'0', 'Viviane', 79),
(211, b'0', 'Tayna', 79),
(212, b'0', 'Namorado da Tayna', 79),
(213, b'0', 'Junior', 79),
(214, b'0', 'Pedro', 85),
(215, b'0', 'Grayci', 85),
(216, b'0', 'Paulo Bartos', 81),
(217, b'0', 'Sandra', 81),
(218, b'0', 'Vô Edson', 101),
(219, b'0', 'Junior', 101),
(220, b'0', 'Selma', 101),
(221, b'0', 'Vó Rosa', 68),
(222, b'0', 'Wbertis', 108),
(223, b'0', 'Carol', 108),
(224, b'0', 'Wilha', 87),
(225, b'0', 'Dina', 87),
(226, b'0', 'Wilson', 91),
(227, b'0', 'Catia', 91),
(228, b'0', 'Edgar', 91),
(229, b'0', 'Moriane', 91),
(256, b'0', 'Maria Dalva', 99),
(257, b'0', 'Tiago', 99),
(258, b'0', 'Vó Terezinha', 230),
(259, b'0', 'Simone', 230),
(260, b'0', 'Fátima', 235),
(261, b'0', 'Graça', 236),
(262, b'0', 'Francisco Alberto', 237),
(263, b'0', 'Cissa', 237),
(264, b'0', 'Renato', 238),
(265, b'0', 'Gisele', 238),
(266, b'0', 'Amanda', 238),
(267, b'0', 'Ilário', 240),
(268, b'0', 'Lurdes', 240),
(269, b'0', 'Vô Batista', 241),
(270, b'0', 'Davi', 242),
(271, b'0', 'Karine', 242),
(272, b'0', 'Luís Cesar', 243),
(273, b'0', 'Kenji', 244),
(274, b'0', 'Andreia', 244),
(279, b'0', 'Victor', 249),
(280, b'0', 'Joyce', 249),
(281, b'0', 'Rosa', 249),
(282, b'0', 'Maria Eduarda', 249),
(283, b'0', 'Mariana', 249),
(284, b'0', 'Marilha', 249),
(285, b'0', 'Padre Katê', 250),
(286, b'0', 'Padre Cicero', 251),
(287, b'0', 'Sileide', 252),
(288, b'0', 'Julia', 252),
(289, b'0', 'Daylor', 253),
(290, b'0', 'Tereza', 253),
(291, b'0', 'Gilberto', 239),
(292, b'0', 'Flávia', 239),
(293, b'0', 'Catarina', 239),
(294, b'0', 'Marcelo', 254),
(295, b'0', 'Janaina', 254),
(296, b'0', 'Milca', 254),
(297, b'0', 'Namorado Milca', 254),
(298, b'0', 'Alisson', 254),
(299, b'0', 'Lucas', 255),
(300, b'0', 'Geovana', 255),
(301, b'0', 'Lucas Thadeu', 275),
(302, b'0', 'Daniel', 276),
(303, b'0', 'Marlon', 277),
(304, b'0', 'Junior', 278),
(305, b'0', 'Anselmo', 247),
(306, b'0', 'Gilma', 247),
(307, b'0', 'Nicole', 247),
(308, b'0', 'Cassia', 248),
(309, b'0', 'Raquel', 248),
(310, b'0', 'Lucas Thadeu', 245),
(311, b'0', 'Luciano', 246);

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
(109, 'APARELHO DE JANTAR DE PORCELANA', b'1', 1, 0, 110),
(312, 'JOGO DE LENÇOL', b'0', 3, 1, NULL),
(313, 'JOGO DE LENÇOL AVULSO COM ELÁSTICO', b'0', 3, 1, NULL),
(314, 'JOGO DE LENÇOL MALHA', b'0', 3, 1, NULL),
(315, 'TRAVESSEIRO NASA', b'0', 2, 1, NULL),
(316, 'EDREDOM', b'0', 3, 1, NULL),
(317, 'COLCHA MATELASSIÊ', b'0', 3, 1, NULL),
(318, 'COLCHA PIQUET', b'0', 3, 1, NULL),
(319, 'FRONHA AVULSA', b'0', 8, 1, NULL),
(320, 'COBERTOR', b'0', 3, 1, NULL),
(321, 'PROTETOR DE COLCHÃO', b'0', 2, 1, NULL),
(322, 'PROTETOR DE TRAVESSEIRO', b'0', 2, 1, NULL),
(323, 'CORTINA', b'0', 2, 1, NULL),
(324, 'TAPETE PEQUENO', b'0', 2, 1, NULL),
(325, 'TAPETE MÉDIO', b'0', 2, 1, NULL),
(326, 'TAPETE GRANDE', b'0', 2, 1, NULL),
(327, 'ALMOFADA PARA DECORAÇÃO', b'0', 4, 1, NULL),
(328, 'CAPA PARA ALMOFADA', b'0', 4, 1, NULL),
(329, 'TOALHA PARA MESA DE 4 CADEIRAS', b'0', 3, 1, NULL),
(330, 'JOGO AMERICANO', b'0', 2, 1, NULL),
(331, 'TOALHA PARA BANDEIJA', b'0', 3, 1, NULL),
(332, 'PEGADOR DE FORNO', b'0', 2, 1, NULL),
(333, 'JOGO DE TOALHAS', b'0', 5, 1, NULL),
(334, 'TOALHA DE BANHO AVULSA', b'0', 4, 1, NULL),
(335, 'TOALHA DE ROSTO AVULSA', b'0', 4, 1, NULL),
(336, 'TAPETE PARA BANHEIRO', b'0', 3, 1, NULL),
(337, 'JOGO PARA BANHEIRO', b'0', 3, 1, NULL),
(338, 'CESTO DE ROUPA', b'0', 1, 1, NULL),
(339, 'GELADEIRA', b'0', 1, 1, NULL),
(340, 'MÁQUINA DE LAVAR', b'0', 1, 1, NULL),
(341, 'FOGÃO DESKTOP', b'0', 1, 1, NULL),
(342, 'PANELA DE ARROZ ELÉTRICA', b'0', 1, 1, NULL),
(343, 'RELÓGIO DE PAREDE', b'0', 1, 1, NULL),
(344, 'PRATOS FUNDOS', b'0', 12, 1, NULL),
(345, 'FILTRO', b'0', 1, 1, NULL);

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
