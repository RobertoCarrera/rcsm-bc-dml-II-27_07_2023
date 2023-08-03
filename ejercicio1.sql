USE actividades;
/* 1.1.Obtener todos los nombres de los productos de la tienda */
SELECT nombre FROM articulos;
/* 1.2.Obtener los nombres y los precios de los productos de la tienda */
SELECT nombre, precio FROM articulos;
/* 1.3.Obtener el nombre de los productos cuyo pecio sea menor o igual a 200€ */
SELECT nombre FROM articulos
WHERE precio <= 200;
/* 1.4.Obtener todos los datos de los artículos cuyo precio esté entre los 60€
y los 120€ (ambos incluidos) */
SELECT * FROM articulos
WHERE precio BETWEEN 60 AND 120;
/* 1.5.Obtener el nombre y el precio en pesetas (1€ = 166,386) */
SELECT nombre, precio*166.386 FROM articulos;
/* 1.6.Seleccionar el precio medio de todos los productos */
SELECT AVG(precio) AS 'Precio medio' FROM articulos;
/* 1.7.Obtener el precio medio de los artículos cuyo código de fabricante sea 2 */
SELECT AVG(precio) AS 'Precio medio fab.2' FROM articulos
WHERE fabricante = 2;
/* 1.8. Obtener el número de artículos cuyo precio sea mayor o igual a 180€ */
SELECT COUNT(codigo) FROM articulos
WHERE precio >= 180;
/* 1.9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180€
y ordenarlos descendentemente por precio, y luego ascendentemente por nombre */
SELECT nombre, precio FROM articulos
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;
/* 1.10. Obtener un listado completo de artículos, incluyendo por cada artículo los datos
del artículo y de su fabricante */
SELECT * FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;
/* 1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio
y el nombre de su fabricante */
SELECT articulos.nombre AS 'Artículo', articulos.precio AS 'Precio', fabricantes.nombre AS 'Fabricante' 
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;
/* 1.12. Obtener el precio medio de los productos de cada fabricante, 
mostrando sólo los códigos de fabricante */
SELECT fabricante, AVG(precio) AS 'Precio medio'
FROM articulos
GROUP BY fabricante;
/* 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando
el nombre del fabricante */
SELECT fabricantes.nombre AS 'Fabricante', AVG(precio) AS 'Precio medio'
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
GROUP BY fabricantes.nombre;
/* 1.14. Obtener los nombres de los fabricantes que ofrezcan productos 
cuyo precio medio sea mayor o igual a 150€ */
SELECT fabricantes.nombre 
FROM fabricantes
LEFT JOIN articulos
ON fabricantes.codigo = articulos.fabricante
GROUP BY fabricantes.nombre
HAVING AVG(articulos.precio) >= 150;
/* 1.15. Obtener el nombre y precio del articulo más barato */
SELECT nombre, precio FROM articulos
ORDER BY precio ASC
LIMIT 1;
/* 1.16. Obtener una lista con el nombre y precio de los artículos más caros
de cada proveedor (incluyendo nombre del proveedor) */
SELECT articulos.nombre, articulos.precio, fabricantes.nombre
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
ORDER BY articulos.precio DESC
LIMIT (SELECT COUNT(fabricantes.codigo) FROM fabricantes);