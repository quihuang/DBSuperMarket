INSERT INTO `supermercado`.`tb_direccion`
(`id`,`calle_carrera`,`numero`,`barrio`,`ciudad`)
VALUES
(null,'Calle 45','5-09','Calima','Cali'),
(null,'Calle 5 Oeste','555-1','Samanes','Palmira'),
(null,'Calle 9 Norte','22-31','Las Granjas','Cali'),
(null,'Carrera 6 N','5-52','Nueva Floresta','Cali'),
(null,'Calle 1 Norte','12-17','Guaduales','Cali'),
(null,'Calle 24','5-09','Alamos','Cali'),
(null,'Carrera 5 Oeste','555-1','Arboleda','Cali'),
(null,'Carrera 9 Norte','22-31','Floralia','Cali'),
(null,'Calle 6 N','5-52','Dolores','Cali'),
(null,'Carrera 1 Norte','12-17','Sucre','Cali');

INSERT INTO `supermercado`.`tb_tipo_pago`
(`id`,`tipo_pago`,`interes`)
VALUES
(null,'Credito','0.5%'),
(null,'Efectivo',null),
(null,'Tarjeta Credito',null),
(null,'Tarjeta Debito',null);

INSERT INTO `supermercado`.`tb_categoria_producto`
(`id`,`nombre`,`descripción`)
VALUES
(null,'Papeleria','Productos de Papeleria'),
(null,'Aseo','Productos de Aseo'),
(null,'Dulceria','Productos de Aseo'),
(null,'Canasta Basica','Productos de Canasta Basica'),
(null,'Jugueteria','Productos de Jugueteria');

INSERT INTO `supermercado`.`tb_proveedor`
(`id`,`nit`,`razon_social`,`telefono`,`correo_electronico`,`representante_legal`,`sitio_web`,`tb_direccion_id`)
VALUES
(null,'80034225-1','Nestle SAS','3145673232','pedidos@nestle.com','Fernando Gutierrez','www.nestle.com',10),
(null,'80099922-7','CocaCola','3156765656','pedidos@cocacola.com','Alejandro Guzman','www.cocacola.com',9),
(null,'944172321-3','Pepsico','3205661232','pedidos@pepsico.com','Manuela Veltran','www.pepsico.com',8),
(null,'11332123-7','Mondelez International','3219874532','pedidos@mondelezinternational.com','Francisco Huerta','www.mondelezinternational.com',7),
(null,'66808943-5','Kellogs','3118882233','pedidos@kellogs.com','Pedro Ichuiza','www.Kellogs.com',6);

INSERT INTO `supermercado`.`tb_cliente`
(`numero_documento`,`nombres`,`apellidos`,`correo_electronico`,`tb_direccion_id`)
VALUES
('1144213155','Franklin German','Quihuang Garzon','quihuang2017@gmail.com',5),
('94417231','Hector','Rojas','hectorr222@gmail.com',4),
('1123215442','Juan Jose','Castañeda','jj2002@outlook.com',3),
('66808945','Julio Cesar','Ruiz','ruiz@gmail.com',2),
('114432137','Luisa','Cardona','cardona@hotmail.com',1);

INSERT INTO `supermercado`.`tb_telefono`
(`id`,`numero_telefono`,`numero_documento_cliente`)
VALUES
(null,'3205282231',1144213155),
(null,'3156432452',1144213155),
(null,'3145678932',1144213155),
(null,'3182314512',94417231),
(null,'3146662323',94417231),
(null,'3128974437',1123215442),
(null,'3217756456',66808945),
(null,'3120098789',66808945),
(null,'3159000808',114432137),
(null,'3168941932',114432137);

INSERT INTO `supermercado`.`tb_producto`
(`id`,`nombre`,`precio_actual`,`existencia`,`tb_proveedor_id`,`tb_categoria_producto_id`)
VALUES
(null,'Doritos',2500,'500',4,3),
(null,'Escoba',8900,'100',3,2),
(null,'Lapiz',900,'100',1,1),
(null,'Arroz',8900,'100',5,4),
(null,'Avion',8900,'100',3,5);

INSERT INTO `supermercado`.`tb_venta`
(`id`,`fecha`,`valor_descuento`,`total`,`numero_documento_cliente`,`tipo_pago_id`)
VALUES
(null,'2022-06-01',0,34500,'1144213155',2),
(null,'2022-06-22',0,12000,'94417231',1),
(null,'2022-06-27',0,33000,'1123215442',3),
(null,'2022-06-25',1000,2200,'94417231',4),
(null,'2022-06-26',5000,11000,'94417231',2);      

INSERT INTO `supermercado`.`tb_producto_venta`
(`id`,`producto_id`,`venta_id`)
VALUES
(null,1,2),
(null,2,2),
(null,3,2),
(null,4,2),
(null,5,2),
(null,1,1),
(null,5,1),
(null,4,1),
(null,1,3),
(null,3,3),
(null,3,3),
(null,2,4),
(null,1,5),
(null,1,5);



                                                                                                                                                                                                                                                                                                                                                                                                                                         

