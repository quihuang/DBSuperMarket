/*Consulta para saber cuales productos tiene un cliente*/

SELECT client.numero_documento, client.nombres, client.apellidos,vent.id as numero_factura,vent.fecha as fecha_factura,product.nombre as nombre_producto
FROM tb_cliente client
INNER JOIN tb_venta vent ON client.numero_documento = vent.numero_documento_cliente
INNER JOIN tb_producto_venta provent ON  provent.venta_id = vent.id
INNER JOIN tb_producto product ON product.id = provent.producto_id
WHERE client.numero_documento = '1144213155';

/*Consulta para saber cuales productos tiene un proveedor*/
select * from tb_proveedor provee
INNER JOIN tb_producto product ON product.tb_proveedor_id = provee.id
where provee.razon_social = 'Nestle SAS';