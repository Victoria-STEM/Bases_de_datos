SELECT nombre_cliente,correo_cliente FROM cliente;
SELECT fecha_pedido,total_pedido FROM pedido WHERE id_cliente = 2 ORDER BY total_pedido DESC;
SELECT fecha_pedido,total_pedido FROM pedido WHERE fecha_pedido > '2024-11-01' ORDER BY total_pedido DESC;
SELECT fecha_pedido,total_pedido FROM pedido WHERE total_pedido < 150 ORDER BY fecha_pedido ASC;
