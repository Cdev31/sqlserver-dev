# Ejercicios SQL – researchManagementDB

## Nivel Básico (25)

1. Obtén el nombre y país de todas las instituciones ordenadas alfabéticamente por país.
2. Muestra el nombre y email de todos los departamentos cuyo nombre contenga la palabra `Science`.
3. Lista los nombres de investigadores cuyo `h_index` esté entre 20 y 40.
4. Devuelve el título de todas las publicaciones que tengan un `impact_factor` mayor a 10.
5. Cuenta cuántos investigadores hay por institución.
6. Obtén la lista de ciudades distintas donde haya instituciones registradas.
7. Recupera las convocatorias que estén actualmente en estado `open` o `evaluation`.
8. Muestra el nombre de los equipos de investigación y la fecha de reconocimiento, ordenados por fecha descendente.
9. Encuentra todos los laboratorios que tengan capacidad mayor a 20.
10. Lista los proyectos que tengan un presupuesto mayor a 1,000,000 USD.
11. Muestra el nombre de las áreas de conocimiento de nivel 1.
12. Devuelve el nombre y la fecha de fundación de las instituciones fundadas antes del año 1900.
13. Recupera los investigadores cuya categoría académica sea `Professor` o `Associate Professor`.
14. Lista todas las publicaciones que pertenezcan al cuartil Q1.
15. Obtén los proyectos cuya fecha estimada de finalización esté entre 2025 y 2026.
16. Devuelve los nombres de los investigadores cuyo correo termine en `.edu`.
17. Muestra los laboratorios activos que estén en Harvard University.
18. Lista los proyectos con estatus `execution`, ordenados por presupuesto descendente.
19. Cuenta cuántos proyectos existen en cada institución.
20. Encuentra el nombre de los equipos de investigación cuyo código empiece con `MIT`.
21. Lista las convocatorias cuyo presupuesto sea superior al promedio general de convocatorias.
22. Muestra los nombres de investigadores que no tengan publicaciones asociadas.
23. Encuentra todos los eventos académicos que se realicen en 2024.
24. Obtén los nombres de las áreas de conocimiento que no tengan área padre (`parent_area_id` nulo).
25. Devuelve las publicaciones que tengan DOI registrado y ordénalas alfabéticamente por `journal_name`.

---

## Nivel Intermedio (25)

1. Encuentra los proyectos cuyo presupuesto sea mayor al de todos los proyectos de Stanford University.
2. Lista las instituciones que no tengan departamentos asociados.
3. Devuelve el nombre de los investigadores que pertenezcan a más de un departamento.
4. Encuentra las publicaciones cuyo número de citas sea mayor que el promedio de todas las publicaciones.
5. Lista los nombres de los investigadores que hayan participado en proyectos con estatus `execution`.
6. Devuelve las convocatorias que cierren dentro de los próximos 60 días.
7. Muestra los nombres de los equipos de investigación y el total de investigadores en cada equipo.
8. Obtén las publicaciones junto con el nombre de la conferencia o evento académico donde se presentaron.
9. Lista los proyectos que pertenezcan tanto al área de `Artificial Intelligence` como al área de `Medicine`.
10. Devuelve el nombre y correo de los investigadores que lideran proyectos (rol = `principal`).
11. Recupera las patentes que no tengan aún fecha de concesión (`grant_date` nula).
12. Lista los títulos de publicaciones que hayan sido citadas por al menos 3 otras publicaciones.
13. Muestra los laboratorios junto con el nombre de su responsable.
14. Encuentra todos los proyectos cuya fecha estimada de finalización sea mayor que cualquier fecha de finalización real registrada.
15. Devuelve los investigadores que hayan participado en publicaciones con `impact_factor` mayor a 20.
16. Muestra los proyectos que tengan más de un área de conocimiento asociada.
17. Lista los nombres de revisores y las áreas de conocimiento en las que tienen nivel de expertise `high`.
18. Devuelve los proyectos que no tienen financiamiento asociado.
19. Encuentra todas las publicaciones cuyo `title` contenga la palabra `Quantum` (insensible a mayúsculas).
20. Lista los proyectos con presupuesto superior a 2 millones y ordena solo los primeros 5 más altos.
21. Devuelve las citas de publicaciones que refieran a artículos publicados después de 2024-01-01.
22. Muestra los proyectos cuyo presupuesto total sea mayor al presupuesto de todos los proyectos de Google Research.
23. Encuentra los investigadores que hayan sido inventores en al menos una patente y también autores en al menos una publicación.
24. Lista los eventos académicos junto con la cantidad de publicaciones asociadas a cada uno.
25. Devuelve los investigadores cuyo `h_index` sea igual al mayor `h_index` registrado en la base.

---

## Nivel Avanzado (25)

1. Usa una CTE (`WITH`) para listar el total de publicaciones por área de conocimiento y filtra las que tengan más de 10 publicaciones.
2. Encuentra las instituciones que tienen proyectos en áreas de conocimiento distintas a las de sus departamentos.
3. Muestra los investigadores que tengan más citas que cualquier investigador de Harvard University.
4. Genera una consulta que devuelva en formato JSON todas las publicaciones junto con sus autores.
5. Obtén el nombre de los proyectos cuyo presupuesto en USD convertido a EUR (tasa 0.9) sea mayor a 2 millones.
6. Lista los investigadores y calcula la edad de incorporación en años usando funciones de fecha.
7. Devuelve las publicaciones agrupadas por cuartil y calcula el promedio de citas en cada grupo.
8. Obtén el nombre de los proyectos que hayan recibido desembolsos mayores al 50% de su financiamiento total.
9. Usa `EXCEPT` para encontrar los investigadores que son revisores pero no son inventores de patentes.
10. Devuelve los proyectos que tienen al menos un colaborador con `weekly_hours` mayor a 20.
11. Usa `UNION` para combinar en un solo listado el nombre de instituciones y el nombre de equipos de investigación.
12. Obtén los proyectos cuya duración (end_date - start_date) sea mayor a la duración promedio de todos los proyectos.
13. Devuelve los títulos de publicaciones junto con el nombre de su patente relacionada, si existe (join avanzado).
14. Muestra los investigadores que no tienen ningún indicador de impacto asociado (`NOT EXISTS`).
15. Encuentra los proyectos que tengan investigadores con `status = inactive`.
16. Genera un ranking de investigadores por número total de publicaciones usando `ROW_NUMBER()`.
17. Devuelve los eventos académicos que tengan publicaciones con `impact_factor` superior al de todas las publicaciones de `Cancer Cell`.
18. Usa funciones de string para devolver el dominio del correo electrónico de cada investigador.
19. Encuentra las áreas de conocimiento que no estén asociadas a ningún proyecto ni publicación.
20. Genera una consulta que devuelva las convocatorias en formato JSON incluyendo nombre, entidad convocante y presupuesto.
21. Devuelve los proyectos cuyo presupuesto es mayor que la suma de los presupuestos de todos los proyectos de Oxford.
22. Encuentra los investigadores que hayan participado en proyectos en más de un país distinto.
23. Usa `HAVING` para listar las instituciones que tengan más de 3 equipos de investigación activos.
24. Obtén los nombres de los investigadores cuyo `full_name` tenga más de 15 caracteres.
25. Devuelve las publicaciones cuya fecha esté entre la apertura y cierre de su convocatoria de financiamiento.

# Ejercicios SQL – Nivel Avanzado · Análisis (50)

1. Calcular, por institución, el porcentaje del presupuesto total de proyectos que está actualmente en estatus `execution`, y rankear instituciones por ese porcentaje (incluye empate y percentil).
2. Identificar proyectos cuyo monto total de desembolsos acumulados supere el 60% de su financiamiento asignado a la fecha, con la curva mensual de desembolso (serie temporal por proyecto).
3. Detectar investigadores “hub” de coautoría: top 10 por número de coautores distintos en publicaciones, mostrando también el promedio de citas de las publicaciones donde colaboraron.
4. Hallar equipos de investigación cuya productividad (publicaciones asociadas a sus proyectos por millón de presupuesto) esté en el cuartil superior, con métricas por año de inicio del proyecto.
5. Listar convocatorias cuyo presupuesto sea inferior a la suma de los presupuestos de los proyectos que financiaron, incluyendo un indicador de sobrecompromiso (ratio > 1).
6. Construir una tabla pivote de áreas de conocimiento (filas) vs. tipos de proyecto (columnas) con el conteo de proyectos y un total general, ordenada por el total.
7. Determinar la “edad científica” de cada investigador (años desde la primera publicación) y el ritmo de publicación (publicaciones/año), comparándolo contra la mediana de su institución.
8. Encontrar proyectos con retraso: fecha estimada de fin vencida y sin `actual_end_date`, mostrando días de retraso y desviación relativa respecto a la duración planificada.
9. Para cada revista, calcular el impacto promedio ponderado por citas de las publicaciones allí indexadas y obtener el top 5 con al menos 3 artículos.
10. Construir una matriz de coincidencia proyecto–área principal: para cada proyecto, indicar 1 si posee el área (AI, Medicine, Physics, etc.) como principal y 0 en caso contrario (one-hot).
11. Detectar “colisiones” de asignación: investigadores con más de 40 horas semanales sumando todos los proyectos activos, con desglose por rol y semana de incorporación.
12. Identificar laboratorios con “capacidad ociosa” estimada: capacidad – número de investigadores que los usan a través de proyectos activos vinculados al laboratorio.
13. Medir la concentración de financiamiento por institución usando índice de Gini sobre los montos de `fundings` activos.
14. Evaluar la correlación (Spearman) entre `impact_factor` de publicaciones y `total_citations`, reportando rangos y coeficiente aproximado a partir de rankings.
15. Detectar publicaciones outlier en citas del último año usando z-score dentro de su revista, listando solo las que superen |z| ≥ 2.
16. Generar una lista de proyectos “multidisciplinares” (≥ 3 áreas distintas) y su distribución porcentual de áreas (principal vs. secundarias).
17. Construir una vista que muestre, por año, el número de patentes solicitadas y concedidas, la tasa de conversión (grant/apply) y la variación interanual.
18. Obtener la ruta jerárquica completa de cada área (desde `parent_area_id` hasta raíz) y contar profundidad y anchura de la jerarquía.
19. Calcular la tasa de citación anual por investigador: citas totales de sus publicaciones / años desde la primera publicación, comparando con el h-index.
20. Encontrar instituciones con “brecha de talento”: investigadores con h-index superior al percentil 90 global pero con productividad (pubs/año) por debajo del percentil 50.
21. Determinar para cada proyecto si su presupuesto está por encima de **todas** las alternativas dentro del mismo departamento con el mismo `project_type`.
22. Para cada llamada de financiamiento, listar los 3 proyectos con mejor “eficiencia de citas” (citas totales de publicaciones asociadas / presupuesto del proyecto).
23. Construir un ranking de investigadores por “influencia cruzada” (citas recibidas de publicaciones de otras áreas distintas a sus áreas principales).
24. Identificar eventos académicos que concentran publicaciones de más de 4 instituciones distintas y calcular la entropía de diversidad institucional.
25. Hallar proyectos con “riesgo de solapamiento”: mismo PI y periodos que se traslapan ≥ 90 días, incluyendo detalle del intervalo común.
26. Medir el “time-to-publication” promedio desde `start_date` del proyecto hasta la primera publicación asociada; comparar por tipo de proyecto.
27. Encontrar equipos cuya mediana de h-index de sus integrantes supere a la mediana del departamento; devolver la brecha relativa.
28. Detectar patentes sin inventores secundarios y verificar si el PI del proyecto aparece como inventor principal; devolver inconsistencias.
29. Construir cohortes por año de incorporación del investigador y calcular la retención activa por año (sigue con `status = active` y participación en proyectos).
30. Calcular el ROI bibliométrico de cada institución: (citas totales de publicaciones asociadas a sus proyectos) / (presupuesto total de esos proyectos).
31. Generar un “leaderboard” de revisores por promedio de `score` otorgado y tasa de “accepted”, solo con ≥ 5 procesos completados.
32. Identificar áreas subrepresentadas: áreas sin proyectos en los últimos 18 meses pero con publicaciones recientes; devolver lista priorizada.
33. Construir una red de coafiliación a nivel de proyecto (dos instituciones conectan si co-participan en un proyecto) y listar los nodos con mayor grado.
34. Detectar laboratorios cuyo equipamiento mencione términos de alto costo (p. ej., *Cryogenic*, *Electron microscope*, *Laser*) y priorizarlos por capacidad usada/total.
35. Encontrar `fundings` donde la moneda no sea ‘USD’, convertir a USD con una tasa fija provista en una tabla ad-hoc y recalcular totales por institución.
36. Calcular ventanas móviles de 12 meses de desembolsos por proyecto y detectar cambios de tendencia (derivada positiva→negativa).
37. Identificar investigadores con perfiles “T-shaped”: al menos una área principal y ≥ 2 áreas secundarias a través de proyectos o publicaciones.
38. Encontrar publicaciones que citan a otras de la misma institución y medir la proporción de autocitas institucionales por revista.
39. Evaluar consistencia entre `project_type` y `publication.type`: por proyecto, distribución de tipos de publicación y una métrica de alineación (según regla definida).
40. Generar una tabla de “lag time” entre `approval_date` del funding y `disbursement_start_date`, con cuantiles (P25, P50, P75) por convocante.
41. Detectar investigadores con cambios de institución (comparando institución en `researchers` vs. afiliaciones en publicaciones si aparece en `affiliation_institution` de reviewers) y listarlos.
42. Medir la “exposición internacional”: proyectos por país ≠ país de la institución del PI, agregando ratio por institución.
43. Construir un modelo de asignación ideal: repartir `weekly_hours` máximas (cap 40) entre proyectos activos del mismo PI para minimizar solapamiento; devolver brechas actuales.
44. Listar los 20 títulos de publicaciones con mayor *TF-IDF* (aproximado usando frecuencia en títulos y rareza por revista) respecto al corpus total.
45. Comparar el `impact_factor` medio de las publicaciones asociadas a proyectos con laboratorio vs. sin laboratorio; incluir prueba no paramétrica basada en rangos (estadístico).
46. Detectar proyectos “huérfanos” (sin publicaciones ni patentes) 12 meses después de `start_date`, y calcular probabilidad empírica por departamento.
47. Generar perfiles JSON por proyecto que incluyan: título, PI, áreas (lista), laboratorios (lista), publicaciones (array con título y DOI) y total de citas; validar el JSON.
48. Encontrar discrepancias entre *author_order* y contribución: casos donde un investigador con `is_corresponding = 1` no aparece en las primeras 2 posiciones y su contribución no contiene “Supervision” ni “Writing”.
49. Detectar *keyword drift* en títulos: proyectos de AI con publicaciones cuyo título no contiene patrones de AI (regex) y viceversa; reportar tasa de desalineación.
50. Estimar la “velocidad de citación” de cada publicación (citas/año desde `publication_date`) y construir un ranking ajustado por campo (normalización por mediana del área).

