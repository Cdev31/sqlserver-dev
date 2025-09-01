# Sistema de Gestión de Investigación y Publicaciones Académicas

## 🎯 Descripción General

El Sistema de Gestión de Investigación y Publicaciones Académicas es una plataforma integral diseñada para administrar el ciclo completo de la investigación científica. Desde la captación de financiamiento hasta la publicación de resultados y gestión de propiedad intelectual, el sistema centraliza toda la información relacionada con actividades académicas e investigativas.

## 🏢 Entidades Principales

### 1. Investigador (Researcher)
**Descripción:** Representa a los académicos e investigadores del sistema.
**Relaciones:** 
- Pertenece a una Institución y uno o más Departamentos
- Participa en múltiples Proyectos de Investigación
- Es autor de Publicaciones
- Puede ser inventor de Patentes
- Miembro de Equipos de Investigación

### 2. Institución (Institution)
**Descripción:** Organizaciones que albergan la investigación.
**Relaciones:**
- Contiene múltiples Departamentos
- Emplea a Investigadores
- Provee Financiamiento
- Alberga Laboratorios

### 3. Departamento (Department)
**Descripción:** Unidades académicas dentro de las instituciones.
**Relaciones:**
- Pertenece a una Institución
- Agrupa Investigadores
- Alberga Equipos de Investigación

### 4. Proyecto de Investigación (ResearchProject)
**Descripción:** Iniciativas de investigación con objetivos específicos.
**Relaciones:**
- Dirigido por un Investigador principal
- Participan múltiples Investigadores
- Recibe Financiamiento
- Genera Publicaciones y Patentes
- Asociado a Áreas de Conocimiento

### 5. Publicación (Publication)
**Descripción:** Resultados de investigación publicados.
**Relaciones:**
- Autores múltiples (Investigadores)
- Derivada de Proyectos de Investigación
- Presentada en Eventos Académicos
- Evaluada mediante Procesos de Evaluación
- Medida por Indicadores de Impacto

### 6. Financiamiento (Funding)
**Descripción:** Recursos económicos para investigación.
**Relaciones:**
- Asociado a Proyectos de Investigación
- Proveniente de Instituciones o Convocatorias

### 7. Convocatoria (CallForFunding)
**Descripción:** Llamados competitivos para financiamiento.
**Relaciones:**
- Financia múltiples Proyectos
- Define requisitos y plazos específicos

### 8. Área de Conocimiento (KnowledgeArea)
**Descripción:** Categorización temática de la investigación.
**Relaciones:**
- Clasifica Investigadores, Proyectos y Publicaciones
- Organizada jerárquicamente (áreas, subáreas)

### 9. Evento Académico (AcademicEvent)
**Descripción:** Conferencias, congresos y seminarios.
**Relaciones:**
- Presenta múltiples Publicaciones
- Tiene comités científicos (Revisores)

### 10. Patente (Patent)
**Descripción:** Resultados de investigación con protección intelectual.
**Relaciones:**
- Derivada de Proyectos de Investigación
- Inventores múltiples (Investigadores)

### 11. Laboratorio (Laboratory)
**Descripción:** Espacios físicos de investigación.
**Relaciones:**
- Pertenece a un Departamento
- Alberga Proyectos de Investigación

### 12. Equipo de Investigación (ResearchGroup)
**Descripción:** Grupos formales de investigación.
**Relaciones:**
- Agrupa múltiples Investigadores
- Desarrolla Proyectos de Investigación
- Reconocido por Instituciones

### 13. Revisor (Reviewer)
**Descripción:** Expertos para evaluación.
**Relaciones:**
- Evalúa Publicaciones
- Participa en Procesos de Evaluación

### 14. Proceso de Evaluación (ReviewProcess)
**Descripción:** Sistema de peer-review.
**Relaciones:**
- Conecta Revisores con Publicaciones
- Registra decisiones y comentarios

### 15. Indicador de Impacto (ImpactMetric)
**Descripción:** Métricas de rendimiento investigativo.
**Relaciones:**
- Asociado a Publicaciones e Investigadores
- Incluye citas, índice h, factor de impacto

## 🔗 Relaciones entre Entidades

### Relaciones Estructurales
- **Institución → Departamento → Investigador**: Jerarquía organizacional
- **Institución → Laboratorio → Proyecto**: Infraestructura física
- **Equipo de Investigación → Investigador → Proyecto**: Organización humana

### Relaciones de Producción
- **Convocatoria → Financiamiento → Proyecto**: Flujo de recursos
- **Proyecto → Publicación → Impacto**: Ciclo de investigación
- **Proyecto → Patente**: Resultados comerciales

### Relaciones de Evaluación
- **Publicación → Proceso de Evaluación → Revisor**: Control de calidad
- **Investigador → Publicación → Indicador de Impacto**: Medición de desempeño

## ⚙️ Funcionalidades del Sistema

### Gestión de Investigación
- Administración completa del ciclo de vida de proyectos
- Control de financiamiento y presupuestos
- Gestión de recursos físicos (laboratorios)
- Organización de equipos de investigación

### Producción Académica
- Registro y seguimiento de publicaciones
- Gestión de derechos de propiedad intelectual (patentes)
- Organización de participación en eventos académicos

### Evaluación y Métricas
- Sistema de peer-review integrado
- Cálculo automático de indicadores de impacto
- Generación de reportes y analytics
- Evaluación de productividad investigativa

### Clasificación y Organización
- Sistema taxonómico de áreas de conocimiento
- Clasificación de investigadores por especialidad
- Organización jerárquica institucional

## 📋 Estructura JSON de Entidades Clave

### Investigador (Researcher)
```json
{
  "id": "uuid",
  "personal_data": {
    "nombre_completo": "string",
    "email_institucional": "string",
    "orcid_id": "string",
    "titulos_academicos": ["string"]
  },
  "institutional_data": {
    "institucion_id": "uuid",
    "departamentos_ids": ["uuid"],
    "categoria_academica": "string",
    "fecha_incorporacion": "date"
  },
  "research_data": {
    "areas_conocimiento_ids": ["uuid"],
    "equipo_investigacion_id": "uuid",
    "lineas_investigacion": ["string"]
  },
  "metrics": {
    "indice_h": "integer",
    "total_citas": "integer",
    "total_publicaciones": "integer"
  },
  "estado": "activo/inactivo/emerito"
}
```

### Proyecto de Investigación (ResearchProject)
```json
{
  "id": "uuid",
  "metadata": {
    "titulo": "string",
    "codigo_oficial": "string",
    "descripcion": "text",
    "objetivos": ["string"],
    "palabras_clave": ["string"]
  },
  "temporal_data": {
    "fecha_inicio": "date",
    "fecha_fin_estimada": "date",
    "fecha_fin_real": "date",
    "estado": "planificacion/ejecucion/finalizado/cancelado"
  },
  "organization": {
    "investigador_principal_id": "uuid",
    "investigadores_ids": ["uuid"],
    "equipo_investigacion_id": "uuid",
    "laboratorio_id": "uuid",
    "departamento_id": "uuid"
  },
  "classification": {
    "areas_conocimiento_ids": ["uuid"],
    "tipo_proyecto": "basico/aplicado/desarrollo",
    "convocatoria_id": "uuid"
  },
  "financial_data": {
    "presupuesto_total": "decimal",
    "financiamientos_ids": ["uuid"],
    "gastos": [{
      "concepto": "string",
      "monto": "decimal",
      "fecha": "date"
    }]
  },
  "results": {
    "publicaciones_ids": ["uuid"],
    "patentes_ids": ["uuid"]
  }
}
```

### Publicación (Publication)
```json
{
  "id": "uuid",
  "metadata": {
    "titulo": "string",
    "abstract": "text",
    "fecha_publicacion": "date",
    "doi": "string",
    "isbn_issn": "string",
    "paginas": "string",
    "volumen": "string",
    "numero": "string"
  },
  "classification": {
    "tipo": "articulo_revista/libro/capitulo_libro/conferencia",
    "areas_conocimiento_ids": ["uuid"],
    "palabras_clave": ["string"],
    "journal_nombre": "string",
    "evento_academico_id": "uuid"
  },
  "relations": {
    "autores_ids": ["uuid"],
    "proyectos_ids": ["uuid"],
    "citas_ids": ["uuid"]
  },
  "evaluation": {
    "proceso_evaluacion_id": "uuid",
    "indexacion": ["scopus/wos/scielo"],
    "factor_impacto": "decimal",
    "cuartil": "Q1/Q2/Q3/Q4"
  },
  "metrics": {
    "total_citas": "integer",
    "citas_ultimo_ano": "integer"
  }
}
```

### Financiamiento (Funding)
```json
{
  "id": "uuid",
  "metadata": {
    "codigo_contrato": "string",
    "descripcion": "text",
    "tipo_financiamiento": "interno/externo/mixto"
  },
  "financial_data": {
    "monto_total": "decimal",
    "moneda": "string",
    "fecha_aprobacion": "date",
    "fecha_inicio_desembolso": "date",
    "fecha_fin_desembolso": "date"
  },
  "source": {
    "institucion_id": "uuid",
    "convocatoria_id": "uuid",
    "programa_financiamiento": "string"
  },
  "distribution": {
    "proyecto_id": "uuid",
    "desembolsos": [{
      "monto": "decimal",
      "fecha": "date",
      "estado": "pendiente/desembolsado"
    }]
  },
  "conditions": {
    "reportes_requeridos": "integer",
    "fechas_entrega_reportes": ["date"],
    "restricciones_uso": ["string"]
  }
}
```
