-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/11/2025 às 05:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_reservaquadras`
--
CREATE DATABASE IF NOT EXISTS `bd_reservaquadras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_reservaquadras`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
CREATE TABLE `instituicao` (
  `cod_instituicao` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cep` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `modalidade`
--

DROP TABLE IF EXISTS `modalidade`;
CREATE TABLE `modalidade` (
  `cod_modalidade` int(11) NOT NULL,
  `nome_mod` varchar(50) NOT NULL,
  `descricao_mod` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra`
--

DROP TABLE IF EXISTS `quadra`;
CREATE TABLE `quadra` (
  `cod_quadra` int(11) NOT NULL,
  `nome_quadra` varchar(100) NOT NULL,
  `arquibancada` tinyint(1) NOT NULL,
  `cobertura` tinyint(1) NOT NULL,
  `tamanho` varchar(20) NOT NULL,
  `composicao` varchar(255) NOT NULL,
  `cep` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `valor_hora` decimal(8,2) NOT NULL,
  `cod_instituicao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra_mod`
--

DROP TABLE IF EXISTS `quadra_mod`;
CREATE TABLE `quadra_mod` (
  `cod_quadra` int(11) DEFAULT NULL,
  `cod_modalidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE `reserva` (
  `cod_reserva` int(11) NOT NULL,
  `duracao` decimal(8,2) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_reserva` date NOT NULL,
  `horario_reserva` datetime NOT NULL,
  `cod_quadra` int(11) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `datanasc` date NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cep` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `instituicao`
--
ALTER TABLE `instituicao`
  ADD PRIMARY KEY (`cod_instituicao`);

--
-- Índices de tabela `modalidade`
--
ALTER TABLE `modalidade`
  ADD PRIMARY KEY (`cod_modalidade`);

--
-- Índices de tabela `quadra`
--
ALTER TABLE `quadra`
  ADD PRIMARY KEY (`cod_quadra`),
  ADD KEY `cod_instituicao` (`cod_instituicao`);

--
-- Índices de tabela `quadra_mod`
--
ALTER TABLE `quadra_mod`
  ADD KEY `cod_quadra` (`cod_quadra`),
  ADD KEY `cod_modalidade` (`cod_modalidade`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`cod_reserva`),
  ADD KEY `cod_quadra` (`cod_quadra`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `instituicao`
--
ALTER TABLE `instituicao`
  MODIFY `cod_instituicao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modalidade`
--
ALTER TABLE `modalidade`
  MODIFY `cod_modalidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quadra`
--
ALTER TABLE `quadra`
  MODIFY `cod_quadra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `cod_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `quadra`
--
ALTER TABLE `quadra`
  ADD CONSTRAINT `quadra_ibfk_1` FOREIGN KEY (`cod_instituicao`) REFERENCES `instituicao` (`cod_instituicao`);

--
-- Restrições para tabelas `quadra_mod`
--
ALTER TABLE `quadra_mod`
  ADD CONSTRAINT `quadra_mod_ibfk_1` FOREIGN KEY (`cod_quadra`) REFERENCES `quadra` (`cod_quadra`),
  ADD CONSTRAINT `quadra_mod_ibfk_2` FOREIGN KEY (`cod_modalidade`) REFERENCES `modalidade` (`cod_modalidade`);

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`cod_quadra`) REFERENCES `quadra` (`cod_quadra`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
