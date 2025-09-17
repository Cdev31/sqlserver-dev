# Ejercicios T-SQL – researchManagementDB

---

## Nivel Básico (25)

1. Crear una vista que muestre `full_name`, `institutional_email` y `institution_id` de todos los investigadores activos.
2. Crear una vista que liste todos los proyectos con su título, presupuesto y estatus ordenados por presupuesto descendente.
3. Crear una función escalar que devuelva el número de años de un investigador en la institución desde su `incorporation_date`.
4. Crear una función escalar que convierta un presupuesto en USD a EUR usando una tasa fija (ej. 0.9).
5. Crear una función tabla que reciba un `institution_id` y devuelva los departamentos asociados.
6. Crear una función tabla que reciba un `researcher_id` y devuelva las publicaciones en las que participa.
7. Crear un procedimiento almacenado que liste todas las convocatorias abiertas.
8. Crear un procedimiento almacenado que reciba un año y devuelva los proyectos iniciados en ese año.
9. Crear un trigger en `publications` que registre en una tabla de auditoría cada vez que se inserte una publicación.
10. Crear un trigger en `fundings` que evite insertar montos negativos en `total_amount`.
11. Crear un cursor que recorra todas las instituciones e imprima su nombre.
12. Crear un cursor que recorra todos los investigadores y muestre su `full_name` y `h_index`.
13. Crear una transacción que inserte una nueva institución y dos departamentos relacionados, confirmando al final.
14. Crear una transacción que elimine un investigador y todos sus proyectos, usando `BEGIN TRAN` y `ROLLBACK` de ser necesario.
15. Crear una vista que muestre todos los laboratorios con su capacidad disponible (capacidad – número de investigadores responsables).
16. Crear una función escalar que devuelva las iniciales de un investigador a partir de su `full_name`.
17. Crear un procedimiento almacenado que inserte un nuevo área de conocimiento, recibiendo nombre y descripción.
18. Crear un procedimiento almacenado que reciba un `publication_id` y devuelva su número total de citas.
19. Crear un trigger en `research_projects` que actualice `update_date` automáticamente cuando se modifique cualquier campo.
20. Crear un trigger en `researchers` que impida eliminar investigadores con publicaciones asociadas.
21. Crear una vista que muestre publicaciones con DOI no nulo y sus autores correspondientes.
22. Crear una función tabla que devuelva todos los proyectos de un área de conocimiento dada.
23. Crear una transacción que transfiera un investigador de un departamento a otro, asegurando consistencia en `researcher_departments`.
24. Crear un cursor que recorra las convocatorias y muestre `name` y `closing_date`.
25. Crear una vista que muestre los títulos de publicaciones y el nombre de la revista, solo para publicaciones en Q1.

---

## Nivel Intermedio (25)

1. Crear una función escalar que reciba un `researcher_id` y devuelva su promedio de citas por publicación.
2. Crear una función escalar que reciba un `publication_id` y devuelva el nombre del primer autor.
3. Crear una función tabla que devuelva los proyectos con presupuesto superior al promedio.
4. Crear una función tabla que devuelva todas las citas recibidas por una publicación.
5. Crear un procedimiento almacenado que inserte una nueva publicación junto con sus autores.
6. Crear un procedimiento almacenado que reciba `institution_id` y liste todos sus investigadores y departamentos.
7. Crear un procedimiento almacenado que reciba un `researcher_id` y devuelva su historial de participación en proyectos.
8. Crear un trigger que evite insertar proyectos con `estimated_end_date` anterior a `start_date`.
9. Crear un trigger que bloquee la eliminación de áreas de conocimiento con proyectos activos asociados.
10. Crear un cursor que actualice automáticamente la columna `total_publications` de cada investigador.
11. Crear un cursor que recorra todos los proyectos y calcule su duración en días, actualizando un campo auxiliar.
12. Crear una transacción que inserte un proyecto y su financiamiento asociado, asegurando atomicidad.
13. Crear una transacción que elimine una convocatoria y sus proyectos relacionados, asegurando rollback en error.
14. Crear una vista que muestre las patentes junto con el nombre del proyecto asociado y su estatus.
15. Crear una vista que muestre proyectos junto con el total de desembolsos realizados.
16. Crear una función escalar que devuelva el nombre del país a partir de un `institution_id`.
17. Crear una función tabla que devuelva todas las publicaciones de un investigador ordenadas por citas.
18. Crear un procedimiento almacenado que actualice el estatus de un proyecto a `finished` y registre la fecha.
19. Crear un procedimiento almacenado que devuelva todas las áreas principales y sus subáreas.
20. Crear un trigger que registre en una tabla de auditoría cualquier actualización en `fundings`.
21. Crear un trigger que actualice automáticamente el campo `total_citations` en `researchers` al insertar una nueva publicación.
22. Crear una vista que muestre todos los investigadores y el número de proyectos donde participan como `principal`.
23. Crear una función tabla que devuelva las publicaciones de un área de conocimiento específica.
24. Crear un cursor que recorra todos los revisores y muestre las áreas en las que tienen expertise.
25. Crear una vista que liste proyectos y el total de publicaciones vinculadas.

---

## Nivel Avanzado (25)

1. Crear una función escalar que calcule el ROI de un proyecto (citas totales / presupuesto).
2. Crear una función tabla que devuelva investigadores con más de 5 publicaciones Q1.
3. Crear un procedimiento almacenado que devuelva las top 10 publicaciones más citadas de un área dada.
4. Crear un procedimiento almacenado que inserte un nuevo investigador y lo asigne a un departamento.
5. Crear un procedimiento almacenado que devuelva todos los proyectos “multidisciplinares” (≥ 3 áreas distintas).
6. Crear un trigger que impida actualizar el `h_index` manualmente (solo actualizable vía proceso calculado).
7. Crear un trigger que inserte en un log cada vez que se modifique `status` de un proyecto.
8. Crear una transacción que copie todos los proyectos de un investigador a otro con rollback en error.
9. Crear una transacción que reasigne todas las publicaciones de un investigador eliminado a un sustituto.
10. Crear una vista que muestre proyectos con más de un financiamiento activo asociado.
11. Crear una vista que muestre los investigadores con sus citas anuales promedio usando funciones de fecha.
12. Crear una función escalar que devuelva el “nivel de impacto” de una publicación según citas (ej. Alto, Medio, Bajo).
13. Crear una función tabla que devuelva los revisores que aceptaron más del 80% de los artículos asignados.
14. Crear un procedimiento almacenado que devuelva todas las patentes de un investigador dado.
15. Crear un procedimiento almacenado que genere un informe de todos los desembolsos pendientes de un proyecto.
16. Crear un trigger que impida eliminar laboratorios con proyectos activos asociados.
17. Crear un trigger que bloquee insertar convocatorias con `closing_date` anterior a `opening_date`.
18. Crear un cursor que recorra todas las publicaciones y actualice indicadores de citas en otra tabla.
19. Crear un cursor que genere un reporte de proyectos activos por institución.
20. Crear una transacción que inserte un evento académico y 3 publicaciones asociadas en bloque.
21. Crear una vista que muestre instituciones junto con su número de proyectos, publicaciones y patentes.
22. Crear una función escalar que devuelva las iniciales de un evento académico.
23. Crear una función tabla que devuelva todas las publicaciones de un investigador con impacto superior al promedio.
24. Crear un procedimiento almacenado que devuelva proyectos cuyo presupuesto supere el promedio de su institución.
25. Crear un procedimiento almacenado que devuelva las 5 instituciones más productivas (publicaciones/proyecto).

---

## Nivel Avanzado – Análisis (50)

1. Crear una función tabla que calcule, por institución, el promedio de h-index y citas totales, devolviendo ranking.
2. Crear una vista que muestre la distribución de proyectos por tipo (`basic`, `applied`, etc.) y calcule porcentajes.
3. Crear un procedimiento almacenado que genere un informe JSON con todos los proyectos y sus publicaciones asociadas.
4. Crear un procedimiento almacenado que identifique investigadores con sobreasignación de horas (> 40 semanales).
5. Crear una transacción que simule la reasignación de presupuesto entre proyectos y valide que no quede en negativo.
6. Crear un trigger que detecte publicaciones con `impact_factor` superior a 20 y marque automáticamente como “alto impacto”.
7. Crear un cursor que calcule la mediana de citas por revista y actualice un campo auxiliar.
8. Crear una función escalar que devuelva el “índice de productividad” de un investigador (publicaciones/año).
9. Crear una función tabla que devuelva los 10 proyectos con mayor número de citas en publicaciones.
10. Crear un procedimiento almacenado que devuelva todos los investigadores con al menos una patente y una publicación asociada.
11. Crear un procedimiento almacenado que devuelva un ranking de instituciones según ROI (citas/presupuesto).
12. Crear un trigger que audite intentos de eliminación en `knowledge_areas`.
13. Crear un trigger que registre cualquier cambio en `status` de un investigador en una tabla de historial.
14. Crear una transacción que intente cerrar todos los proyectos con `end_date` vencida y revierta si alguno tiene publicaciones pendientes.
15. Crear una vista que muestre proyectos con más de 3 áreas de conocimiento asociadas.
16. Crear una vista que muestre publicaciones con más de 2 citas internas (mismo autor o institución).
17. Crear una función escalar que devuelva el “nivel de internacionalización” de un proyecto (número de países participantes).
18. Crear una función tabla que devuelva investigadores con productividad creciente (más publicaciones cada año).
19. Crear un procedimiento almacenado que devuelva el top 5 de revisores por puntaje promedio dado.
20. Crear un procedimiento almacenado que genere un reporte JSON de convocatorias activas y proyectos asociados.
21. Crear un trigger que bloquee insertar proyectos con `start_date` en el pasado y `status = planning`.
22. Crear un trigger que impida modificar el `doi` de una publicación una vez asignado.
23. Crear un cursor que calcule la edad promedio de las instituciones por país.
24. Crear un cursor que liste los top 10 investigadores por h-index y sus proyectos principales.
25. Crear una transacción que inserte un nuevo área de conocimiento y reasigne proyectos secundarios.
26. Crear una transacción que mueva todas las publicaciones de un área a otra y valide consistencia en citas.
27. Crear una vista que muestre investigadores clasificados por percentil de h-index.
28. Crear una vista que muestre laboratorios con tasa de uso (investigadores/capacidad) superior al 80%.
29. Crear una función escalar que devuelva el dominio del correo institucional de un investigador.
30. Crear una función tabla que devuelva citas externas (citas entre publicaciones de distintas instituciones).
31. Crear un procedimiento almacenado que devuelva proyectos con publicaciones en Q1 y patentes asociadas.
32. Crear un procedimiento almacenado que devuelva las 5 áreas con mayor número de proyectos activos.
33. Crear un trigger que marque automáticamente proyectos como `finished` si `actual_end_date` < GETDATE().
34. Crear un trigger que registre en log cambios de presupuesto en `fundings`.
35. Crear una transacción que elimine un investigador y reasigne sus publicaciones a un coautor principal.
36. Crear una transacción que copie convocatorias vencidas a una tabla de histórico.
37. Crear una vista que muestre el top 5 de instituciones por número de patentes.
38. Crear una vista que muestre convocatorias con tasa de éxito (proyectos financiados / proyectos presentados).
39. Crear una función escalar que devuelva el número de colaboraciones internacionales de un investigador.
40. Crear una función tabla que devuelva investigadores que son líderes en más de un proyecto.
41. Crear un procedimiento almacenado que devuelva publicaciones con mayor crecimiento de citas año a año.
42. Crear un procedimiento almacenado que devuelva un informe de desembolsos por estado (`pending`, `disbursed`, `rejected`).
43. Crear un trigger que bloquee eliminar revisores con procesos de revisión pendientes.
44. Crear un trigger que impida insertar `impact_indicators` con fechas futuras.
45. Crear un cursor que calcule el total de citas acumuladas por institución.
46. Crear un cursor que recorra todas las patentes y devuelva los inventores principales.
47. Crear una transacción que redistribuya presupuestos entre convocatorias y valide que la suma global no cambie.
48. Crear una transacción que cierre todas las publicaciones sin citas después de 2 años, marcándolas en un campo auxiliar.
49. Crear una vista que muestre investigadores con productividad decreciente (menos publicaciones cada año).
50. Crear una vista que muestre el top 10 de proyectos por ROI (citas / presupuesto invertido).
