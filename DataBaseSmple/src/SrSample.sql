-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema szerviz_up
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema szerviz_up
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `szerviz_up` DEFAULT CHARACTER SET utf8 ;
USE `szerviz_up` ;

-- -----------------------------------------------------
-- Table `szerviz_up`.`ugyfel_adatok`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`ugyfel_adatok` (
  `id_ugyfel` INT NOT NULL AUTO_INCREMENT,
  `ugyfel_azonosito` VARCHAR(155) NULL,
  `cegnev` VARCHAR(255) NULL,
  `ugyfel_nev` VARCHAR(100) NULL,
  `megye` VARCHAR(100) NULL,
  `telepules` VARCHAR(100) NULL,
  `iranyitoszam` INT NULL,
  `cim` VARCHAR(255) NULL,
  `ceg_telefon` VARCHAR(100) NULL,
  `ceg_email` VARCHAR(100) NULL,
  `ugyfel_email` VARCHAR(100) NULL,
  `ugyfel_telefon` VARCHAR(100) NULL,
  `csomag_tipus` VARCHAR(100) NULL,
  `ugyfel_megjegyzes` VARCHAR(255) NULL,
  PRIMARY KEY (`id_ugyfel`));


-- -----------------------------------------------------
-- Table `szerviz_up`.`gepadatok`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`gepadatok` (
  `id_gepadatok` INT NOT NULL AUTO_INCREMENT,
  `ugyfel_adatok_id_ugyfel` INT NOT NULL,
  `eszkoz_azonosito` VARCHAR(155) NULL,
  `ceg_nev_gep` VARCHAR(45) NULL,
  `ugyfél_nev_gep` VARCHAR(45) NULL,
  `eszkoz` VARCHAR(150) NULL,
  `eszkoz_gyarto` VARCHAR(150) NULL,
  `eszkoz_gyari_szama` VARCHAR(155) NULL,
  `javitas_helye` VARCHAR(155) NULL,
  `allapot` VARCHAR(155) NULL,
  `uj_gep` VARCHAR(45) NULL,
  `ugyintezo` VARCHAR(45) NULL,
  `prioritas` VARCHAR(45) NULL,
  `jelszo` VARCHAR(45) NULL,
  `hivatkozasi_szam` VARCHAR(85) NULL,
  `tartozekok` VARCHAR(255) NULL,
  `serules` VARCHAR(255) NULL,
  `hiba_leirasa` VARCHAR(255) NULL,
  `eszkoz_megjegyzes` VARCHAR(255) NULL,
  `vasarlasi_datuma` DATE NULL,
  `bejelentes_datuma` DATE NULL,
  `hatarido_datuma` DATE NULL,
  `kiszallas_datuma` DATE NULL,
  `adatmentes` VARCHAR(45) NULL,
  `softver` VARCHAR(45) NULL,
  `operacios_rendszer` VARCHAR(45) NULL,
  `softver_megjegyzés` VARCHAR(255) NULL,
  `laptop` VARCHAR(10) NULL,
  `haz` VARCHAR(10) NULL,
  `tapegyseg` VARCHAR(10) NULL,
  `processzor` VARCHAR(10) NULL,
  `alaplap` VARCHAR(10) NULL,
  `memoria` VARCHAR(10) NULL,
  `videokartya` VARCHAR(10) NULL,
  `ssd` VARCHAR(10) NULL,
  `meghajto` VARCHAR(10) NULL,
  `hutoventilator` VARCHAR(10) NULL,
  `optikai_meghajto` VARCHAR(10) NULL,
  `bovitokartya` VARCHAR(10) NULL,
  `elkeszult_datuma` DATE NULL,
  `hibajavitas_leirasa` VARCHAR(255) NULL,
  `anyaghiany_adatok` VARCHAR(255) NULL,
  `technikus` VARCHAR(155) NULL,
  PRIMARY KEY (`id_gepadatok`),
  INDEX `fk_gepadatok_ugyfel_adatok_idx` (`ugyfel_adatok_id_ugyfel` ASC),
  CONSTRAINT `fk_gepadatok_ugyfel_adatok`
    FOREIGN KEY (`ugyfel_adatok_id_ugyfel`)
    REFERENCES `szerviz_up`.`ugyfel_adatok` (`id_ugyfel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `szerviz_up`.`raktar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`raktar` (
  `category_id` INT NOT NULL,
  `eszkoznev` VARCHAR(255) NULL,
  `kelte` DATE NULL,
  `eladas_kelte` DATE NULL,
  `mennyiseg` INT NULL,
  `raktaron` INT NULL,
  `leiras` VARCHAR(255) NULL,
  `szamla_azonosito` VARCHAR(255) NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `szerviz_up`.`ugyintezo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`ugyintezo` (
  `idugyintezo` INT NOT NULL AUTO_INCREMENT,
  `ugyintezo_neve` VARCHAR(60) NULL,
  PRIMARY KEY (`idugyintezo`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
