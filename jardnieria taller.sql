--1. Crear una vista de clientes por país: Crea una vista que muestre el nombre del cliente, el nombre del 
--contacto, el apellido del contacto y el país para cada cliente. Llama a esta vista ‘clientes_por_pais’.
create view cliente_por_pais as 
select cliente.nombre_cliente,cliente.nombre_contacto,cliente.apellido_contacto,cliente.pais from cliente 	
	group by pais,nombre_cliente,nombre_contacto,apellido_contacto 
		order by pais desc;

		



--2. Usar la vista ‘clientes_por_pais’: Escribe una consulta que utilice la vista `clientes_por_pais` para 
--obtener todos los clientes de un país específico, por ejemplo, 'España'.


select * from cliente_por_pais where pais like 'Sp%';






--3. Modificar la vista ‘clientes_por_pais’: Modifica la vista `clientes_por_pais` para que también muestre 
--la ciudad de cada cliente.


CREATE OR REPLACE VIEW cliente_por_pais as
	select cliente.nombre_cliente,cliente.nombre_contacto,cliente.apellido_contacto,cliente.pais,ciudad	 from cliente 
		group by pais,nombre_cliente,nombre_contacto,apellido_contacto,ciudad
		order by pais desc;





--4. Crear una vista de clientes con límite de crédito alto: Crea una vista que muestre el nombre del cliente 
--y el límite de crédito para cada cliente cuyo límite de crédito sea mayor que un valor específico, por 
--ejemplo, 50000. Llama a esta vista `clientes_credito_alto`.


create view clientes_credito_alto as 
	select nombre_cliente, limite_credito from cliente where limite_credito >=50000;



--5. Usar la vista ‘clientes_credito_alto’: Escribe una consulta que utilice la vista ‘clientes_credito_alto’
--para obtener todos los clientes con un límite de crédito mayor que 100000.

select * from clientes_credito_alto where limite_credito >=100000;


--6. Crear una vista de clientes sin límite de crédito: Crea una vista que muestre el nombre del cliente y el 
--límite de crédito para cada cliente que no tenga un límite de crédito establecido. Llama a esta vista 
--‘clientes_sin_limite’.

create view clientes_sin_limite as 
	select nombre_cliente,limite_credito from cliente where limite_credito is null ;


	
--7. Usar la vista ‘clientes_sin_limite’: Escribe una consulta que utilice la vista `clientes_sin_limite` para 
--obtener todos los clientes sin límite de crédito.

select * from clientes_sin_limite;





--8. Crear una vista de clientes por región: Crea una vista que muestre el nombre del cliente y la región 
--para cada cliente. Llama a esta vista ‘clientes_por_region’.
--Formato programa de curso 2


create view clientes_por_region as 
	select nombre_cliente,region from cliente order by region desc ;





--9. Usar la vista ‘clientes_por_region’: Escribe una consulta que utilice la vista ‘clientes_por_region’ para 
--obtener todos los clientes de una región específica, por ejemplo, 'Andalucía'.


select * from clientes_por_region where region like 'Mad%';


--10. Crear una vista de clientes con representante de ventas: Crea una vista que muestre el nombre del 
--cliente y el código, junto con el nombre completo del empleado representante de ventas para cada 
--cliente que tenga un representante de ventas asignado. Llama a esta vista ‘clientes_con_rep’.

create view clientes_con_rep as
	select cliente.nombre_cliente,cliente.codigo_cliente,cliente.codigo_empleado_rep_ventas,empleado.nombre,empleado.apellido1 
		from cliente 
	join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado ;
	


--11. Usar la vista ‘clientes_con_rep’: Escribe una consulta que utilice la vista ‘clientes_con_rep’ para 
--obtener todos los clientes que tienen asignado el representante de ventas con código 123.

select * from clientes_con_rep where codigo_empleado_rep_ventas = 123; 



--12. Crear una vista de clientes sin representante de ventas: Crea una vista que muestre el nombre del 
--cliente para cada cliente que no tenga un representante de ventas. Llama a esta vista 
--‘clientes_sin_rep’.

create view clientes_sin_rep as
	select cliente.nombre_cliente,cliente.codigo_cliente,cliente.codigo_empleado_rep_ventas,empleado.nombre,empleado.apellido1 
		from cliente 
	join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
		where empleado.codigo_empleado is null ;
	





--13. Usar la vista ‘clientes_sin_rep’: Escribe una consulta que utilice la vista ‘clientes_sin_rep’ para obtener
--todos los clientes sin representante de ventas.


select count(*) from clientes_sin_rep 






--14. Crear una vista de información detallada de productos: Crea una vista que muestre la información 
--detallada sobre un producto establecido dentro de un pedido (código_pedido, fecha_pedido, 
--código_producto, nombre, gama, dimensiones, precio_venta). Llama a esta vista 
--‘detalle_productos_pedidos’.

create view detalle_productos_pedidos as 
	select producto.nombre,producto.descripcion,pedido.fecha_pedido,pedido.codigo_pedido,producto.gama
	from producto
		left join detalle_pedido on detalle_pedido.codigo_producto = producto.codigo_producto
		left join pedido on pedido.codigo_pedido = detalle_pedido.codigo_pedido; 
		
		





--15. Usar la vista ‘detalle_productos_pedidos’: Escribe una consulta que utilice la vista 
--‘detalle_productos_pedidos’ para obtener la información detallada de un producto incluido en un 
--pedido (pedido=9, producto=’FR-69’).


select * from detalle_productos_pedidos where pedido = 9;

