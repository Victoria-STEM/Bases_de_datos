SELECT precio,stock FROM producto; 
SELECT cantidad,fecha_venta FROM venta WHERE cantidad < 3 ORDER BY fecha_venta DESC;
SELECT nombre_producto,stock FROM producto WHERE stock < 50 ORDER BY precio ASC;
SELECT nombre_producto,stock FROM producto WHERE stock = 0;