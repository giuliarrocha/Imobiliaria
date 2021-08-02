-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Ago-2021 às 05:44
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliaria`
--
CREATE DATABASE IF NOT EXISTS `imobiliaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `imobiliaria`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia_bancariacorretor`
--

DROP TABLE IF EXISTS `agencia_bancariacorretor`;
CREATE TABLE `agencia_bancariacorretor` (
  `banco` varchar(40) NOT NULL,
  `agenciaCorretor` int(6) NOT NULL,
  `contaCorretor` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agencia_bancariacorretor`
--

INSERT INTO `agencia_bancariacorretor` (`banco`, `agenciaCorretor`, `contaCorretor`) VALUES
('Banco do Brasil', 102301, 106895245),
('Santander', 200125, 136588954),
('Banco do Brasil', 236589, 236598745),
('Santander', 236986, 455698997),
('Banco do Brasil', 236987, 111256698),
('Santander', 256987, 202369241),
('Banco do Brasil', 336985, 122336985),
('Banco do Brasil', 475892, 121415697),
('Banco do Brasil', 566998, 574875965),
('Caixa Econômica', 569876, 256987459),
('Caixa Econômica', 585452, 226684759),
('Caixa Econômica', 656891, 575984625),
('Santander', 698569, 125669874),
('Santander', 879586, 458975697),
('Caixa Econômica', 985687, 556698742);

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia_bancariaproprietario`
--

DROP TABLE IF EXISTS `agencia_bancariaproprietario`;
CREATE TABLE `agencia_bancariaproprietario` (
  `banco` varchar(40) NOT NULL,
  `agenciaProprietario` int(6) NOT NULL,
  `contaProprietario` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agencia_bancariaproprietario`
--

INSERT INTO `agencia_bancariaproprietario` (`banco`, `agenciaProprietario`, `contaProprietario`) VALUES
('Caixa Econômica', 110023, 332549789),
('Caixa Econômica', 114478, 659521523),
('Santander', 121214, 568748952),
('Santander', 202123, 589562125),
('Caixa Econômica', 214785, 251659859),
('Banco do Brasil', 233659, 122323651),
('Banco do Brasil', 235689, 256896549),
('Santander', 235874, 579845254),
('Caixa Econômica', 235985, 215498568),
('Banco do Brasil', 252648, 745895623),
('Santander', 256987, 252624825),
('Banco do Brasil', 471598, 525889465),
('Banco do Brasil', 585698, 989596245),
('Banco do Brasil', 596895, 122336542),
('Santander', 878952, 325487952);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cep_cidadecliente`
--

DROP TABLE IF EXISTS `cep_cidadecliente`;
CREATE TABLE `cep_cidadecliente` (
  `cep` int(8) NOT NULL,
  `cidade` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cep_cidadecliente`
--

INSERT INTO `cep_cidadecliente` (`cep`, `cidade`) VALUES
(11202009, 'Araraquara'),
(11395763, 'Araraquara'),
(11450694, 'Araraquara'),
(11764434, 'Araraquara'),
(13445674, 'Marília'),
(13459456, 'Marília'),
(13840237, 'Marília'),
(14098887, 'Campinas'),
(14200989, 'Campinas'),
(14237786, 'Campinas'),
(14299457, 'Campinas'),
(14984567, 'Campinas'),
(16733745, 'São Carlos'),
(17024843, 'Bauru'),
(17098987, 'Bauru'),
(17462881, 'Bauru'),
(17545533, 'Bauru'),
(17598450, 'Bauru'),
(17834675, 'Bauru'),
(17879654, 'Bauru'),
(17890345, 'Bauru');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cep_cidadecorretor`
--

DROP TABLE IF EXISTS `cep_cidadecorretor`;
CREATE TABLE `cep_cidadecorretor` (
  `cep` int(8) NOT NULL,
  `cidade` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cep_cidadecorretor`
--

INSERT INTO `cep_cidadecorretor` (`cep`, `cidade`) VALUES
(11036987, 'Araraquara'),
(12036987, 'Assis'),
(13026892, 'Marília'),
(13968245, 'Marília'),
(14036587, 'Campinas'),
(14259784, 'Campinas'),
(14985675, 'Campinas'),
(15698532, 'São José dos Campos'),
(16235698, 'São Carlos'),
(17052987, 'Bauru'),
(17058943, 'Bauru'),
(17340000, 'Bauru'),
(17598643, 'Bauru'),
(18524782, 'Sorocaba'),
(19256846, 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cep_cidadeimovel`
--

DROP TABLE IF EXISTS `cep_cidadeimovel`;
CREATE TABLE `cep_cidadeimovel` (
  `cep` int(8) NOT NULL,
  `cidade` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cep_cidadeimovel`
--

INSERT INTO `cep_cidadeimovel` (`cep`, `cidade`) VALUES
(11057378, 'Araraquara'),
(11099954, 'Araraquara'),
(11563207, 'Araraquara'),
(11783462, 'Araraquara'),
(11787741, 'Araraquara'),
(11835629, 'Araraquara'),
(11907651, 'Araraquara'),
(11924781, 'Araraquara'),
(13094782, 'Marília'),
(13096677, 'Marília'),
(13209387, 'Marília'),
(13243548, 'Marília'),
(13622211, 'Marília'),
(14034719, 'Campinas'),
(14296734, 'Campinas'),
(14569876, 'Campinas'),
(14905632, 'Campinas'),
(17390176, 'Bauru'),
(17453287, 'Bauru'),
(17653294, 'Bauru'),
(17854422, 'Bauru'),
(17885433, 'Bauru'),
(17893350, 'Bauru'),
(17906589, 'Bauru'),
(17927471, 'Bauru'),
(17987601, 'Bauru');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cep_cidadeproprietario`
--

DROP TABLE IF EXISTS `cep_cidadeproprietario`;
CREATE TABLE `cep_cidadeproprietario` (
  `cep` int(8) NOT NULL,
  `cidade` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cep_cidadeproprietario`
--

INSERT INTO `cep_cidadeproprietario` (`cep`, `cidade`) VALUES
(12058947, 'Assis'),
(13698547, 'Marília'),
(13789542, 'Marília'),
(14025998, 'Campinas'),
(14203548, 'Campinas'),
(14256872, 'Campinas'),
(14582658, 'Campinas'),
(16058749, 'São Carlos'),
(16859746, 'São Carlos'),
(16985249, 'São Carlos'),
(17025689, 'Bauru'),
(17025698, 'Bauru'),
(17045986, 'Bauru'),
(17598635, 'Bauru'),
(17598649, 'Bauru');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `estadoCivil` varchar(40) NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `profissao` varchar(40) NOT NULL,
  `dataCadastro` date NOT NULL,
  `endBairro` varchar(40) DEFAULT NULL,
  `endRua` varchar(40) DEFAULT NULL,
  `endNum` int(5) DEFAULT NULL,
  `cep` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `sexo`, `dataNascimento`, `email`, `estadoCivil`, `salario`, `profissao`, `dataCadastro`, `endBairro`, `endRua`, `endNum`, `cep`) VALUES
(12438523987, 'Aline Fernandes', 'F', '1990-10-11', 'alinefernandes@gmail. com', 'Casado(a)', '2900.00', 'Professora de Dança', '2019-10-11', 'Jardim São João', 'Rio Branco', 111, 14200989),
(12484841654, 'Fernando Rodrigues', 'M', '2000-10-24', 'fernandorodrigues@gmail.com', 'Solteiro(a)', '5500.00', 'Engenheiro Mecânico', '2021-07-23', 'Jardim Ipê', 'Cataratas', 112, 13445674),
(23589742589, 'Vitor Aparecido', 'M', '1988-09-21', 'vitoraparecido@gmail.com', 'Divorciado(a)', '3000.00', 'Motorista Particular', '2019-05-30', 'Vila Bauru', 'Vania Maria', 1465, 14237786),
(25495625236, 'Angelica Duarte', 'F', '1998-04-14', 'angelicaduarte@gmail.com', 'Solteiro(a)', '2500.00', 'Enfermeira', '2021-05-06', 'Jardim Brasil', 'Bahia', 514, 17024843),
(25689945985, 'Hugo Camargo', 'M', '1986-08-24', 'hugocamargo@gmail.com', 'Solteiro(a)', '2300.00', 'Técnico em Eletrônica', '2020-01-31', 'Jardim Dourado', 'Avenida Brasil', 456, 17879654),
(25968952012, 'Breno Figueiredo', 'M', '1996-06-04', 'brunofigueiredo@gmail.com', 'Casado(a)', '5600.00', 'Engenheiro Elétrico', '2020-02-03', 'Jardim São Paulo', 'Cerejeiras', 123, 14984567),
(25974259855, 'Victor Lacerda', 'M', '1972-12-14', 'victorlacerda@gmail.com', 'Divorciado(a)', '2300.00', 'Personal Trainer', '2021-04-04', 'Jardim Caravelas', 'Sete de Setembro', 776, 16733745),
(25986957592, 'Luciana Nunes', 'F', '2000-07-21', 'luciananunes@gmail.com', 'Solteiro(a)', '2450.00', 'Professora de Natação', '2021-07-30', 'Jardim Bela Vista', 'Nuno de Assis', 909, 11202009),
(28945848959, 'Edgar Smith', 'M', '1994-09-25', 'edgarsmith@gmail.com', 'Casado(a)', '4500.00', 'Engenheiro Cívil', '2019-06-05', 'Jardim Nelson', 'Sete de Outubro', 456, 17834675),
(41257569887, 'Fernanda Carvalho', 'F', '1974-03-21', 'fercarvalho@gmail.com', 'Divorciado(a)', '2010.00', 'Pintora', '2020-03-19', 'Vila Abreu', 'Dionísio Albuquerque', 320, 11764434),
(48884848498, 'Sabrina Maia', 'F', '1991-05-07', 'sabrinamaia@gmail.com', 'Casado(a)', '3500.00', 'Dentista', '2021-06-02', 'Vila Pantanal', 'Avenida Augustas', 265, 11395763),
(52648484851, 'Claudia Pereira', 'F', '1990-05-07', 'claudiapereira@gmail.com', 'Solteiro(a)', '4560.00', 'Escritora', '2020-12-12', 'Vila industrial', 'Jaboticabal', 379, 17098987),
(58975984662, 'Juliano Assis', 'M', '1988-09-17', 'julianoassis@gmail.com', 'Casado(a)', '4500.00', 'Professor', '2020-06-12', 'Jardim Margarida', 'Antônio Alves', 4567, 17890345),
(59859595182, 'Thiago Raia', 'M', '1978-02-06', 'thiagoraia@gmail.com', 'Casado(a)', '2500.00', 'Jornalista', '2020-05-26', 'Jardim Venusta', 'Vargas Filho', 234, 17462881),
(69859841595, 'Aparecido Silva', 'M', '1987-10-05', 'aparecidosilva@gmail.com', 'Viúvo(a)', '5780.00', 'Empresário', '2019-12-07', 'Jardim Melancia', 'São Pedro', 456, 13840237),
(78632597258, 'Luana Santana', 'F', '1991-04-23', 'luanasantana@gmail.com', 'Casado(a)', '2000.00', 'Secretária', '2019-06-08', 'Vila Natal', 'Avenida João Ribeiro', 344, 14098887),
(78942265223, 'Eliana Juarez', 'F', '1998-01-23', 'elianajuarez@gmail.com', 'Divorciado(a)', '6800.00', 'Dermatologista', '2020-10-14', 'Vila Industrial', 'Filgueiras', 145, 17598450),
(84848484812, 'Nadia Malik', 'F', '1992-05-03', 'nadiamalik@gmail.com', 'Solteiro(a)', '3400.00', 'Esteticista', '2021-07-04', 'Núcleo Solange', 'Isaac Newton', 456, 17545533),
(98584848484, 'Flavio Boa Vista', 'M', '1998-07-28', 'favioboavista@gmail.com', 'Solteiro(a)', '3000.00', 'Enfermeiro', '2020-04-18', 'Vila Abreu', 'Rio Branco', 870, 11450694),
(98595845154, 'Yasmin Marques', 'F', '1992-03-25', 'yasminmarques@gmail.com', 'Casado(a)', '7680.00', 'Médica', '2020-07-04', 'Nùcleo Jabuti', 'Américas', 674, 13459456),
(98756484112, 'Cristiane Oliveira', 'F', '1996-07-20', 'crisoliveira@gmail.com', 'Divorciado(a)', '3500.00', 'Pianista', '2020-07-31', 'Jardim Angico', 'Flavio Ricardo', 345, 14299457);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

DROP TABLE IF EXISTS `contrato`;
CREATE TABLE `contrato` (
  `codigo` int(9) NOT NULL,
  `dataVencimento` date NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFinal` date NOT NULL,
  `valorAluguel` decimal(7,2) NOT NULL,
  `formaPagamento` varchar(40) NOT NULL,
  `avaliacao` decimal(2,1) NOT NULL,
  `cpfCliente` bigint(20) NOT NULL,
  `cpfProprietario` bigint(20) NOT NULL,
  `cpfCorretor` bigint(20) NOT NULL,
  `codigoImovel` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`codigo`, `dataVencimento`, `dataInicio`, `dataFinal`, `valorAluguel`, `formaPagamento`, `avaliacao`, `cpfCliente`, `cpfProprietario`, `cpfCorretor`, `codigoImovel`) VALUES
(1, '2020-09-12', '2020-08-12', '2021-08-12', '1300.00', 'Débito em Conta', '5.0', 69859841595, 23569896571, 23569874521, 2),
(2, '2020-10-10', '2020-09-10', '2021-09-10', '1000.00', 'Boleto Bancário', '5.0', 25689945985, 12598795629, 19989854888, 6),
(3, '2021-04-20', '2021-03-20', '2022-03-20', '1200.00', 'Boleto Bancário', '5.0', 98595845154, 25265489625, 25369857485, 7),
(4, '2020-06-15', '2020-05-15', '2021-05-15', '950.00', 'Boleto Bancário', '4.9', 98584848484, 56895742136, 25636985621, 10),
(5, '2021-08-30', '2021-07-30', '2022-07-30', '1100.00', 'Débito em Conta', '5.0', 48884848498, 58964753256, 12332562102, 11),
(6, '2021-02-10', '2021-01-10', '2022-01-10', '1050.00', 'Débito em Conta', '4.8', 28945848959, 58936512985, 12336987451, 15),
(7, '2020-10-15', '2020-09-15', '2021-09-15', '850.00', 'Cartão de Crédito', '4.7', 52648484851, 24598199156, 47899484505, 21),
(8, '2020-12-05', '2020-11-05', '2021-11-05', '1250.00', 'Débito em Conta', '5.0', 59859595182, 11145879962, 35985628745, 23),
(9, '2021-03-15', '2021-02-15', '2022-02-15', '1000.00', 'Cartão de Crédito', '5.0', 84848484812, 12365987452, 58695765212, 25);

--
-- Acionadores `contrato`
--
DROP TRIGGER IF EXISTS `atualiza_alugado`;
DELIMITER $$
CREATE TRIGGER `atualiza_alugado` AFTER INSERT ON `contrato` FOR EACH ROW BEGIN
UPDATE imovel SET imovel.alugado = '1'WHERE imovel.codigo = NEW.codigoImovel;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `atualiza_alugado_exclui_tabela`;
DELIMITER $$
CREATE TRIGGER `atualiza_alugado_exclui_tabela` AFTER DELETE ON `contrato` FOR EACH ROW BEGIN

UPDATE imovel SET imovel.alugado = '0' WHERE imovel.codigo = OLD.codigoImovel;

END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `atualiza_bonus`;
DELIMITER $$
CREATE TRIGGER `atualiza_bonus` AFTER INSERT ON `contrato` FOR EACH ROW BEGIN 
UPDATE corretor SET corretor.salario = corretor.salario+corretor.salario*corretor.bonus WHERE corretor.cpf = NEW.cpfCorretor;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

DROP TABLE IF EXISTS `corretor`;
CREATE TABLE `corretor` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `dataContratacao` date NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `bonus` float DEFAULT NULL,
  `endBairro` varchar(40) DEFAULT NULL,
  `endRua` varchar(40) DEFAULT NULL,
  `endNum` int(5) DEFAULT NULL,
  `cep` int(8) NOT NULL,
  `agencia` int(6) NOT NULL,
  `conta` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `corretor`
--

INSERT INTO `corretor` (`cpf`, `nome`, `sexo`, `dataNascimento`, `email`, `dataContratacao`, `salario`, `bonus`, `endBairro`, `endRua`, `endNum`, `cep`, `agencia`, `conta`) VALUES
(12332562102, 'Giovana Andrade', 'F', '1982-09-15', 'giovanaandrade@gmail.com', '1999-06-18', '3210.00', 7.5, 'Jardim Nações', 'Santo Antônio', 145, 13026892, 256987, 202369241),
(12336987451, 'Sandro Souza', 'M', '1969-03-01', 'sandrosouza@gmail.com', '1998-08-19', '2900.00', 5.5, 'Jardim Brasil', 'Tiradentes', 269, 12036987, 879586, 458975697),
(19989854888, 'Danilo Castro', 'M', '1976-09-20', 'danilocastro@gmail.com', '2000-11-09', '2900.00', 6, 'Jardim Figueiras', 'Getúlio Vargas', 267, 14036587, 566998, 574875965),
(23569874521, 'Alice Ribeiro', 'F', '1988-05-15', 'aliceribeiro@gmail.com', '2000-08-17', '2500.00', 7.5, 'Vila São Paulo', 'Fernando Figeiras', 178, 17058943, 698569, 125669874),
(23659588781, 'Ricardo Silva', 'M', '1978-11-11', 'ricardosilva@gmail.com', '1999-07-04', '2650.00', 6.8, 'Vila Natal', 'Amazonas', 999, 14985675, 336985, 122336985),
(25253535248, 'Silvana Pereira', 'F', '1976-11-18', 'silvanapereira@gmail.com', '2003-02-21', '2800.00', 5.9, 'Vila Lago Sul', 'Sete de Setembro', 555, 17598643, 236986, 455698997),
(25256666854, 'Vitória Bueno', 'F', '1975-12-13', 'vitoriabueno@gmail.com', '2000-01-16', '3010.00', 4.9, 'Centro', 'Bela Vista', 623, 11036987, 656891, 575984625),
(25369857485, 'Eduarda Costa', 'F', '1969-09-19', 'eduardacosta@gmail.com', '1997-04-17', '3460.15', 5, 'Redentor', 'Dario Castro', 547, 19256846, 102301, 106895245),
(25369874585, 'Helena Messias', 'F', '1974-10-30', 'helenamessias@gmail.com', '2002-02-19', '3520.00', 4.5, 'Cidade Nova Heliópolis', 'Quinte de Novembro', 144, 14259784, 236987, 111256698),
(25636985621, 'Flavia Vargas', 'F', '1968-07-07', 'flaviavargas@gmail.com', '2000-12-03', '3000.00', 7, 'Vila Medeiros', 'São José', 125, 17340000, 569876, 256987459),
(25698741256, 'Júlio Mesquita', 'M', '1977-02-22', 'juliomesquita@gmail.com', '2001-06-14', '2900.00', 8, 'Centro', 'Avenida Brasil', 255, 13968245, 475892, 121415697),
(35985628745, 'Alberto Neves', 'M', '1992-12-23', 'albertonesves@hotmail.com', '2018-07-14', '1590.00', 8, 'Vila Universitária', 'Cerejeiras', 245, 18524782, 236589, 236598745),
(45896859685, 'Camila Rodrigues', 'F', '1977-08-18', 'camilarodrigues@gmail.com', '2003-07-28', '3200.00', 6.5, 'Jardim Cerejeiras', 'Fabio Fernandes', 560, 17052987, 585452, 226684759),
(47899484505, 'Marcelo Prado', 'M', '1973-04-25', 'marceloprado@gmail.com', '1998-03-03', '2560.00', 7.6, 'Jardim Caravelas', 'Santa Luzia', 745, 16235698, 985687, 556698742),
(58695765212, 'Carlos Rodrigo', 'M', '1972-06-30', 'carlosrodrigo@gmail.com', '2001-12-12', '2580.10', 5, 'Vila Guedes', 'Nações Unidades', 140, 15698532, 200125, 136588954);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerencia`
--

DROP TABLE IF EXISTS `gerencia`;
CREATE TABLE `gerencia` (
  `codImovel` int(11) NOT NULL,
  `cpfCorretor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `gerencia`
--

INSERT INTO `gerencia` (`codImovel`, `cpfCorretor`) VALUES
(11, 12332562102),
(12, 12332562102),
(15, 12336987451),
(6, 19989854888),
(1, 23569874521),
(2, 23569874521),
(17, 23659588781),
(18, 23659588781),
(16, 25253535248),
(19, 25256666854),
(20, 25256666854),
(7, 25369857485),
(8, 25369857485),
(14, 25369874585),
(10, 25636985621),
(22, 25636985621),
(13, 25698741256),
(3, 35985628745),
(23, 35985628745),
(4, 45896859685),
(5, 45896859685),
(21, 47899484505),
(26, 47899484505),
(9, 58695765212),
(24, 58695765212),
(25, 58695765212);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

DROP TABLE IF EXISTS `imovel`;
CREATE TABLE `imovel` (
  `codigo` int(6) NOT NULL,
  `tamanho` decimal(5,2) NOT NULL,
  `alugado` tinyint(1) NOT NULL DEFAULT 0,
  `tipo` varchar(40) NOT NULL,
  `endBairro` varchar(40) DEFAULT NULL,
  `endRua` varchar(40) DEFAULT NULL,
  `endNum` int(5) DEFAULT NULL,
  `cep` int(8) DEFAULT NULL,
  `cpfProprietario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`codigo`, `tamanho`, `alugado`, `tipo`, `endBairro`, `endRua`, `endNum`, `cep`, `cpfProprietario`) VALUES
(1, '53.00', 0, 'Kitnet', 'Vila Industrial', 'Cerejeiras', 123, 17987601, 23569896571),
(2, '100.00', 1, 'Casa', 'Jardim Ipê', 'Pedro Pêra', 456, 13243548, 23569896571),
(3, '87.00', 0, 'Apartamento', 'Jardim Angico', 'Manuel Silva', 98, 14569876, 12365987452),
(4, '67.00', 0, 'Apartamento', 'Vila Pequi', 'Francisco Antunes', 649, 11057378, 12598795629),
(5, '98.00', 0, 'Casa', 'Jardim São João', 'Pau Brasil', 657, 14905632, 12598795629),
(6, '76.00', 1, 'Apartamento', 'Núcleo Solange', 'Aparecida de Jesus', 342, 17653294, 12598795629),
(7, '53.00', 1, 'Edícula', 'Jardim Kiara', 'Onofre Castro', 435, 17453287, 25265489625),
(8, '74.00', 0, 'Casa', 'Jardim Venusta', 'Tangarás', 529, 17906589, 25265489625),
(9, '82.00', 0, 'Casa', 'Vila Bauru', 'Alves da Silva', 312, 14296734, 56895742136),
(10, '61.00', 1, 'Kitnet', 'Jardim das Flores', 'Maria Silva', 511, 11835629, 56895742136),
(11, '91.00', 1, 'Casa', 'Vila Abreu', 'Manaus', 312, 11783462, 58964753256),
(12, '54.00', 0, 'Apartamento', 'Vila Boa Vista', 'Cuiabá', 213, 11907651, 58589620220),
(13, '81.00', 0, 'Casa', 'Jardim Brachiaria', 'Gramado', 216, 13094782, 23569865252),
(14, '100.00', 0, 'Casa', 'Vila Andrade', 'Vinicius de Moraes', 515, 11563207, 58936512985),
(15, '71.00', 1, 'Apartamento', 'Núcleo Jabuti', 'Amora', 813, 13209387, 58936512985),
(16, '65.00', 0, 'Kitnet', 'Vila dos Abacates', 'João Bonfim', 678, 14034719, 25222314598),
(17, '74.00', 0, 'Edícula', 'Jardim Dourado', 'Osmar Santos', 451, 17927471, 12230045987),
(18, '66.00', 0, 'Casa', 'Jardim Cerrado', 'Ricardo Sanchez', 112, 17390176, 11145879962),
(19, '87.00', 0, 'Edícula', 'Vila Pantanal', 'Limoeiro', 996, 11924781, 33659874562),
(20, '77.00', 0, 'Kitnet', 'Vila Sapateiro', 'Acerola', 223, 13622211, 24598199156),
(21, '61.00', 1, 'Casa', 'Jardim Melancia', 'Neusa Silva', 445, 13096677, 24598199156),
(22, '79.00', 0, 'Edícula', 'Vila Redentor', 'Mesquita Vargas', 886, 17854422, 14598568795),
(23, '67.00', 1, 'Kitnet', 'Jardim Nelson', 'Roberto Carlos', 435, 17885433, 11145879962),
(24, '99.00', 0, 'Apartamento', 'Vila Salgueiro', 'Mamutes', 768, 11099954, 58964753256),
(25, '61.00', 1, 'Edícula', 'Jardim Margarida', 'Helena Frederica', 331, 17893350, 12365987452),
(26, '79.00', 0, 'Kitnet', 'Vila Madalena', 'Alecrim', 229, 11787741, 12365987452);

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
CREATE TABLE `proprietario` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `endBairro` varchar(40) DEFAULT NULL,
  `endRua` varchar(40) DEFAULT NULL,
  `endNum` int(5) DEFAULT NULL,
  `cep` int(8) NOT NULL,
  `agencia` int(6) NOT NULL,
  `conta` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `proprietario`
--

INSERT INTO `proprietario` (`cpf`, `nome`, `sexo`, `dataNascimento`, `email`, `endBairro`, `endRua`, `endNum`, `cep`, `agencia`, `conta`) VALUES
(11145879962, 'Raissa Assis', 'F', '1987-09-15', 'assisraissa@hotmail.com', 'Vila Boa Vista', 'Nações Unidas', 147, 13698547, 471598, 525889465),
(12230045987, 'Letícia Bueno', 'F', '1992-06-18', 'leticiabueno@hotmail.com', 'Jardim das Flores', 'Avenida Brasil', 259, 16985249, 121214, 568748952),
(12365987452, 'Márcia Genis', 'F', '1987-08-02', 'marciagenis@gmail.com', 'Vila Universitária', 'Rodigues Alves', 1407, 17598635, 110023, 332549789),
(12598795629, 'Bianca Freire', 'F', '2000-05-28', 'biancafreire@gmail.com', 'Vila Natal', 'Rua Sete de Setembro', 458, 14025998, 256987, 252624825),
(14598568795, 'Olivia Silvani', 'F', '2000-02-14', 'oliviasilvani@gmail.com', 'Jardim Kiara', 'Alberto Alves', 574, 14256872, 214785, 251659859),
(23569865252, 'Marcos Sousa', 'M', '1994-12-11', 'marcossousa@gmail.com', 'Cidade Nova Heliópolis', 'Julio Mesquita', 458, 14582658, 235874, 579845254),
(23569896571, 'André Pereira', 'M', '1991-08-14', 'andrepereira@gmail.com', 'Jardim Nações', 'Getulio Vargas', 125, 17045986, 233659, 122323651),
(24598199156, 'Paulo Mineiro', 'M', '1989-10-01', 'paulomineiro@hotmail.com', 'Vila Bauru', 'Luana Beiramar', 1478, 16058749, 235689, 256896549),
(25222314598, 'Pamela Castro', 'F', '1988-07-28', 'pamelacastro@hotmail.com', 'Jardim Cerejeiras', 'Rio Doce', 1522, 17025689, 235985, 215498568),
(25265489625, 'Daniel Silva', 'M', '1998-04-18', 'danielsilva@gmail.com', 'Jardim Brasil', 'Fernandes Alberto', 578, 12058947, 596895, 122336542),
(33659874562, 'Clarisse Vieira', 'F', '1999-12-31', 'clarissevieira@hotmail.com', 'Vila Pequi', 'Manaus', 541, 14203548, 878952, 325487952),
(56895742136, 'Lucas Lima', 'M', '1985-03-20', 'lima@gmail.com', 'Jardim Caravelas', 'Avenida Nações', 587, 16859746, 585698, 989596245),
(58589620220, 'Julia Jean', 'F', '1977-05-10', 'juliajenis@gmail.com', 'Vila Lago Sul', 'Tiradentes', 568, 17598649, 114478, 659521523),
(58936512985, 'Bruno Silva', 'M', '1995-10-15', 'brunosilva@hotmail.com', 'Vila São Paulo', 'Doze de Novembro', 587, 17025698, 252648, 745895623),
(58964753256, 'Lilian Andrade', 'F', '1992-03-07', 'andrade@gmail.com', 'Centro', 'Rio Branco', 1545, 13789542, 202123, 589562125);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefonecliente`
--

DROP TABLE IF EXISTS `telefonecliente`;
CREATE TABLE `telefonecliente` (
  `numero` bigint(12) NOT NULL,
  `cpfCliente` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefonecliente`
--

INSERT INTO `telefonecliente` (`numero`, `cpfCliente`) VALUES
(11900233765, 58975984662),
(11912314263, 28945848959),
(11938471839, 28945848959),
(11991663451, 25689945985),
(12912238716, 98595845154),
(12936519384, 59859595182),
(12937615534, 78632597258),
(12937765102, 69859841595),
(12946773819, 25495625236),
(12982221923, 98756484112),
(12993234736, 25968952012),
(13937712243, 25968952012),
(13981726354, 98584848484),
(13992346752, 41257569887),
(14906519283, 12484841654),
(14928234671, 25689945985),
(14933997361, 98756484112),
(14937462913, 25495625236),
(14943769183, 84848484812),
(14955412321, 69859841595),
(14965473829, 28945848959),
(14981726453, 23589742589),
(14991768371, 25968952012),
(14992846573, 23589742589),
(15937163562, 25974259855),
(15938765563, 78942265223),
(15944529384, 98756484112),
(15955466381, 25986957592),
(15971540391, 12438523987),
(15982736455, 52648484851),
(16910293847, 48884848498),
(16937465512, 78632597258),
(16967501823, 84848484812),
(16967541028, 12438523987),
(16987367192, 52648484851),
(17937162536, 12484841654);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefonecorretor`
--

DROP TABLE IF EXISTS `telefonecorretor`;
CREATE TABLE `telefonecorretor` (
  `numero` bigint(12) NOT NULL,
  `cpfCorretor` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefonecorretor`
--

INSERT INTO `telefonecorretor` (`numero`, `cpfCorretor`) VALUES
(11901223781, 25253535248),
(11955468765, 25253535248),
(11986543891, 35985628745),
(11995869523, 23569874521),
(12965330981, 23659588781),
(12974432178, 45896859685),
(12976481234, 23659588781),
(12981763646, 25698741256),
(13965422349, 25636985621),
(13983716382, 25369874585),
(14901763398, 58695765212),
(14910988456, 12336987451),
(14912245339, 25256666854),
(14933176554, 25636985621),
(14944398765, 25636985621),
(14964311298, 12332562102),
(14974833650, 25256666854),
(14988762344, 25369857485),
(14994562176, 35985628745),
(15917367701, 47899484505),
(15933581704, 12332562102),
(16963920191, 47899484505),
(16987223571, 25369857485),
(17976554098, 19989854888);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefoneproprietario`
--

DROP TABLE IF EXISTS `telefoneproprietario`;
CREATE TABLE `telefoneproprietario` (
  `numero` bigint(12) NOT NULL,
  `cpfProprietario` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefoneproprietario`
--

INSERT INTO `telefoneproprietario` (`numero`, `cpfProprietario`) VALUES
(11944511009, 11145879962),
(11973716653, 12365987452),
(11992837445, 33659874562),
(12944110287, 24598199156),
(12991836718, 14598568795),
(13954661249, 14598568795),
(13955401827, 58936512985),
(13983716526, 23569896571),
(14920192817, 58964753256),
(14926726333, 23569865252),
(14933182091, 58589620220),
(14938277611, 24598199156),
(14955628172, 12598795629),
(14965675190, 33659874562),
(14981777642, 12598795629),
(14982762847, 23569896571),
(14983321872, 12598795629),
(14991726172, 12230045987),
(15900341562, 25222314598),
(15918273177, 56895742136),
(15937771839, 25265489625),
(15973610293, 23569865252),
(16937725661, 25265489625),
(16944320192, 58589620220),
(16981724531, 11145879962);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia_bancariacorretor`
--
ALTER TABLE `agencia_bancariacorretor`
  ADD PRIMARY KEY (`agenciaCorretor`),
  ADD UNIQUE KEY `contaCorretor` (`contaCorretor`);

--
-- Índices para tabela `agencia_bancariaproprietario`
--
ALTER TABLE `agencia_bancariaproprietario`
  ADD PRIMARY KEY (`agenciaProprietario`),
  ADD UNIQUE KEY `contaProprietario` (`contaProprietario`);

--
-- Índices para tabela `cep_cidadecliente`
--
ALTER TABLE `cep_cidadecliente`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `cep_cidadecorretor`
--
ALTER TABLE `cep_cidadecorretor`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `cep_cidadeimovel`
--
ALTER TABLE `cep_cidadeimovel`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `cep_cidadeproprietario`
--
ALTER TABLE `cep_cidadeproprietario`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `FK_cidadeCliente` (`cep`);

--
-- Índices para tabela `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`codigo`,`dataInicio`,`dataFinal`),
  ADD KEY `FK_cpfClienteContrato` (`cpfCliente`),
  ADD KEY `FK_cpfProprietarioContrato` (`cpfProprietario`),
  ADD KEY `FK_cpfCorretorContrato` (`cpfCorretor`),
  ADD KEY `FK_codigoImovelContrato` (`codigoImovel`);

--
-- Índices para tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `FK_cidadeCorretor` (`cep`),
  ADD KEY `FK_agenciaCorretor` (`agencia`),
  ADD KEY `FK_contaCorretor` (`conta`);

--
-- Índices para tabela `gerencia`
--
ALTER TABLE `gerencia`
  ADD PRIMARY KEY (`cpfCorretor`,`codImovel`),
  ADD KEY `FK_codImovelGerencia` (`codImovel`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `FK_cidadeImovel` (`cep`),
  ADD KEY `FK_cpfProprietarioImovel` (`cpfProprietario`);

--
-- Índices para tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `FK_cidadeProprietario` (`cep`),
  ADD KEY `FK_agenciaProprietario` (`agencia`),
  ADD KEY `FK_contaProprietario` (`conta`);

--
-- Índices para tabela `telefonecliente`
--
ALTER TABLE `telefonecliente`
  ADD PRIMARY KEY (`numero`,`cpfCliente`),
  ADD KEY `FK_cpfCliente` (`cpfCliente`);

--
-- Índices para tabela `telefonecorretor`
--
ALTER TABLE `telefonecorretor`
  ADD PRIMARY KEY (`numero`,`cpfCorretor`),
  ADD KEY `FK_cpfCorretor` (`cpfCorretor`);

--
-- Índices para tabela `telefoneproprietario`
--
ALTER TABLE `telefoneproprietario`
  ADD PRIMARY KEY (`numero`,`cpfProprietario`),
  ADD KEY `FK_cpfProprietario` (`cpfProprietario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contrato`
--
ALTER TABLE `contrato`
  MODIFY `codigo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `codigo` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cidadeCliente` FOREIGN KEY (`cep`) REFERENCES `cep_cidadecliente` (`cep`);

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `FK_codigoImovelContrato` FOREIGN KEY (`codigoImovel`) REFERENCES `imovel` (`codigo`),
  ADD CONSTRAINT `FK_cpfClienteContrato` FOREIGN KEY (`cpfCliente`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `FK_cpfCorretorContrato` FOREIGN KEY (`cpfCorretor`) REFERENCES `corretor` (`cpf`),
  ADD CONSTRAINT `FK_cpfProprietarioContrato` FOREIGN KEY (`cpfProprietario`) REFERENCES `proprietario` (`cpf`);

--
-- Limitadores para a tabela `corretor`
--
ALTER TABLE `corretor`
  ADD CONSTRAINT `FK_agenciaCorretor` FOREIGN KEY (`agencia`) REFERENCES `agencia_bancariacorretor` (`agenciaCorretor`),
  ADD CONSTRAINT `FK_cidadeCorretor` FOREIGN KEY (`cep`) REFERENCES `cep_cidadecorretor` (`cep`),
  ADD CONSTRAINT `FK_contaCorretor` FOREIGN KEY (`conta`) REFERENCES `agencia_bancariacorretor` (`contaCorretor`);

--
-- Limitadores para a tabela `gerencia`
--
ALTER TABLE `gerencia`
  ADD CONSTRAINT `FK_codImovelGerencia` FOREIGN KEY (`codImovel`) REFERENCES `imovel` (`codigo`),
  ADD CONSTRAINT `FK_cpfCorretorGerencia` FOREIGN KEY (`cpfCorretor`) REFERENCES `corretor` (`cpf`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `FK_cidadeImovel` FOREIGN KEY (`cep`) REFERENCES `cep_cidadeimovel` (`cep`),
  ADD CONSTRAINT `FK_cpfProprietarioImovel` FOREIGN KEY (`cpfProprietario`) REFERENCES `proprietario` (`cpf`);

--
-- Limitadores para a tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD CONSTRAINT `FK_agenciaProprietario` FOREIGN KEY (`agencia`) REFERENCES `agencia_bancariaproprietario` (`agenciaProprietario`),
  ADD CONSTRAINT `FK_cidadeProprietario` FOREIGN KEY (`cep`) REFERENCES `cep_cidadeproprietario` (`cep`),
  ADD CONSTRAINT `FK_contaProprietario` FOREIGN KEY (`conta`) REFERENCES `agencia_bancariaproprietario` (`contaProprietario`);

--
-- Limitadores para a tabela `telefonecliente`
--
ALTER TABLE `telefonecliente`
  ADD CONSTRAINT `FK_cpfCliente` FOREIGN KEY (`cpfCliente`) REFERENCES `cliente` (`cpf`);

--
-- Limitadores para a tabela `telefonecorretor`
--
ALTER TABLE `telefonecorretor`
  ADD CONSTRAINT `FK_cpfCorretor` FOREIGN KEY (`cpfCorretor`) REFERENCES `corretor` (`cpf`);

--
-- Limitadores para a tabela `telefoneproprietario`
--
ALTER TABLE `telefoneproprietario`
  ADD CONSTRAINT `FK_cpfProprietario` FOREIGN KEY (`cpfProprietario`) REFERENCES `proprietario` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
