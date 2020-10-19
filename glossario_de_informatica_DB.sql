/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.0 		*/
/*  Created On : 17-Sep-2020 3:31:25 PM 				*/
/*  DBMS       : MySql 						*/
/* AUTHOR : BENEDITO MOMADE BRAIMO
/* ---------------------------------------------------- */

USE `glossario_de_informatica`
;

SET FOREIGN_KEY_CHECKS=0
; 
/* Drop Tables */

DROP TABLE IF EXISTS `Administrador` CASCADE
;

DROP TABLE IF EXISTS `Busca` CASCADE
;

DROP TABLE IF EXISTS `Entrada` CASCADE
;

DROP TABLE IF EXISTS `Entrada_sugerida` CASCADE
;

DROP TABLE IF EXISTS `Utilizador` CASCADE
;

DROP TABLE IF EXISTS `Alfabeto` CASCADE
;

/* Create Tables */

CREATE TABLE `Alfabeto`
(
	`letra` varchar(1) NULL,
	`letraID` INT NOT NULL ,
	CONSTRAINT `PK_Letra` PRIMARY KEY (`letraID` ASC)
)

;

CREATE TABLE `Administrador`
(
	`Palavrapasse` varchar(0) NULL,
	`AdministradorID` INT NOT NULL,
	CONSTRAINT `PK_Administrador` PRIMARY KEY (`AdministradorID` ASC)
)

;

CREATE TABLE `Busca`
(
	`EntradaID` INT NULL,
	`UtilizadorID` INT NULL
)

;

CREATE TABLE `Entrada`
(
	`EntradaID` INT NOT NULL,
	`letraID` int not null,
	`Termo` varchar(150) NULL,
	`Descricao` text NULL,
	`AdministradorID` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Entrada` PRIMARY KEY (`EntradaID` ASC)
)

;

CREATE TABLE `Entrada_sugerida`
(
	`Palavra` varchar(150) NULL,
	`Valido` varchar(20) NULL default 'Pendente',
	`Entrada_sugeridaID` INT NOT NULL,
	`UtilizadorID` INT NOT NULL,
	CONSTRAINT `PK_Entrada_sugerida` PRIMARY KEY (`Entrada_sugeridaID` ASC)
)

;

CREATE TABLE `Utilizador`
(
	`EnderecoEmail` varchar(0) NULL,
	`NomeUtilizador` VARCHAR(0) NULL,
	`UtilizadorID` INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT `PK_Utilizador` PRIMARY KEY (`UtilizadorID` ASC)
)

;

/* Create Foreign Key Constraints */

ALTER TABLE `Administrador` 
 ADD CONSTRAINT `FK_Administrador_Utilizador`
	FOREIGN KEY (`AdministradorID`) REFERENCES `Utilizador` (`UtilizadorID`) ON DELETE cascade ON UPDATE cascade
;

ALTER TABLE `Busca` 
 ADD CONSTRAINT `FK_busca_Entrada`
	FOREIGN KEY (`EntradaID`) REFERENCES `Entrada` (`EntradaID`) ON DELETE cascade ON UPDATE cascade
;

ALTER TABLE `Busca` 
 ADD CONSTRAINT `FK_busca_Utilizador`
	FOREIGN KEY (`UtilizadorID`) REFERENCES `Utilizador` (`UtilizadorID`) ON DELETE cascade ON UPDATE cascade
;

ALTER TABLE `Entrada` 
 ADD CONSTRAINT `FK_Entrada_Adiciona`
	FOREIGN KEY (`AdministradorID`) REFERENCES `Administrador` (`AdministradorID`) ON DELETE cascade ON UPDATE cascade
;

ALTER TABLE `Entrada` 
 ADD CONSTRAINT `FK_Letra_Entrada`
	FOREIGN KEY (`LetraID`) REFERENCES `Alfabeto` (`LetraID`) ON DELETE cascade ON UPDATE cascade
;

ALTER TABLE `Entrada_sugerida` 
 ADD CONSTRAINT `FK_Entrada_Sugerida_Entrada`
	FOREIGN KEY (`Entrada_sugeridaID`) REFERENCES `Entrada` (`EntradaID`) ON DELETE cascade ON UPDATE cascade
;

ALTER TABLE `Entrada_sugerida` 
 ADD CONSTRAINT `FK_Entrada_Sugerida_sugere`
	FOREIGN KEY (`UtilizadorID`) REFERENCES `Utilizador` (`UtilizadorID`) ON DELETE cascade ON UPDATE cascade
;

SET FOREIGN_KEY_CHECKS=1
; 
