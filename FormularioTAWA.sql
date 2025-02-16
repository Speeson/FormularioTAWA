-- MySQL Script generated by MySQL Workbench
-- Sun Feb 16 03:30:21 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`provincia` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`solicitud` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `provincia_id_provincia` INT NOT NULL,
  `departamento_id_departamento` INT NOT NULL,
  `fecha` DATETIME NULL,
  `entrevistador` VARCHAR(45) NOT NULL,
  `firma` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `cargopostula` VARCHAR(45) NOT NULL,
  `areasinteres` VARCHAR(45) NULL,
  `edad` INT(3) NOT NULL,
  `fecha_nac` DATE NOT NULL,
  `lugar_nac` VARCHAR(45) NULL,
  `estadocivil` VARCHAR(45) NULL,
  `afp` VARCHAR(45) NULL,
  `email1` VARCHAR(45) NOT NULL,
  `email2` VARCHAR(45) NULL,
  `telefono` INT(9) NULL,
  `celular` INT(9) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `distrito` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_persona`),
  INDEX `fk_solicitud_provincia1_idx` (`provincia_id_provincia` ASC) VISIBLE,
  INDEX `fk_solicitud_departamento1_idx` (`departamento_id_departamento` ASC) VISIBLE,
  CONSTRAINT `fk_solicitud_provincia1`
    FOREIGN KEY (`provincia_id_provincia`)
    REFERENCES `mydb`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_departamento1`
    FOREIGN KEY (`departamento_id_departamento`)
    REFERENCES `mydb`.`departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`nivel_estudios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nivel_estudios` (
  `id_nivelestudios` INT NOT NULL AUTO_INCREMENT,
  `nivelestudios` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_nivelestudios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`relacion_familiar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`relacion_familiar` (
  `id_relacionfamiliar` INT NOT NULL AUTO_INCREMENT,
  `relacionfamiliar` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_relacionfamiliar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidad` (
  `id_habilidad` INT NOT NULL AUTO_INCREMENT,
  `habilidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_habilidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`nivel_habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nivel_habilidad` (
  `id_nivelhabilidad` INT NOT NULL AUTO_INCREMENT,
  `nivelhabilidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_nivelhabilidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_empresa` (
  `id_tipoempresa` INT NOT NULL AUTO_INCREMENT,
  `tipoempresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipoempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_empleado` (
  `id_tipoempleado` INT NOT NULL AUTO_INCREMENT,
  `tipoempleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipoempleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`relacion_familiar_pers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`relacion_familiar_pers` (
  `solicitud_id_persona` INT NOT NULL,
  `relacion_familiar_id_relacionfamiliar` INT NOT NULL,
  `nombrefamiliar` VARCHAR(45) NOT NULL,
  `edadfamiliar` INT(3) NULL,
  `ocupacionfamiliar` VARCHAR(45) NULL,
  PRIMARY KEY (`solicitud_id_persona`, `relacion_familiar_id_relacionfamiliar`),
  INDEX `fk_solicitud_has_relacion_familiar_relacion_familiar1_idx` (`relacion_familiar_id_relacionfamiliar` ASC) VISIBLE,
  INDEX `fk_solicitud_has_relacion_familiar_solicitud_idx` (`solicitud_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_solicitud_has_relacion_familiar_solicitud`
    FOREIGN KEY (`solicitud_id_persona`)
    REFERENCES `mydb`.`solicitud` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_has_relacion_familiar_relacion_familiar1`
    FOREIGN KEY (`relacion_familiar_id_relacionfamiliar`)
    REFERENCES `mydb`.`relacion_familiar` (`id_relacionfamiliar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`habilidad_pers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidad_pers` (
  `solicitud_id_persona` INT NOT NULL,
  `nivel_habilidad_id_nivelhabilidad` INT NOT NULL,
  `habilidad_id_habilidad` INT NOT NULL,
  PRIMARY KEY (`solicitud_id_persona`, `habilidad_id_habilidad`),
  INDEX `fk_solicitud_has_nivel_habilidad_nivel_habilidad1_idx` (`nivel_habilidad_id_nivelhabilidad` ASC) VISIBLE,
  INDEX `fk_solicitud_has_nivel_habilidad_solicitud1_idx` (`solicitud_id_persona` ASC) VISIBLE,
  INDEX `fk_solicitud_has_nivel_habilidad_habilidad1_idx` (`habilidad_id_habilidad` ASC) VISIBLE,
  CONSTRAINT `fk_solicitud_has_nivel_habilidad_solicitud1`
    FOREIGN KEY (`solicitud_id_persona`)
    REFERENCES `mydb`.`solicitud` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_has_nivel_habilidad_nivel_habilidad1`
    FOREIGN KEY (`nivel_habilidad_id_nivelhabilidad`)
    REFERENCES `mydb`.`nivel_habilidad` (`id_nivelhabilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_has_nivel_habilidad_habilidad1`
    FOREIGN KEY (`habilidad_id_habilidad`)
    REFERENCES `mydb`.`habilidad` (`id_habilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`exp_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exp_laboral` (
  `solicitud_id_persona` INT NOT NULL,
  `tipo_empresa_id_tipoempresa` INT NOT NULL,
  `nombreempresa` VARCHAR(45) NOT NULL,
  `inicioempresa` DATE NULL,
  `retiroempresa` DATE NULL,
  `cargoempresa` VARCHAR(45) NOT NULL,
  `ceseempresa` VARCHAR(45) NOT NULL,
  `nombrejefe` VARCHAR(45) NOT NULL,
  `cargojefe` VARCHAR(45) NOT NULL,
  `telefonoempresa` INT(11) NOT NULL,
  `sueldoempresa` FLOAT NOT NULL,
  `referenciasempresa` VARCHAR(45) NULL,
  `bonos` TINYINT(1) NULL,
  `utilidades` TINYINT(1) NULL,
  `alimentacion` TINYINT(1) NULL,
  `transporte` TINYINT(1) NULL,
  `eps` TINYINT(1) NULL,
  `segurovida` TINYINT(1) NULL,
  PRIMARY KEY (`solicitud_id_persona`, `tipo_empresa_id_tipoempresa`),
  INDEX `fk_solicitud_has_tipo_empresa_tipo_empresa1_idx` (`tipo_empresa_id_tipoempresa` ASC) VISIBLE,
  INDEX `fk_solicitud_has_tipo_empresa_solicitud1_idx` (`solicitud_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_solicitud_has_tipo_empresa_solicitud1`
    FOREIGN KEY (`solicitud_id_persona`)
    REFERENCES `mydb`.`solicitud` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_has_tipo_empresa_tipo_empresa1`
    FOREIGN KEY (`tipo_empresa_id_tipoempresa`)
    REFERENCES `mydb`.`tipo_empresa` (`id_tipoempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ref_laborales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ref_laborales` (
  `solicitud_id_persona` INT NOT NULL,
  `tipo_empleado_id_tipoempleado` INT NOT NULL,
  `nombreempleado` VARCHAR(45) NOT NULL,
  `puestoempleado` VARCHAR(45) NOT NULL,
  `empresaempleado` VARCHAR(45) NOT NULL,
  `telcorreoempleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`solicitud_id_persona`, `tipo_empleado_id_tipoempleado`),
  INDEX `fk_solicitud_has_tipo_empleado_tipo_empleado1_idx` (`tipo_empleado_id_tipoempleado` ASC) VISIBLE,
  INDEX `fk_solicitud_has_tipo_empleado_solicitud1_idx` (`solicitud_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_solicitud_has_tipo_empleado_solicitud1`
    FOREIGN KEY (`solicitud_id_persona`)
    REFERENCES `mydb`.`solicitud` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_has_tipo_empleado_tipo_empleado1`
    FOREIGN KEY (`tipo_empleado_id_tipoempleado`)
    REFERENCES `mydb`.`tipo_empleado` (`id_tipoempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datos_academicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`datos_academicos` (
  `solicitud_id_persona` INT NOT NULL,
  `nivel_estudios_id_nivelestudios` INT NOT NULL,
  `centroestudios` VARCHAR(45) NOT NULL,
  `fechainicio` DATE NULL,
  `fechatermino` DATE NULL,
  `gradoestudios` VARCHAR(45) NOT NULL,
  `profesionestudio` VARCHAR(45) NULL,
  PRIMARY KEY (`solicitud_id_persona`, `nivel_estudios_id_nivelestudios`),
  INDEX `fk_solicitud_has_nivel_estudios_nivel_estudios1_idx` (`nivel_estudios_id_nivelestudios` ASC) VISIBLE,
  INDEX `fk_solicitud_has_nivel_estudios_solicitud1_idx` (`solicitud_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_solicitud_has_nivel_estudios_solicitud1`
    FOREIGN KEY (`solicitud_id_persona`)
    REFERENCES `mydb`.`solicitud` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_has_nivel_estudios_nivel_estudios1`
    FOREIGN KEY (`nivel_estudios_id_nivelestudios`)
    REFERENCES `mydb`.`nivel_estudios` (`id_nivelestudios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
