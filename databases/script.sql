CREATE DATABASE ResearchManagementDB;
GO

USE ResearchManagementDB;
GO

-- Habilitar la extensión para UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE institutions (
    institution_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (tipo IN ('universidad', 'centro_investigacion', 'empresa', 'gubernamental')),
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    address TEXT,
    foundation_date DATE,
    web_sities VARCHAR(255),
    creation_date DATETIME DEFAULT GETDATE(),
    modify_date DATETIME DEFAULT GETDATE()
);

CREATE TABLE departments (
    department_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    institution_id UNIQUEIDENTIFIER NOT NULL,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    creation_date DATETIME DEFAULT GETDATE(),
    modify_date DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_INSTITUTION_ID FOREIGN KEY (institution_id) REFERENCES institutions(institution_id) ON DELETE CASCADE
);

CREATE TABLE researchers (
    research_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    institution_id UNIQUEIDENTIFIER NOT NULL,
    completed_name VARCHAR(255) NOT NULL,
    institutional_email VARCHAR(255) UNIQUE NOT NULL,
    academic_degree VARCHAR(100),
    orcid_id VARCHAR(25) UNIQUE,
    academic_category VARCHAR(100),
    incorporation_date DATE,
    index_h INT DEFAULT 0,
    total_citation INT DEFAULT 0,
    total_publications INT DEFAULT 0,
    state VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'inactivo', 'emerito')),
    creation_date DATETIME DEFAULT GETDATE(),
    modify_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (institution_id) REFERENCES institutions(institution_id) ON DELETE CASCADE
);

-- Tabla de relación Investigadores-Departamentos
CREATE TABLE investigadores_departamentos (
    investigador_departamento_id INT IDENTITY(1,1) PRIMARY KEY,
    investigador_id UNIQUEIDENTIFIER NOT NULL,
    departamento_id UNIQUEIDENTIFIER NOT NULL,
    fecha_asignacion DATE DEFAULT GETDATE(),
    es_principal BIT DEFAULT 1,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id) ON DELETE CASCADE,
    UNIQUE(investigador_id, departamento_id)
);
GO

-- Tabla de Áreas de Conocimiento
CREATE TABLE areas_conocimiento (
    area_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    nombre VARCHAR(255) NOT NULL,
    codigo_unesco VARCHAR(10),
    area_padre_id UNIQUEIDENTIFIER NULL,
    descripcion TEXT,
    nivel INT DEFAULT 1,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (area_padre_id) REFERENCES areas_conocimiento(area_id) ON DELETE SET NULL
);
GO

-- Tabla de Equipos de Investigación
CREATE TABLE equipos_investigacion (
    equipo_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    departamento_id UNIQUEIDENTIFIER NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    codigo VARCHAR(50),
    fecha_creacion DATE,
    fecha_reconocimiento DATE,
    linea_investigacion_principal VARCHAR(255),
    estado VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'inactivo', 'reconocido')),
    fecha_creacion_registro DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id) ON DELETE CASCADE
);
GO

-- Tabla de relación Investigadores-Equipos
CREATE TABLE investigadores_equipos (
    investigador_equipo_id INT IDENTITY(1,1) PRIMARY KEY,
    investigador_id UNIQUEIDENTIFIER NOT NULL,
    equipo_id UNIQUEIDENTIFIER NOT NULL,
    rol VARCHAR(50) CHECK (rol IN ('líder', 'investigador', 'colaborador', 'estudiante')),
    fecha_incorporacion DATE DEFAULT GETDATE(),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    FOREIGN KEY (equipo_id) REFERENCES equipos_investigacion(equipo_id) ON DELETE CASCADE,
    UNIQUE(investigador_id, equipo_id)
);
GO

-- Tabla de Laboratorios
CREATE TABLE laboratorios (
    laboratorio_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    departamento_id UNIQUEIDENTIFIER NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    capacidad INT,
    equipamiento_principal TEXT,
    responsable_id UNIQUEIDENTIFIER NOT NULL,
    estado VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'inactivo', 'mantenimiento')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id) ON DELETE CASCADE,
    FOREIGN KEY (responsable_id) REFERENCES investigadores(investigador_id) ON DELETE NO ACTION
);
GO

-- Tabla de Convocatorias
CREATE TABLE convocatorias (
    convocatoria_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    nombre VARCHAR(255) NOT NULL,
    entidad_convocante VARCHAR(255) NOT NULL,
    tipo_financiamiento VARCHAR(100),
    presupuesto_total DECIMAL(15,2),
    fecha_apertura DATE,
    fecha_cierre DATE,
    requisitos TEXT,
    estado VARCHAR(20) DEFAULT 'abierta' CHECK (estado IN ('abierta', 'cerrada', 'evaluacion', 'finalizada')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Proyectos de Investigación
CREATE TABLE proyectos_investigacion (
    proyecto_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    titulo VARCHAR(500) NOT NULL,
    codigo_oficial VARCHAR(100) UNIQUE,
    descripcion TEXT,
    investigador_principal_id UNIQUEIDENTIFIER NOT NULL,
    equipo_id UNIQUEIDENTIFIER NULL,
    laboratorio_id UNIQUEIDENTIFIER NULL,
    departamento_id UNIQUEIDENTIFIER NOT NULL,
    convocatoria_id UNIQUEIDENTIFIER NULL,
    fecha_inicio DATE,
    fecha_fin_estimada DATE,
    fecha_fin_real DATE NULL,
    presupuesto_total DECIMAL(15,2) DEFAULT 0,
    tipo_proyecto VARCHAR(50) CHECK (tipo_proyecto IN ('basico', 'aplicado', 'desarrollo', 'innovacion')),
    estado VARCHAR(50) DEFAULT 'planificacion' CHECK (estado IN ('planificacion', 'ejecucion', 'finalizado', 'cancelado', 'suspendido')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_principal_id) REFERENCES investigadores(investigador_id) ON DELETE NO ACTION,
    FOREIGN KEY (equipo_id) REFERENCES equipos_investigacion(equipo_id) ON DELETE SET NULL,
    FOREIGN KEY (laboratorio_id) REFERENCES laboratorios(laboratorio_id) ON DELETE SET NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id) ON DELETE NO ACTION,
    FOREIGN KEY (convocatoria_id) REFERENCES convocatorias(convocatoria_id) ON DELETE SET NULL
);
GO

-- Tabla de relación Investigadores-Proyectos
CREATE TABLE investigadores_proyectos (
    investigador_proyecto_id INT IDENTITY(1,1) PRIMARY KEY,
    investigador_id UNIQUEIDENTIFIER NOT NULL,
    proyecto_id UNIQUEIDENTIFIER NOT NULL,
    rol VARCHAR(50) CHECK (rol IN ('principal', 'co-investigador', 'colaborador', 'estudiante')),
    horas_semanales INT DEFAULT 0,
    fecha_incorporacion DATE DEFAULT GETDATE(),
    fecha_baja DATE NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_investigacion(proyecto_id) ON DELETE CASCADE,
    UNIQUE(investigador_id, proyecto_id)
);
GO

-- Tabla de relación Proyectos-Áreas Conocimiento
CREATE TABLE proyectos_areas (
    proyecto_area_id INT IDENTITY(1,1) PRIMARY KEY,
    proyecto_id UNIQUEIDENTIFIER NOT NULL,
    area_id UNIQUEIDENTIFIER NOT NULL,
    es_principal BIT DEFAULT 0,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_investigacion(proyecto_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES areas_conocimiento(area_id) ON DELETE CASCADE,
    UNIQUE(proyecto_id, area_id)
);
GO

-- Tabla de Financiamiento
CREATE TABLE financiamientos (
    financiamiento_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    proyecto_id UNIQUEIDENTIFIER NOT NULL,
    institucion_id UNIQUEIDENTIFIER NOT NULL,
    convocatoria_id UNIQUEIDENTIFIER NULL,
    codigo_contrato VARCHAR(100) UNIQUE,
    descripcion TEXT,
    tipo_financiamiento VARCHAR(50) CHECK (tipo_financiamiento IN ('interno', 'externo', 'mixto')),
    monto_total DECIMAL(15,2) NOT NULL,
    moneda VARCHAR(3) DEFAULT 'USD',
    fecha_aprobacion DATE,
    fecha_inicio_desembolso DATE,
    fecha_fin_desembolso DATE,
    estado VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'finalizado', 'suspendido')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_investigacion(proyecto_id) ON DELETE CASCADE,
    FOREIGN KEY (institucion_id) REFERENCES instituciones(institucion_id) ON DELETE NO ACTION,
    FOREIGN KEY (convocatoria_id) REFERENCES convocatorias(convocatoria_id) ON DELETE SET NULL
);
GO

-- Tabla de Desembolsos
CREATE TABLE desembolsos (
    desembolso_id INT IDENTITY(1,1) PRIMARY KEY,
    financiamiento_id UNIQUEIDENTIFIER NOT NULL,
    monto DECIMAL(15,2) NOT NULL,
    fecha_desembolso DATE,
    numero_factura VARCHAR(100),
    concepto VARCHAR(255),
    estado VARCHAR(20) DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'desembolsado', 'rechazado')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (financiamiento_id) REFERENCES financiamientos(financiamiento_id) ON DELETE CASCADE
);
GO

-- Tabla de Eventos Académicos
CREATE TABLE eventos_academicos (
    evento_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    nombre VARCHAR(255) NOT NULL,
    tipo VARCHAR(100) CHECK (tipo IN ('conferencia', 'congreso', 'seminario', 'workshop', 'simposio')),
    organizador VARCHAR(255),
    pais VARCHAR(100),
    ciudad VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    sitio_web VARCHAR(255),
    estado VARCHAR(20) DEFAULT 'planificado' CHECK (estado IN ('planificado', 'realizado', 'cancelado')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Publicaciones
CREATE TABLE publicaciones (
    publicacion_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    titulo VARCHAR(500) NOT NULL,
    abstract TEXT,
    fecha_publicacion DATE,
    doi VARCHAR(100) UNIQUE,
    isbn_issn VARCHAR(20),
    paginas VARCHAR(20),
    volumen VARCHAR(10),
    numero VARCHAR(10),
    journal_nombre VARCHAR(255),
    evento_id UNIQUEIDENTIFIER NULL,
    tipo VARCHAR(50) CHECK (tipo IN ('articulo_revista', 'libro', 'capitulo_libro', 'conferencia', 'revision')),
    indexacion VARCHAR(100) CHECK (indexacion IN ('scopus', 'wos', 'scielo', 'otro')),
    factor_impacto DECIMAL(5,3),
    cuartil VARCHAR(2) CHECK (cuartil IN ('Q1', 'Q2', 'Q3', 'Q4', 'N/A')),
    total_citas INT DEFAULT 0,
    citas_ultimo_ano INT DEFAULT 0,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (evento_id) REFERENCES eventos_academicos(evento_id) ON DELETE SET NULL
);
GO

-- Tabla de relación Autores-Publicaciones
CREATE TABLE autores_publicaciones (
    autor_publicacion_id INT IDENTITY(1,1) PRIMARY KEY,
    investigador_id UNIQUEIDENTIFIER NOT NULL,
    publicacion_id UNIQUEIDENTIFIER NOT NULL,
    orden_autor INT NOT NULL,
    contribucion TEXT,
    correspondiente BIT DEFAULT 0,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    UNIQUE(publicacion_id, investigador_id),
    UNIQUE(publicacion_id, orden_autor)
);
GO

-- Tabla de relación Proyectos-Publicaciones
CREATE TABLE proyectos_publicaciones (
    proyecto_publicacion_id INT IDENTITY(1,1) PRIMARY KEY,
    proyecto_id UNIQUEIDENTIFIER NOT NULL,
    publicacion_id UNIQUEIDENTIFIER NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_investigacion(proyecto_id) ON DELETE CASCADE,
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    UNIQUE(proyecto_id, publicacion_id)
);
GO

-- Tabla de relación Publicaciones-Áreas Conocimiento
CREATE TABLE publicaciones_areas (
    publicacion_area_id INT IDENTITY(1,1) PRIMARY KEY,
    publicacion_id UNIQUEIDENTIFIER NOT NULL,
    area_id UNIQUEIDENTIFIER NOT NULL,
    es_principal BIT DEFAULT 0,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES areas_conocimiento(area_id) ON DELETE CASCADE,
    UNIQUE(publicacion_id, area_id)
);
GO

-- Tabla de Citas entre Publicaciones
CREATE TABLE citas_publicaciones (
    cita_id INT IDENTITY(1,1) PRIMARY KEY,
    publicacion_citante_id UNIQUEIDENTIFIER NOT NULL,
    publicacion_citada_id UNIQUEIDENTIFIER NOT NULL,
    contexto TEXT,
    fecha_cita DATE,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (publicacion_citante_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    FOREIGN KEY (publicacion_citada_id) REFERENCES publicaciones(publicacion_id) ON DELETE NO ACTION,
    UNIQUE(publicacion_citante_id, publicacion_citada_id)
);
GO

-- Tabla de Patentes
CREATE TABLE patentes (
    patente_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    titulo VARCHAR(500) NOT NULL,
    numero_patente VARCHAR(100) UNIQUE,
    descripcion TEXT,
    fecha_solicitud DATE,
    fecha_concesion DATE,
    pais VARCHAR(100),
    oficina_patentes VARCHAR(100),
    estado VARCHAR(50) CHECK (estado IN ('solicitada', 'concedida', 'expirada', 'rechazada')),
    proyecto_id UNIQUEIDENTIFIER NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_investigacion(proyecto_id) ON DELETE CASCADE
);
GO

-- Tabla de Inventores de Patentes
CREATE TABLE inventores_patentes (
    inventor_patente_id INT IDENTITY(1,1) PRIMARY KEY,
    investigador_id UNIQUEIDENTIFIER NOT NULL,
    patente_id UNIQUEIDENTIFIER NOT NULL,
    orden_inventor INT NOT NULL,
    contribucion TEXT,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    FOREIGN KEY (patente_id) REFERENCES patentes(patente_id) ON DELETE CASCADE,
    UNIQUE(patente_id, investigador_id),
    UNIQUE(patente_id, orden_inventor)
);
GO

-- Tabla de Revisores
CREATE TABLE revisores (
    revisor_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    investigador_id UNIQUEIDENTIFIER NOT NULL,
    areas_expertise TEXT,
    institucion_afiliacion VARCHAR(255),
    estado VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'inactivo')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    UNIQUE(investigador_id)
);
GO

-- Tabla de Procesos de Evaluación
CREATE TABLE procesos_evaluacion (
    proceso_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    publicacion_id UNIQUEIDENTIFIER NOT NULL,
    revisor_id UNIQUEIDENTIFIER NOT NULL,
    fecha_asignacion DATE,
    fecha_limite DATE,
    fecha_completado DATE NULL,
    comentarios TEXT,
    decision VARCHAR(50) CHECK (decision IN ('aceptado', 'rechazado', 'revision_minor', 'revision_major', 'pendiente')),
    puntuacion INT CHECK (puntuacion >= 1 AND puntuacion <= 5),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    FOREIGN KEY (revisor_id) REFERENCES revisores(revisor_id) ON DELETE NO ACTION,
    UNIQUE(publicacion_id, revisor_id)
);
GO

-- Tabla de relación Revisores-Áreas Conocimiento
CREATE TABLE revisores_areas (
    revisor_area_id INT IDENTITY(1,1) PRIMARY KEY,
    revisor_id UNIQUEIDENTIFIER NOT NULL,
    area_id UNIQUEIDENTIFIER NOT NULL,
    nivel_expertise VARCHAR(20) CHECK (nivel_expertise IN ('alto', 'medio', 'bajo')),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (revisor_id) REFERENCES revisores(revisor_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES areas_conocimiento(area_id) ON DELETE CASCADE,
    UNIQUE(revisor_id, area_id)
);
GO

-- Tabla de Indicadores de Impacto
CREATE TABLE indicadores_impacto (
    indicador_id INT IDENTITY(1,1) PRIMARY KEY,
    investigador_id UNIQUEIDENTIFIER NULL,
    publicacion_id UNIQUEIDENTIFIER NULL,
    tipo_indicador VARCHAR(50) CHECK (tipo_indicador IN ('citas', 'indice_h', 'factor_impacto', 'altmetrics')),
    valor DECIMAL(10,2),
    fecha_medicion DATE,
    fuente VARCHAR(100),
    fecha_creacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (investigador_id) REFERENCES investigadores(investigador_id) ON DELETE CASCADE,
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(publicacion_id) ON DELETE CASCADE,
    CHECK (investigador_id IS NOT NULL OR publicacion_id IS NOT NULL)
);
