- MySQL Workbench Forward Engineering

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
  `ugyintezo` VARCHAR(100) NULL,
  `ugyfel_megjegyzes` VARCHAR(255) NULL,
  PRIMARY KEY (`id_ugyfel`));


-- -----------------------------------------------------
-- Table `szerviz_up`.`gepadatok`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`gepadatok` (
  `id_gepadatok` INT NOT NULL AUTO_INCREMENT,
  `ugyfel_adatok_id_ugyfel` INT NOT NULL,
  `eszkoz_azonosito` VARCHAR(155) NULL,
  `eszkoz_fajtaja` VARCHAR(150) NULL,
  `eszkoz_gyarto` VARCHAR(150) NULL,
  `eszkoz_tipusa` VARCHAR(150) NULL,
  `eszkoz_gyari_szama` VARCHAR(155) NULL,
  `tartozekok` VARCHAR(255) NULL,
  `vasarlasi_datuma` DATE NULL,
  `bejelentes_datuma` DATETIME NULL,
  `hatarido_datuma` DATE NULL,
  `elkeszult_datuma` DATETIME NULL,
  `uzembehelyezes_datuma` DATE NULL,
  `kiszallas_datuma` DATETIME NULL,
  `hiba_leirasa` VARCHAR(255) NULL,
  `hibajavitas_leirasa` VARCHAR(255) NULL,
  `javitas_helye` VARCHAR(155) NULL,
  `anyaghiany_adatok` VARCHAR(255) NULL,
  `technikus` VARCHAR(155) NULL,
  `statusz` VARCHAR(155) NULL,
  `eszkoz_megjegyzes` VARCHAR(255) NULL,
  PRIMARY KEY (`id_gepadatok`),
  INDEX `fk_gepadatok_ugyfel_adatok_idx` (`ugyfel_adatok_id_ugyfel` ASC),
  CONSTRAINT `fk_gepadatok_ugyfel_adatok`
    FOREIGN KEY (`ugyfel_adatok_id_ugyfel`)
    REFERENCES `szerviz_up`.`ugyfel_adatok` (`id_ugyfel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `szerviz_up`.`hardver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`hardver` (
  `id_hardver` INT NOT NULL AUTO_INCREMENT,
  `gepadatok_id_hardver` INT NOT NULL,
  `hardver_fajtaja` VARCHAR(155) NULL,
  `hardver_gyarto` VARCHAR(155) NULL,
  `hardver_tipusa` VARCHAR(155) NULL,
  `hardver_megjegyzes` VARCHAR(255) NULL,
  PRIMARY KEY (`id_hardver`),
  INDEX `fk_hardver_gepadatok1_idx` (`gepadatok_id_hardver` ASC),
  CONSTRAINT `fk_hardver_gepadatok1`
    FOREIGN KEY (`gepadatok_id_hardver`)
    REFERENCES `szerviz_up`.`gepadatok` (`id_gepadatok`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `szerviz_up`.`softver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `szerviz_up`.`softver` (
  `id_softver` INT NOT NULL AUTO_INCREMENT,
  `gepadatok_id_softver` INT NOT NULL,
  `softver` VARCHAR(255) NULL,
  `softver_kulcs` VARCHAR(255) NULL,
  `softver_megjegyzes` VARCHAR(255) NULL,
  PRIMARY KEY (`id_softver`),
  INDEX `fk_softver_gepadatok1_idx` (`gepadatok_id_softver` ASC),
  CONSTRAINT `fk_softver_gepadatok1`
    FOREIGN KEY (`gepadatok_id_softver`)
    REFERENCES `szerviz_up`.`gepadatok` (`id_gepadatok`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
