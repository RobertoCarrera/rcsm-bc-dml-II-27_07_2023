USE actividades;
/* 3.1. Obtener todos los almacenes */
SELECT * FROM almacenes;
/* 3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150€ */
SELECT * FROM cajas
WHERE valor > 150;
/* 3.3. Obtener los tipos de contenidos de las cajas */
SELECT contenido FROM cajas
GROUP BY contenido;
/* 3.4. Obtener el valor medio de todas las cajas */
SELECT AVG(valor) AS 'Valor medio' FROM cajas;
/* 3.5. Obtener el valor medio de las cajas de cada almacen */
SELECT almacen, AVG(valor) AS 'Valor medio' FROM cajas
GROUP BY almacen;
/* 3.6. Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea
superior a 150€ */
SELECT almacenes.codigo AS 'Almacén' FROM almacenes
INNER JOIN cajas
ON almacenes.codigo = cajas.almacen
GROUP BY almacenes.codigo
HAVING AVG(cajas.valor) > 150;
/* 3.7. Obtener el número de referencia de cada caja junto con el nombre de la ciudad en 
el que se encuentra */
SELECT cajas.numreferencia AS 'Num_Ref', almacenes.lugar AS 'Ciudad' 
FROM cajas
INNER JOIN almacenes
ON almacenes.codigo = cajas.almacen;
/* 3.8. Obtener el número de cajas que hay en cada almacén */
SELECT COUNT(numreferencia) AS 'Cajas x almacén' FROM cajas
GROUP BY almacen;
/* 3.9. Obtener los códigos de los almacenes que están saturados (los almacenes donde
el número de cajas es superior a la capacidad) */
SELECT almacenes.codigo FROM almacenes
WHERE capacidad < (SELECT COUNT(numreferencia) FROM cajas WHERE cajas.almacen = almacenes.codigo);
/* 3.10. Obtener los números de referencia de las cajas que están en Bilbao */
SELECT numreferencia FROM cajas
INNER JOIN almacenes
ON almacenes.codigo = cajas.almacen
WHERE almacenes.lugar = 'Bilbao';
/* 3.11. Insertar un nuevo almacén en Barcelona con capacidad para 3 cajas */
INSERT INTO almacenes VALUES
	(6,'Barcelona', 3);
/* 3.12. Insertar una nueva caja, con número de referencia 'H5RT', con
contenido 'Papel', valor 200 y situada en el almacén 2 */
INSERT INTO cajas VALUES
	('H5RT', 'Papel', 200, 2);
/* 3.13. Rebajar el valor de todas las cajas un 15% */
UPDATE cajas
SET valor = valor*0.85;
/* 3.14. Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor
medio de todas las cajas */
/* He encontrado una forma de hacerlo, pero como no acabo de entenderlo, prefiero no 
poner nada porque es lo honesto. Que no sabría hacerlo. */
/* 3.15. Elimitar todas las cajas cuyo valor sea inferior a 100€ */
DELETE FROM cajas
WHERE valor < 100;
/* 3.16. Vaciar el contenido de los almacenes que están saturados */
/*Lo mismo que la 14, muy compleja*/