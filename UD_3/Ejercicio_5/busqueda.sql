-- SELECT * FROM Clientes;
-- SELECT nombre,Precio FROM Productos WHERE Precio < "100";
-- SELECT Nombre,Ciudad,Edad from Clientes WHERE ciudad = "Madrid" order by edad asc;
-- SELECT ID,Cantidad,Fecha FROM Pedidos where Fecha > "2024-11-12";
-- SELECT Nombre,Stock,Categoria,Precio FROM Productos WHERE Stock < "10" ORDER BY categoria,precio;
-- SELECT nombre,Edad FROM Clientes WHERE Edad < "30" ORDER BY nombre ASC;
SELECT ProductoID FROM Productos WHERE ClienteID = "Juan Perez" ORDER BY FECHA;

