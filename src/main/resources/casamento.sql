-- phpMyAdmin SQL Dump
-- version 4.0.10.9
-- http://www.phpmyadmin.net
--
-- Máquina: 127.7.228.130:3306
-- Data de Criação: 29-Mar-2015 às 15:20
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
(72, 'jussarafreitadesouza@hotmail.com', 'Jocelma, Jussara e Família'),
(73, 'mayarachrisostomo@hotmail.com', 'Salvaerte/Nilcéia e Família'),
(74, 'nayara.ncsouza@gmail.com', 'Rodrigo e Nayara'),
(75, 'rosirochameirerosa@gmail.com', 'Ir. Beatriz PMRM'),
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
(91, 'wilsonlombre@gmail.com', 'Wilson/Catia e Família'),
(92, 'mmmartaos@gmail.com', 'Antonio Carlos e Família '),
(93, 'lorenaosilva@gmail.com', 'Wemerson e Lorena'),
(94, 'milk.leo@gmail.com', 'Edil e Família'),
(96, 'marcosjoliv@hotmail.com', 'Marcos e Família'),
(98, 'brunoo.silva@gmail.com', 'Bruno e Flávia'),
(99, 'dalvaosilva@gmail.com', 'Maria Dalva e Família'),
(100, 'daltair.freitas@gmail.com', 'Daltair e Sheila'),
(101, 'eljunior14@gmail.com', 'Vô Edson, Ti Junin e Tia Selma'),
(102, 'daltono@brturbo.com.br', 'Daltono e Família'),
(104, 'nubiafonoaudiologia@yahoo.com.br', 'Gulherme/Núbia e Família'),
(106, 'fabioalbanez@gmail.com', 'Fábio e Maria Clara'),
(108, 'wbertis_sazon@hotmail.com', 'Wbertis e Carol'),
(110, 'celio@snews.tv', 'Celio e Família'),
(230, 'email@email.com', 'Vó Terezinha e Família'),
(235, 'email@email.com', 'Fátima'),
(236, 'email@email.com', 'Graça e Familía'),
(237, 'email@email.com', 'Francisco Alberto e Família'),
(238, 'renatinhojonathan@gmail.com', 'Renato e Família'),
(240, 'email@email.com', 'Ilário e Lurdes'),
(241, 'email@email.com', 'Vô Batista'),
(242, 'email@email.com', 'Davi e Karine'),
(243, 'luismonteiro15@hotmail.com', 'Luis Cesar'),
(244, 'email@email.com', 'Kenji e Andreia'),
(245, 'email@email.com', 'Lucas Thadeu'),
(246, 'email@email.com', 'Luciano'),
(248, 'email@email.com', 'Cassia e Raquel'),
(249, 'mihouse_2005@hotmail.com', 'Victor e Família'),
(250, 'email@email.com', 'Padre Katê'),
(251, 'email@email.com', 'Padre Cicero'),
(253, 'teresamessiaspsic@gmail.com', 'Daylor e Tereza'),
(254, 'email@email.com', 'Marcelo e Família'),
(255, 'lucas-futrica2010@hotmail.com', 'Lucas e Geovana'),
(275, 'email@email.com', 'Seminarista Lucas Thadeu '),
(276, 'email@email.com', 'Seminarista Daniel'),
(277, 'email@email.com', 'Seminarista Marlon'),
(278, 'email@email.com', 'Seminarista Junior'),
(350, 'email@email.com', 'Vicente e Família'),
(355, 'email@email.com', 'Ilma e Rúbia'),
(356, 'email@email.com', 'Gabriela'),
(361, 'flavia.faray@gmail.com', 'Flavia, Gilberto e Catarina'),
(362, 'soares.gilma@gmail.com', 'Anselmo e Família'),
(364, 'julha.sileide@gmail.com', 'Sileide e Julia'),
(365, 'email@email.com', 'Francisco Roberto');

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
(374);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL,
  `confirmado` bit(1) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `familia_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t4fs81y7kli721xai9cx4ro6i` (`familia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `confirmado`, `nome`, `familia_id`, `email`) VALUES
(111, b'1', 'Ademilton', 77, NULL),
(112, b'1', 'Jocema', 77, NULL),
(113, b'1', 'Maurício', 77, NULL),
(114, b'1', 'Daniel', 77, NULL),
(115, b'1', 'Ludmilla', 77, 'fbf63530@opayq.com'),
(116, b'1', 'Antônio Carlos', 92, NULL),
(117, b'1', 'Marta', 92, NULL),
(118, b'1', 'Marina', 92, NULL),
(119, b'1', 'Mateus', 92, NULL),
(120, b'1', 'Benjamin', 83, NULL),
(121, b'1', 'Fatima', 83, NULL),
(122, b'1', 'Paula', 83, NULL),
(123, b'1', 'Lucas', 83, NULL),
(124, b'1', 'Raquel', 83, NULL),
(125, b'1', 'Caio', 66, NULL),
(126, b'1', 'Renata', 66, NULL),
(127, b'0', 'Celio', 110, NULL),
(128, b'0', 'Simone', 110, NULL),
(129, b'0', 'Victor William', 110, 'victorwilliam47@gmail.com'),
(130, b'1', 'Daltair', 100, NULL),
(131, b'1', 'Sheila', 100, NULL),
(132, b'1', 'Daltair Felippe', 100, NULL),
(133, b'0', 'Daltono', 102, NULL),
(134, b'0', 'Rosângela', 102, NULL),
(135, b'0', 'Mucio', 102, 'mucioalbanez@gmail.com'),
(136, b'0', 'Mateus', 102, NULL),
(137, b'0', 'Gláucia', 102, 'glauciaalbanez@gmail.com'),
(138, b'0', 'Edil', 94, NULL),
(139, b'0', 'Claudia', 94, NULL),
(140, b'0', 'Leonardo', 94, NULL),
(141, b'0', 'Ana Clara', 94, NULL),
(142, b'1', 'Edvaldo', 88, NULL),
(143, b'1', 'Maria Auxiliadora', 88, NULL),
(144, b'1', 'Carlos Eduardo', 88, NULL),
(145, b'1', 'Elimar', 69, NULL),
(146, b'0', 'Fabiana', 69, NULL),
(147, b'1', 'Letícia', 69, NULL),
(148, b'1', 'Larissa', 69, NULL),
(149, b'1', 'Milena', 69, NULL),
(150, b'1', 'Eyler', 90, NULL),
(151, b'1', 'Ivone', 90, NULL),
(152, b'0', 'Fábio', 106, NULL),
(153, b'0', 'Maria Clara', 106, NULL),
(154, b'1', 'Bruno', 98, NULL),
(155, b'1', 'Flávia', 98, NULL),
(156, b'1', 'Francisco', 67, NULL),
(157, b'1', 'Cassia', 67, NULL),
(158, b'0', 'Gilberto', 78, NULL),
(159, b'0', 'Tania', 78, NULL),
(160, b'0', 'Bruno', 78, NULL),
(161, b'0', 'Hugo', 78, NULL),
(162, b'0', 'Namorada do Hugo', 78, NULL),
(163, b'0', 'Kelly', 78, NULL),
(164, b'0', 'Grazi', 86, NULL),
(165, b'0', 'Luis', 86, NULL),
(166, b'0', 'Ruan', 86, NULL),
(167, b'0', 'Guilherme', 104, NULL),
(168, b'0', 'Núbia', 104, NULL),
(169, b'0', 'Geovana', 104, NULL),
(170, b'0', 'Namorado da Geovana', 104, NULL),
(171, b'1', 'Irmã Beatriz', 75, NULL),
(172, b'0', 'Izabel', 89, NULL),
(173, b'0', 'Helton', 89, NULL),
(174, b'0', 'Hendril', 89, NULL),
(175, b'0', 'Namorada Hendril', 89, NULL),
(176, b'0', 'Isabeli', 89, NULL),
(177, b'1', 'Joelino', 70, NULL),
(178, b'1', 'Jocelia', 70, NULL),
(179, b'1', 'Dani Ferreira', 70, 'dani8freitas@gmail.com'),
(180, b'1', 'Marina', 70, NULL),
(181, b'1', 'Gabriel', 70, NULL),
(182, b'1', 'Josina', 84, NULL),
(183, b'0', 'Juelice', 82, NULL),
(184, b'0', 'Otacilia', 82, NULL),
(185, b'0', 'Jussara', 72, NULL),
(186, b'0', 'Jocelma', 72, 'jocelmafsouza@hotmail.com'),
(187, b'0', 'Luis Henrique', 72, NULL),
(188, b'0', 'Namorada do Luis Henrique', 72, NULL),
(189, b'0', 'Wemerson', 93, NULL),
(190, b'0', 'Lorena', 93, NULL),
(191, b'1', 'Gentil', 80, NULL),
(192, b'1', 'Marcia', 80, NULL),
(193, b'1', 'Lorena', 80, NULL),
(194, b'1', 'Eduardo', 80, NULL),
(195, b'0', 'Marcos', 96, NULL),
(196, b'0', 'Regina', 96, NULL),
(197, b'0', 'Vinicius', 96, NULL),
(198, b'0', 'Gustavo', 96, NULL),
(199, b'0', 'Namorada do Gustavo', 96, NULL),
(200, b'1', 'Rodrigo', 74, NULL),
(201, b'1', 'Nayara', 74, NULL),
(202, b'0', 'Salvaerte', 73, NULL),
(203, b'1', 'Nilcéia', 73, NULL),
(204, b'1', 'Anderson', 73, NULL),
(205, b'1', 'Mariana Chrisostomo', 73, 'marianachrisostomo25@gmail.com'),
(206, b'1', 'Mayara', 73, NULL),
(207, b'1', 'Namorado da Mayara', 73, NULL),
(208, b'1', 'Marilda', 73, NULL),
(209, b'1', 'Paulo Roberto', 79, NULL),
(210, b'1', 'Viviane', 79, NULL),
(211, b'1', 'Tayna', 79, NULL),
(212, b'1', 'Leonardo', 79, NULL),
(213, b'1', 'Junior', 79, NULL),
(214, b'0', 'Pedro', 85, NULL),
(215, b'0', 'Grayci', 85, NULL),
(216, b'1', 'Paulo Bartos', 81, NULL),
(217, b'1', 'Sandra', 81, NULL),
(218, b'1', 'Vô Edson', 101, NULL),
(219, b'1', 'Junior', 101, NULL),
(220, b'1', 'Selma', 101, NULL),
(221, b'1', 'Vó Rosa', 68, NULL),
(222, b'0', 'Wbertis', 108, NULL),
(223, b'0', 'Carol', 108, NULL),
(224, b'0', 'Wilha', 87, NULL),
(225, b'0', 'Dina', 87, NULL),
(226, b'1', 'Wilson', 91, NULL),
(227, b'1', 'Catia', 91, NULL),
(228, b'1', 'Edgar', 91, NULL),
(229, b'1', 'Moriane', 91, NULL),
(256, b'0', 'Maria Dalva', 99, NULL),
(257, b'0', 'Tiago', 99, NULL),
(258, b'0', 'Vó Terezinha', 230, NULL),
(259, b'0', 'Simone', 230, NULL),
(260, b'0', 'Fátima', 235, NULL),
(261, b'0', 'Graça', 236, NULL),
(262, b'0', 'Francisco Alberto', 237, NULL),
(263, b'0', 'Cissa', 237, NULL),
(264, b'1', 'Renato', 238, NULL),
(265, b'1', 'Gisele', 238, NULL),
(266, b'1', 'Amanda', 238, NULL),
(267, b'0', 'Ilário', 240, NULL),
(268, b'0', 'Lurdes', 240, NULL),
(269, b'0', 'Vô Batista', 241, NULL),
(270, b'0', 'Davi', 242, NULL),
(271, b'0', 'Karine', 242, NULL),
(272, b'0', 'Luís Cesar', 243, NULL),
(273, b'1', 'Kenji', 244, NULL),
(274, b'1', 'Andreia', 244, NULL),
(279, b'0', 'Victor', 249, NULL),
(280, b'0', 'Joyce', 249, NULL),
(281, b'0', 'Rosa', 249, NULL),
(282, b'0', 'Maria Eduarda', 249, NULL),
(283, b'0', 'Mariana', 249, NULL),
(284, b'0', 'Marilha', 249, NULL),
(285, b'0', 'Padre Katê', 250, NULL),
(286, b'0', 'Padre Cicero', 251, NULL),
(287, b'1', 'Sileide', 364, NULL),
(288, b'1', 'Julia', 364, NULL),
(289, b'0', 'Daylor', 253, NULL),
(290, b'0', 'Tereza', 253, NULL),
(291, b'1', 'Gilberto', 361, NULL),
(292, b'1', 'Flávia', 361, NULL),
(293, b'1', 'Catarina', 361, NULL),
(294, b'0', 'Marcelo', 254, NULL),
(295, b'0', 'Janaina', 254, NULL),
(296, b'0', 'Milca', 254, NULL),
(297, b'0', 'Namorado Milca', 254, NULL),
(298, b'0', 'Alisson', 254, NULL),
(299, b'0', 'Lucas', 255, NULL),
(300, b'0', 'Geovana', 255, NULL),
(301, b'0', 'Lucas Thadeu', 275, NULL),
(302, b'0', 'Daniel', 276, NULL),
(303, b'0', 'Marlon', 277, NULL),
(304, b'0', 'Junior', 278, NULL),
(305, b'1', 'Anselmo', 362, NULL),
(306, b'1', 'Gilma', 362, NULL),
(307, b'1', 'Nicole', 362, NULL),
(308, b'1', 'Cassia', 248, NULL),
(309, b'1', 'Raquel', 248, NULL),
(310, b'0', 'Lucas Thadeu', 245, NULL),
(311, b'1', 'Luciano', 246, NULL),
(351, b'0', 'Vicente', 350, NULL),
(352, b'0', 'Rosa', 350, NULL),
(353, b'0', 'Kelvin', 350, NULL),
(354, b'0', 'Namorada do Kelvin', 350, NULL),
(357, b'0', 'Gabriela', 356, NULL),
(358, b'0', 'Ilma', 355, NULL),
(359, b'0', 'Rúbia', 355, NULL),
(368, b'0', 'Diogo', 236, NULL),
(369, b'0', 'Jaqueline', 236, NULL),
(373, b'0', 'Francisco Roberto', 365, NULL);

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
  `pessoa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2pdcfvsma8y2ewpsj5kskehaf` (`nome`),
  KEY `FK_b70h70risswhwop5q306vq2jf` (`familia_id`),
  KEY `FK_mbe46e1oj35p4sp1bxhleues7` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `presente`
--

INSERT INTO `presente` (`id`, `nome`, `ok`, `quantidade`, `tipo`, `familia_id`, `pessoa_id`) VALUES
(1, 'AÇUCAREIRO', b'1', 1, 0, NULL, 135),
(2, 'APARELHO DE JANTAR', b'1', 1, 0, 79, NULL),
(3, 'BANDEJA INOX', b'1', 1, 0, 102, NULL),
(5, 'BATEDEIRA DE BOLO', b'1', 1, 0, 96, NULL),
(6, 'BATEDOR DE ALHO DE FERRO', b'0', 1, 1, NULL, NULL),
(7, 'BOLEIRA', b'1', 1, 0, 70, NULL),
(8, 'CONCHA INOX', b'1', 1, 0, 83, NULL),
(9, 'COLHER DE TIRAR ARROZ INOX', b'1', 1, 0, 83, NULL),
(10, 'CONJUNTO DE MANTIMENTOS', b'1', 1, 0, 106, NULL),
(11, 'CUSCUZEIRA', b'1', 1, 0, 72, NULL),
(12, 'CENTRIFUGA', b'1', 1, 0, 77, NULL),
(13, 'DESCANSO PARA PANELA INOX', b'1', 1, 0, NULL, 137),
(14, 'ESCOMADEIRA', b'1', 1, 0, 86, NULL),
(15, 'ESCORREDOR DE PRATOS INOX', b'1', 1, 0, 102, NULL),
(16, 'ESCORREDOR DE MACARRÃO INOX', b'1', 1, 0, 74, NULL),
(17, 'ESCORREDOR DE ARROZ INOX', b'1', 1, 0, 102, NULL),
(18, 'ESPREMEDOR DE BATATA', b'1', 1, 0, NULL, 137),
(19, 'ESPREMEDOR DE LARANJA ELÉTRICO', b'1', 1, 0, 93, NULL),
(20, 'FAQUEIRO VERDE', b'1', 1, 0, 101, NULL),
(21, 'FRIGIDEIRA', b'1', 1, 0, 85, NULL),
(22, 'FERRO DE PASSAR ROUPA A VAPOR', b'1', 1, 0, 99, NULL),
(23, 'FACA DE COZINHA', b'1', 1, 0, NULL, 129),
(24, 'FARINHEIRO', b'1', 1, 0, NULL, 135),
(25, 'FRUTEIRA INOX', b'1', 1, 0, 89, NULL),
(26, 'FORMA DE BOLO REDONDA', b'1', 1, 0, NULL, 171),
(27, 'FORMA DE BOLO QUADRADA', b'1', 1, 0, 80, NULL),
(28, 'GARRAFA TÉRMICA', b'1', 1, 0, 69, NULL),
(29, 'GARRAFA DE ÁGUA DE VIDRO', b'1', 2, 0, 73, NULL),
(30, 'JOGO DE PANELA INOX', b'1', 1, 0, 92, NULL),
(31, 'JOGO DE COPOS', b'1', 1, 0, 67, NULL),
(32, 'JOGO DE TAÇAS', b'1', 1, 0, NULL, 221),
(33, 'JARRA DE SUCO COM COPOS DE VIDRO', b'1', 1, 0, NULL, 182),
(35, 'JOGO DE XÍCARA DE CHÁ', b'1', 1, 0, 81, NULL),
(36, 'JOGO DE XÍCARA DE CAFÉ', b'1', 1, 0, 66, NULL),
(37, 'JOGO DE SOBREMESA', b'1', 1, 0, 87, NULL),
(38, 'JOGO DE FACA PRA CHUARRASCO', b'1', 1, 0, 94, NULL),
(39, 'JOGO DE TEMPERO', b'1', 1, 0, 98, NULL),
(40, 'JOGO DE COLHER DE PAU', b'1', 1, 0, 91, NULL),
(41, 'JOGO DE VIDRO (saleiro, paliteiro, vinagre e azeite)', b'0', 1, 1, NULL, NULL),
(42, 'JOGO DE BACIAS, BUCHA E BALDE', b'1', 1, 0, NULL, 179),
(43, 'JOGO DE PANELA DE ALUMÍNIO', b'1', 1, 1, 361, NULL),
(44, 'LEITEIRA', b'1', 1, 0, NULL, 135),
(45, 'LIXEIRA DE COZINHA', b'1', 1, 0, 91, NULL),
(46, 'LIXEIRA DE BANHEIRO', b'1', 1, 1, 77, NULL),
(47, 'LIQUIDIFICADOR', b'1', 1, 0, 88, NULL),
(48, 'MARINEX PARA LASANHA COM SUPORTE', b'1', 1, 0, 82, NULL),
(49, 'MARINEX', b'1', 2, 0, 90, NULL),
(50, 'MICROONDAS', b'1', 1, 0, 83, NULL),
(51, 'PANELA DE PRESSÃO', b'1', 1, 0, 104, NULL),
(52, 'PORTA SABÃO LÍQUIDO E SABÃO DE BARRA', b'1', 1, 0, NULL, 179),
(53, 'PRATOS DE VIDRO', b'1', 6, 0, 82, NULL),
(54, 'PORTA COADOR', b'1', 1, 0, 70, NULL),
(55, 'PIPOQUEIRA', b'0', 1, 1, NULL, NULL),
(56, 'PORTA ROLO DE PAPEL TOALHA', b'0', 1, 1, NULL, NULL),
(57, 'PANELA ELÉTRICA DE ARROZ', b'1', 1, 0, 100, NULL),
(58, 'RALADOR INOX', b'1', 1, 0, NULL, 115),
(59, 'SALEIRA', b'0', 1, 1, NULL, NULL),
(60, 'SANDUICHEIRA', b'1', 1, 0, 78, NULL),
(61, 'TÁBUA DE PASSAR ROUPA', b'0', 1, 1, NULL, NULL),
(62, 'TÁBUA DE CARNE', b'1', 1, 0, NULL, 129),
(63, 'VASILHA DE PLÁSTICO GRANDE', b'0', 1, 1, NULL, NULL),
(64, 'VENTILADOR', b'1', 1, 1, 79, NULL),
(65, 'QUEJEIRA', b'1', 1, 0, NULL, 186),
(107, 'FRIGIDEIRA ELÉTRICA', b'1', 1, 0, 108, NULL),
(109, 'APARELHO DE JANTAR DE PORCELANA', b'1', 1, 0, 110, NULL),
(312, 'JOGO DE LENÇOL', b'0', 3, 1, NULL, NULL),
(313, 'JOGO DE LENÇOL AVULSO COM ELÁSTICO', b'0', 3, 1, NULL, NULL),
(314, 'JOGO DE LENÇOL MALHA', b'0', 3, 1, NULL, NULL),
(315, 'TRAVESSEIRO NASA', b'0', 2, 1, NULL, NULL),
(316, 'EDREDOM', b'0', 3, 1, NULL, NULL),
(317, 'COLCHA MATELASSIÊ', b'1', 3, 1, NULL, 205),
(318, 'COLCHA PIQUET', b'0', 3, 1, NULL, NULL),
(319, 'FRONHA AVULSA', b'0', 8, 1, NULL, NULL),
(320, 'COBERTOR', b'0', 3, 1, NULL, NULL),
(321, 'PROTETOR DE COLCHÃO', b'0', 2, 1, NULL, NULL),
(322, 'PROTETOR DE TRAVESSEIRO', b'0', 2, 1, NULL, NULL),
(323, 'CORTINA', b'0', 2, 1, NULL, NULL),
(324, 'TAPETE PEQUENO', b'0', 2, 1, NULL, NULL),
(325, 'TAPETE MÉDIO', b'0', 2, 1, NULL, NULL),
(326, 'TAPETE GRANDE', b'0', 2, 1, NULL, NULL),
(327, 'ALMOFADA PARA DECORAÇÃO', b'0', 4, 1, NULL, NULL),
(328, 'CAPA PARA ALMOFADA', b'1', 4, 1, 91, NULL),
(329, 'TOALHA PARA MESA DE 6 CADEIRAS', b'1', 3, 1, 362, NULL),
(330, 'JOGO AMERICANO', b'0', 2, 1, NULL, NULL),
(331, 'TOALHA PARA BANDEIJA', b'0', 3, 1, NULL, NULL),
(332, 'PEGADOR DE FORNO', b'0', 2, 1, NULL, NULL),
(333, 'JOGO DE TOALHAS', b'1', 5, 1, 364, NULL),
(334, 'TOALHA DE BANHO AVULSA', b'1', 4, 1, 73, NULL),
(335, 'TOALHA DE ROSTO AVULSA', b'0', 4, 1, NULL, NULL),
(336, 'TAPETE PARA BANHEIRO', b'0', 3, 1, NULL, NULL),
(337, 'JOGO PARA BANHEIRO', b'0', 3, 1, NULL, NULL),
(338, 'CESTO DE ROUPA', b'0', 1, 1, NULL, NULL),
(339, 'GELADEIRA', b'0', 1, 1, NULL, NULL),
(340, 'MÁQUINA DE LAVAR', b'0', 1, 1, NULL, NULL),
(341, 'FOGÃO', b'1', 1, 1, 70, NULL),
(342, 'JOGO DE BAIXELA', b'0', 1, 1, NULL, NULL),
(343, 'RELÓGIO DE PAREDE', b'0', 1, 1, NULL, NULL),
(344, 'PRATOS FUNDOS', b'0', 12, 1, NULL, NULL),
(345, 'FILTRO', b'0', 1, 1, NULL, NULL),
(346, 'CAMA', b'0', 1, 1, NULL, NULL),
(347, 'TELEVISÃO', b'0', 1, 1, NULL, NULL),
(372, 'JOGO DE SUCO DE VIDRO', b'1', 1, 0, 249, NULL);

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
  ADD CONSTRAINT `FK_b70h70risswhwop5q306vq2jf` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`),
  ADD CONSTRAINT `FK_mbe46e1oj35p4sp1bxhleues7` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
