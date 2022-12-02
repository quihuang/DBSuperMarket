/*CRUD proveedor*/

INSERT INTO `supermercado`.`tb_proveedor`
(`id`,`nit`,`razon_social`,`telefono`,`correo_electronico`,`representante_legal`,`sitio_web`,`tb_direccion_id`)
VALUES
(null,'821923432-1','Test SAS','3003003030','Test@nestle.com','Test Test','www.Test.com',10);
select * from tb_proveedor;
select * from tb_proveedor where nit = '821923432-1';
UPDATE tb_proveedor SET razon_social = UPPER(razon_social),correo_electronico = lower(correo_electronico) where id  = 6;
UPDATE tb_proveedor SET razon_social = 'Colgate',correo_electronico = 'colgate@colgate.com' where id  = 6;
DELETE FROM tb_proveedor WHERE id  = 6;

/*CRUD producto*/

INSERT INTO `supermercado`.`tb_producto`
(`id`,`nombre`,`precio_actual`,`existencia`,`tb_proveedor_id`,`tb_categoria_producto_id`)
VALUES
(null,'Prueba',100000,'30',1,1);
select * from tb_producto;
select * from tb_producto where tb_categoria_producto_id in (select id from tb_categoria_producto);
UPDATE tb_producto set nombre = 'papa', tb_categoria_producto_id = 4 where id = 6;
DELETE FROM tb_producto WHERE id = 6;

/*CRUD venta*/

INSERT INTO `supermercado`.`tb_venta`
(`id`,`fecha`,`valor_descuento`,`total`,`numero_documento_cliente`,`tipo_pago_id`)
VALUES
(null,'2022-08-01',0,22000,'1144213155',1);
SELECT * FROM tb_venta;
SELECT * FROM tb_venta WHERE numero_documento_cliente = '1144213155';
UPDATE tb_venta SET valor_descuento = '100', total = 12000 where id = 6;
delete from tb_venta where id = 6;