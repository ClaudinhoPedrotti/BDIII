-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14-Ago-2019 às 01:14
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistema_academico_etecia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `cpf` int(10) UNSIGNED NOT NULL,
  `CURSO_código_CURSO` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `endereço` varchar(45) DEFAULT NULL,
  `código_CURSO` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`cpf`, `CURSO_código_CURSO`, `nome`, `endereço`, `código_CURSO`) VALUES
(1, 125, 'Eduardo', 'Rua Afonso', 125),
(2, 126, 'José', 'Rua Aldoro', 126),
(3, 127, 'Fernando', 'Rua Aderin', 127);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `código_CURSO` int(10) UNSIGNED NOT NULL,
  `DEPARTAMENTO_código_DEPARTAMENTO` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `código_DEPARTAMENTO` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`código_CURSO`, `DEPARTAMENTO_código_DEPARTAMENTO`, `nome`, `código_DEPARTAMENTO`) VALUES
(125, 4, 'Bioquimica', 4),
(126, 5, 'Eng Computação', 5),
(127, 6, 'Administração', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `código_DEPARTAMENTO` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`código_DEPARTAMENTO`, `nome`) VALUES
(4, 'Portugues'),
(5, 'Matematica'),
(6, 'Fisica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `código_DISCIPLINA` int(10) UNSIGNED NOT NULL,
  `PROFESSOR_matrícula` int(10) UNSIGNED NOT NULL,
  `ALUNO_cpf` int(10) UNSIGNED NOT NULL,
  `qtda_créditos` int(11) DEFAULT NULL,
  `matrícula` int(10) UNSIGNED DEFAULT NULL,
  `cpf` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`código_DISCIPLINA`, `PROFESSOR_matrícula`, `ALUNO_cpf`, `qtda_créditos`, `matrícula`, `cpf`) VALUES
(1, 1, 1, 100, 1020, 789445),
(2, 2, 3, 101, 1030, 858969),
(3, 3, 3, 105, 1040, 585445);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `matrícula` int(10) UNSIGNED NOT NULL,
  `DEPARTAMENTO_código_DEPARTAMENTO` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `código_DEPARTAMENTO` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`matrícula`, `DEPARTAMENTO_código_DEPARTAMENTO`, `nome`, `código_DEPARTAMENTO`) VALUES
(1, 4, 'Prof Jose', 4),
(2, 5, 'Prof Felipe', 5),
(3, 6, 'Prof Kill', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `ALUNO_FKIndex1` (`CURSO_código_CURSO`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`código_CURSO`),
  ADD KEY `CURSO_FKIndex1` (`DEPARTAMENTO_código_DEPARTAMENTO`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`código_DEPARTAMENTO`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`código_DISCIPLINA`),
  ADD KEY `DISCIPLINA_FKIndex1` (`ALUNO_cpf`),
  ADD KEY `DISCIPLINA_FKIndex2` (`PROFESSOR_matrícula`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`matrícula`),
  ADD KEY `PROFESSOR_FKIndex1` (`DEPARTAMENTO_código_DEPARTAMENTO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `cpf` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `código_CURSO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `código_DEPARTAMENTO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `código_DISCIPLINA` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `matrícula` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
