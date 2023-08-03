USE actividades;
/* 2.1. Obtener los apellidos de los empleados */
SELECT apellidos AS 'Apellidos' FROM empleados;
/* 2.2. Obtener los apellidos de los empleados sin repeticiones */
SELECT apellidos AS 'Apellidos' FROM empleados
GROUP BY apellidos;
/* 2.3. Obtener los datos de los empleados que se apellidan 'Smith' */
SELECT * FROM empleados
WHERE apellidos = 'Smith';
/* 2.4. Obtener los datos de los empleados que se apellidan 'Smith' y los que 
se apellidan 'Rogers' */
SELECT * FROM empleados
WHERE apellidos = 'Smith' OR apellidos = 'Rogers';
/* 2.5. Obtener los datos de los empleados que trabajan para el departamento 14 */
SELECT * FROM empleados
WHERE departamento = 14;
/* 2.6. Obtener los datos de los empleados que trabajan para el departamento
37 y para el departamento 77 */
SELECT * FROM empleados
WHERE departamento = 37 OR departamento = 77;
/* 2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P' */
SELECT * FROM empleados
WHERE apellidos LIKE 'P%';
/* 2.8. Obtener el presupuesto total de todos los departamentos */
SELECT SUM(presupuesto) AS 'Presupuesto total' FROM departamentos;
/* 2.9. Obtener el número de empleados en cada departamento */
SELECT COUNT(dni) AS 'Num empleados', departamento AS 'Departamento' FROM empleados
GROUP BY departamento;
/* 2.10. Obtener un listado completo de empleados, incluyendo por cada
empleado los datos del empleado y de su departamento */
SELECT * FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo;
/* 2.11. Obtener un listado completo de empleados, incluyendo el nombre
y apellidos del empleado junto al nombre y presupuesto de su departamento */
SELECT empleados.nombre, empleados.apellidos, departamentos.nombre, departamentos.presupuesto
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo;
/* 2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos
cuyo prespuesto sea mayor de 60.000€ */
SELECT empleados.nombre, empleados.apellidos
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;
/* 2.13. Obtener los datos de los departamentos cuyo presupuesto es superior
al presupuesto medio de todos los departamentos */
SELECT * FROM departamentos
WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);
/* 2.14. Obtener los nombres (únicamente los nombres) de los departamentos
que tienen más de dos empleados */
SELECT departamentos.nombre FROM departamentos
INNER JOIN empleados
ON departamentos.codigo = empleados.departamento
GROUP BY departamentos.nombre
HAVING COUNT(empleados.dni) > 2;
/* 2.15. Añadir un nuevo departamento: 'Calidad', con presupuesto de 40.000€ y código 11.
Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109 */
INSERT INTO departamentos VALUES
	(11, 'Calidad', 40000);
INSERT INTO empleados VALUES
	(89267109, 'Esther', 'Vázquez', 11);
/* Comprobación de la introducción correcta de los datos:
SELECT * FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.codigo = 11;*/
/* 2.16. Aplicar un recorte presupuestario del 10% a todos los departamentos */
UPDATE departamentos
SET presupuesto = presupuesto * 0.9
WHERE codigo IS NOT NULL;
/* Tuve que settear los safe updates a 0 para comprobar que hacía el cambio correctamente.
Parece ser que la cláusula WHERE no era suficiente: SET SQL_SAFE_UPDATES = 0;*/
/* 2.17. Reasignar a los empleados del departamento de investigación (código 77)
al departamento de informática (código 14) */
UPDATE empleados
SET departamento = 14
WHERE departamento = 77;
/* 2.18. Despedir a todos los empleados que trabajan para el departamento
de informática (código 14) */
DELETE FROM empleados
WHERE departamento = 14;
/* 2.19. Despedir a todos los empleados que trabajen para departamentos cuyo
presupuesto sea superior a los 60.000€ */
DELETE FROM empleados
WHERE departamento IN (SELECT codigo FROM departamentos WHERE presupuesto > 60000);
/* 2.20. Despedir a todos los empleados */
DELETE FROM empleados;