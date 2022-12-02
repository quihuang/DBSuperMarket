
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema supermercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `supermercado` DEFAULT CHARACTER SET utf8 ;
USE `supermercado` ;

-- -----------------------------------------------------
-- Table `supermercado`.`tb_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calle_carrera` VARCHAR(50) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `barrio` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nit` VARCHAR(15) NOT NULL,
  `razon_social` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `correo_electronico` VARCHAR(100) NOT NULL,
  `representante_legal` VARCHAR(45) NOT NULL,
  `sitio_web` VARCHAR(45) NOT NULL,
  `tb_direccion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_proveedor_tb_direccion_idx` (`tb_direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_proveedor_tb_direccion`
    FOREIGN KEY (`tb_direccion_id`)
    REFERENCES `supermercado`.`tb_direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_categoria_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_categoria_producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripción` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio_actual` INT NOT NULL,
  `existencia` VARCHAR(45) NOT NULL,
  `tb_proveedor_id` INT NOT NULL,
  `tb_categoria_producto_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_producto_tb_proveedor1_idx` (`tb_proveedor_id` ASC) VISIBLE,
  INDEX `fk_tb_producto_tb_categoria_producto1_idx` (`tb_categoria_producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_producto_tb_proveedor1`
    FOREIGN KEY (`tb_proveedor_id`)
    REFERENCES `supermercado`.`tb_proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_producto_tb_categoria_producto1`
    FOREIGN KEY (`tb_categoria_producto_id`)
    REFERENCES `supermercado`.`tb_categoria_producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_cliente` (
  `numero_documento` VARCHAR(50) NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `tb_direccion_id` INT NOT NULL,
  PRIMARY KEY (`numero_documento`),
  INDEX `fk_tb_cliente_tb_direccion1_idx` (`tb_direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cliente_tb_direccion1`
    FOREIGN KEY (`tb_direccion_id`)
    REFERENCES `supermercado`.`tb_direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_telefono` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_telefono` VARCHAR(45) NULL,
  `numero_documento_cliente` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_telefono_tb_cliente1_idx` (`numero_documento_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_tb_telefono_tb_cliente1`
    FOREIGN KEY (`numero_documento_cliente`)
    REFERENCES `supermercado`.`tb_cliente` (`numero_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_tipo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_tipo_pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago` VARCHAR(45) NOT NULL,
  `interes` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `valor_descuento` INT ZEROFILL NULL,
  `total` INT NOT NULL,
  `numero_documento_cliente` VARCHAR(50) NOT NULL,
  `tipo_pago_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_venta_tb_cliente1_idx` (`numero_documento_cliente` ASC) VISIBLE,
  INDEX `fk_tb_venta_tb_tipo_pago1_idx` (`tipo_pago_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_venta_tb_cliente1`
    FOREIGN KEY (`numero_documento_cliente`)
    REFERENCES `supermercado`.`tb_cliente` (`numero_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_venta_tb_tipo_pago1`
    FOREIGN KEY (`tipo_pago_id`)
    REFERENCES `supermercado`.`tb_tipo_pago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supermercado`.`tb_producto_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`tb_producto_venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `producto_id` INT NOT NULL,
  `venta_id` INT NOT NULL,
  PRIMARY KEY (`id`, `producto_id`, `venta_id`),
  INDEX `fk_tb_producto_has_tb_venta_tb_venta1_idx` (`venta_id` ASC) VISIBLE,
  INDEX `fk_tb_producto_has_tb_venta_tb_producto1_idx` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_producto_has_tb_venta_tb_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `supermercado`.`tb_producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_producto_has_tb_venta_tb_venta1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `supermercado`.`tb_venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
