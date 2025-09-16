CREATE DATABASE researchManagementDB;
GO

USE researchManagementDB;
GO

CREATE TABLE institutions (
    institution_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('university', 'research_center', 'company', 'governmental')),
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    address TEXT,
    foundation_date DATE,
    website VARCHAR(255),
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
    FOREIGN KEY (institution_id) REFERENCES institutions(institution_id) ON DELETE CASCADE
);

CREATE TABLE researchers (
    researcher_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    institution_id UNIQUEIDENTIFIER NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    institutional_email VARCHAR(255) UNIQUE NOT NULL,
    academic_degree VARCHAR(100),
    orcid_id VARCHAR(25) UNIQUE,
    academic_category VARCHAR(100),
    incorporation_date DATE,
    h_index INT DEFAULT 0,
    total_citations INT DEFAULT 0,
    total_publications INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'emeritus')), 
    creation_date DATETIME DEFAULT GETDATE(),
    modify_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (institution_id) REFERENCES institutions(institution_id) ON DELETE CASCADE
);


CREATE TABLE researcher_departments (
    researcher_department_id INT IDENTITY(1,1) PRIMARY KEY,
    researcher_id UNIQUEIDENTIFIER NOT NULL,
    department_id UNIQUEIDENTIFIER NOT NULL,
    assignment_date DATE DEFAULT GETDATE(),
    is_main BIT DEFAULT 1,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE NO ACTION,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE NO ACTION,
    UNIQUE(researcher_id, department_id)
);

-- Tabla de Áreas de Conocimiento (CORREGIDA la referencia circular)
CREATE TABLE knowledge_areas (
    area_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255) NOT NULL,
    unesco_code VARCHAR(10),
    parent_area_id UNIQUEIDENTIFIER NULL,
    description TEXT,
    level INT DEFAULT 1,
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (parent_area_id) REFERENCES knowledge_areas(area_id) ON DELETE NO ACTION
);

-- Tabla de Equipos de Investigación
CREATE TABLE research_teams (
    team_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    department_id UNIQUEIDENTIFIER NOT NULL,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50),
    creation_date DATE,
    recognition_date DATE,
    main_research_line VARCHAR(255),
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'recognized')),
    creation_date_record DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE NO ACTION
);
GO

-- Tabla de relación Investigadores-Equipos
CREATE TABLE researcher_teams (
    researcher_team_id INT IDENTITY(1,1) PRIMARY KEY,
    researcher_id UNIQUEIDENTIFIER NOT NULL,
    team_id UNIQUEIDENTIFIER NOT NULL,
    role VARCHAR(50) CHECK (role IN ('leader', 'researcher', 'collaborator', 'student')),
    incorporation_date DATE DEFAULT GETDATE(),
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE NO ACTION,
    FOREIGN KEY (team_id) REFERENCES research_teams(team_id) ON DELETE NO ACTION,
    UNIQUE(researcher_id, team_id)
);
GO

-- Tabla de Laboratorios
CREATE TABLE laboratories (
    laboratory_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    department_id UNIQUEIDENTIFIER NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    capacity INT,
    main_equipment TEXT,
    responsible_id UNIQUEIDENTIFIER NOT NULL,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'maintenance')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE,
    FOREIGN KEY (responsible_id) REFERENCES researchers(researcher_id) ON DELETE NO ACTION
);
GO

-- Tabla de Convocatorias
CREATE TABLE funding_calls (
    call_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255) NOT NULL,
    calling_entity VARCHAR(255) NOT NULL,
    funding_type VARCHAR(100),
    total_budget DECIMAL(15,2),
    opening_date DATE,
    closing_date DATE,
    requirements TEXT,
    status VARCHAR(20) DEFAULT 'open' CHECK (status IN ('open', 'closed', 'evaluation', 'finished')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Proyectos de Investigación
CREATE TABLE research_projects (
    project_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    title VARCHAR(500) NOT NULL,
    official_code VARCHAR(100) UNIQUE,
    description TEXT,
    principal_researcher_id UNIQUEIDENTIFIER NOT NULL,
    team_id UNIQUEIDENTIFIER NULL,
    laboratory_id UNIQUEIDENTIFIER NULL,
    department_id UNIQUEIDENTIFIER NOT NULL,
    call_id UNIQUEIDENTIFIER NULL,
    start_date DATE,
    estimated_end_date DATE,
    actual_end_date DATE NULL,
    total_budget DECIMAL(15,2) DEFAULT 0,
    project_type VARCHAR(50) CHECK (project_type IN ('basic', 'applied', 'development', 'innovation')),
    status VARCHAR(50) DEFAULT 'planning' CHECK (status IN ('planning', 'execution', 'finished', 'cancelled', 'suspended')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (principal_researcher_id) REFERENCES researchers(researcher_id) ON DELETE NO ACTION,
    FOREIGN KEY (team_id) REFERENCES research_teams(team_id) ON DELETE SET NULL,
    FOREIGN KEY (laboratory_id) REFERENCES laboratories(laboratory_id) ON DELETE SET NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE NO ACTION,
    FOREIGN KEY (call_id) REFERENCES funding_calls(call_id) ON DELETE SET NULL
);
GO

-- Tabla de relación Investigadores-Proyectos
CREATE TABLE researcher_projects (
    researcher_project_id INT IDENTITY(1,1) PRIMARY KEY,
    researcher_id UNIQUEIDENTIFIER NOT NULL,
    project_id UNIQUEIDENTIFIER NOT NULL,
    role VARCHAR(50) CHECK (role IN ('principal', 'co-researcher', 'collaborator', 'student')),
    weekly_hours INT DEFAULT 0,
    incorporation_date DATE DEFAULT GETDATE(),
    end_date DATE NULL,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES research_projects(project_id) ON DELETE CASCADE,
    UNIQUE(researcher_id, project_id)
);
GO

-- Tabla de relación Proyectos-Áreas Conocimiento
CREATE TABLE project_areas (
    project_area_id INT IDENTITY(1,1) PRIMARY KEY,
    project_id UNIQUEIDENTIFIER NOT NULL,
    area_id UNIQUEIDENTIFIER NOT NULL,
    is_main BIT DEFAULT 0,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (project_id) REFERENCES research_projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES knowledge_areas(area_id) ON DELETE CASCADE,
    UNIQUE(project_id, area_id)
);
GO

-- Tabla de Financiamiento
CREATE TABLE fundings (
    funding_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    project_id UNIQUEIDENTIFIER NOT NULL,
    institution_id UNIQUEIDENTIFIER NOT NULL,
    call_id UNIQUEIDENTIFIER NULL,
    contract_code VARCHAR(100) UNIQUE,
    description TEXT,
    funding_type VARCHAR(50) CHECK (funding_type IN ('internal', 'external', 'mixed')),
    total_amount DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD',
    approval_date DATE,
    disbursement_start_date DATE,
    disbursement_end_date DATE,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'finished', 'suspended')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (project_id) REFERENCES research_projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (institution_id) REFERENCES institutions(institution_id) ON DELETE NO ACTION,
    FOREIGN KEY (call_id) REFERENCES funding_calls(call_id) ON DELETE SET NULL
);
GO

-- Tabla de Desembolsos
CREATE TABLE disbursements (
    disbursement_id INT IDENTITY(1,1) PRIMARY KEY,
    funding_id UNIQUEIDENTIFIER NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    disbursement_date DATE,
    invoice_number VARCHAR(100),
    concept VARCHAR(255),
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'disbursed', 'rejected')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (funding_id) REFERENCES fundings(funding_id) ON DELETE CASCADE
);
GO

-- Tabla de Eventos Académicos
CREATE TABLE academic_events (
    event_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(100) CHECK (type IN ('conference', 'congress', 'seminar', 'workshop', 'symposium')),
    organizer VARCHAR(255),
    country VARCHAR(100),
    city VARCHAR(100),
    start_date DATE,
    end_date DATE,
    website VARCHAR(255),
    status VARCHAR(20) DEFAULT 'planned' CHECK (status IN ('planned', 'completed', 'cancelled')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Publicaciones
CREATE TABLE publications (
    publication_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    title VARCHAR(500) NOT NULL,
    abstract TEXT,
    publication_date DATE,
    doi VARCHAR(100) UNIQUE,
    isbn_issn VARCHAR(20),
    pages VARCHAR(20),
    volume VARCHAR(10),
    number VARCHAR(10),
    journal_name VARCHAR(255),
    event_id UNIQUEIDENTIFIER NULL,
    type VARCHAR(50) CHECK (type IN ('journal_article', 'book', 'book_chapter', 'conference', 'review')),
    indexing VARCHAR(100) CHECK (indexing IN ('scopus', 'wos', 'scielo', 'other')),
    impact_factor DECIMAL(5,3),
    quartile VARCHAR(2) CHECK (quartile IN ('Q1', 'Q2', 'Q3', 'Q4', 'N/A')),
    total_citations INT DEFAULT 0,
    citations_last_year INT DEFAULT 0,
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (event_id) REFERENCES academic_events(event_id) ON DELETE SET NULL
);
GO

-- Tabla de relación Autores-Publicaciones
CREATE TABLE publication_authors (
    publication_author_id INT IDENTITY(1,1) PRIMARY KEY,
    researcher_id UNIQUEIDENTIFIER NOT NULL,
    publication_id UNIQUEIDENTIFIER NOT NULL,
    author_order INT NOT NULL,
    contribution TEXT,
    is_corresponding BIT DEFAULT 0,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE,
    UNIQUE(publication_id, researcher_id),
    UNIQUE(publication_id, author_order)
);
GO

-- Tabla de relación Proyectos-Publicaciones
CREATE TABLE project_publications (
    project_publication_id INT IDENTITY(1,1) PRIMARY KEY,
    project_id UNIQUEIDENTIFIER NOT NULL,
    publication_id UNIQUEIDENTIFIER NOT NULL,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (project_id) REFERENCES research_projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE,
    UNIQUE(project_id, publication_id)
);
GO

-- Tabla de relación Publicaciones-Áreas Conocimiento
CREATE TABLE publication_areas (
    publication_area_id INT IDENTITY(1,1) PRIMARY KEY,
    publication_id UNIQUEIDENTIFIER NOT NULL,
    area_id UNIQUEIDENTIFIER NOT NULL,
    is_main BIT DEFAULT 0,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES knowledge_areas(area_id) ON DELETE CASCADE,
    UNIQUE(publication_id, area_id)
);
GO

-- Tabla de Citas entre Publicaciones
CREATE TABLE publication_citations (
    citation_id INT IDENTITY(1,1) PRIMARY KEY,
    citing_publication_id UNIQUEIDENTIFIER NOT NULL,
    cited_publication_id UNIQUEIDENTIFIER NOT NULL,
    context TEXT,
    citation_date DATE,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (citing_publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE,
    FOREIGN KEY (cited_publication_id) REFERENCES publications(publication_id) ON DELETE NO ACTION,
    UNIQUE(citing_publication_id, cited_publication_id)
);
GO

-- Tabla de Patentes
CREATE TABLE patents (
    patent_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    title VARCHAR(500) NOT NULL,
    patent_number VARCHAR(100) UNIQUE,
    description TEXT,
    application_date DATE,
    grant_date DATE,
    country VARCHAR(100),
    patent_office VARCHAR(100),
    status VARCHAR(50) CHECK (status IN ('applied', 'granted', 'expired', 'rejected')),
    project_id UNIQUEIDENTIFIER NOT NULL,
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (project_id) REFERENCES research_projects(project_id) ON DELETE CASCADE
);
GO

-- Tabla de Inventores de Patentes
CREATE TABLE patent_inventors (
    patent_inventor_id INT IDENTITY(1,1) PRIMARY KEY,
    researcher_id UNIQUEIDENTIFIER NOT NULL,
    patent_id UNIQUEIDENTIFIER NOT NULL,
    inventor_order INT NOT NULL,
    contribution TEXT,
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    FOREIGN KEY (patent_id) REFERENCES patents(patent_id) ON DELETE CASCADE,
    UNIQUE(patent_id, researcher_id),
    UNIQUE(patent_id, inventor_order)
);
GO

-- Tabla de Revisores
CREATE TABLE reviewers (
    reviewer_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    researcher_id UNIQUEIDENTIFIER NOT NULL,
    expertise_areas TEXT,
    affiliation_institution VARCHAR(255),
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    UNIQUE(researcher_id)
);
GO

-- Tabla de Procesos de Evaluación
CREATE TABLE review_processes (
    process_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    publication_id UNIQUEIDENTIFIER NOT NULL,
    reviewer_id UNIQUEIDENTIFIER NOT NULL,
    assignment_date DATE,
    deadline_date DATE,
    completion_date DATE NULL,
    comments TEXT,
    decision VARCHAR(50) CHECK (decision IN ('accepted', 'rejected', 'minor_revision', 'major_revision', 'pending')),
    score INT CHECK (score >= 0 AND score <= 5),
    creation_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(reviewer_id) ON DELETE NO ACTION,
    UNIQUE(publication_id, reviewer_id)
);
GO

-- Tabla de relación Revisores-Áreas Conocimiento
CREATE TABLE reviewer_areas (
    reviewer_area_id INT IDENTITY(1,1) PRIMARY KEY,
    reviewer_id UNIQUEIDENTIFIER NOT NULL,
    area_id UNIQUEIDENTIFIER NOT NULL,
    expertise_level VARCHAR(20) CHECK (expertise_level IN ('high', 'medium', 'low')),
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(reviewer_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES knowledge_areas(area_id) ON DELETE CASCADE,
    UNIQUE(reviewer_id, area_id)
);
GO

-- Tabla de Indicadores de Impacto
CREATE TABLE impact_indicators (
    indicator_id INT IDENTITY(1,1) PRIMARY KEY,
    researcher_id UNIQUEIDENTIFIER NULL,
    publication_id UNIQUEIDENTIFIER NULL,
    indicator_type VARCHAR(50) CHECK (indicator_type IN ('citations', 'h_index', 'impact_factor', 'altmetrics')),
    value DECIMAL(10,2),
    measurement_date DATE,
    source VARCHAR(100),
    creation_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (researcher_id) REFERENCES researchers(researcher_id) ON DELETE CASCADE,
    FOREIGN KEY (publication_id) REFERENCES publications(publication_id) ON DELETE CASCADE,
    CHECK (researcher_id IS NOT NULL OR publication_id IS NOT NULL)
);
GO
