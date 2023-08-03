USE actividades;
/* 4.1. Mostrar el nombre de todas las películas */
SELECT nombre FROM peliculas;
/* 4.2. Mostrar las distintas calificaciones de edad que existen */
SELECT calificacionedad FROM peliculas;
/* 4.3. Mostrar todas las películas que no han sido calificadas */
SELECT nombre FROM peliculas
WHERE calificacionedad IS NULL;
/* 4.4. Mostrar todas las salas que no proyectan ninguna película */
SELECT codigo, nombre FROM salas
WHERE pelicula IS NULL;
/* 4.5. Mostrar la información de todas las salas y, si se proyecta alguna película
en la sala, mostrar también la información de la película */
SELECT * FROM salas
INNER JOIN peliculas
ON salas.pelicula = peliculas.codigo
WHERE salas.pelicula = peliculas.codigo;
/* 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, 
mostrar también la información de la sala */
SELECT * FROM peliculas
INNER JOIN salas
ON peliculas.codigo = salas.pelicula
WHERE salas.pelicula <> peliculas.codigo; 
/* 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala */
SELECT peliculas.nombre FROM peliculas
INNER JOIN salas
ON salas.pelicula = peliculas.codigo
;
SELECT * FROM peliculas;
/* 4.8. Añadir una nueva película 'Uno, Dos, Tres', para mayores de 7 años */
/* 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 
'no recomendadas para menores de 13 años' */
/* 4.10. Elimitar todas las salas que proyectan películas recomendadas para todos
los públicos */