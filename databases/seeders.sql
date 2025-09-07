USE ResearchManagementDB;
GO

-- 1. Insertar instituciones
INSERT INTO institutions (institution_id, name, type, country, city, address, foundation_date, website)
VALUES 
(NEWID(), 'Harvard University', 'university', 'USA', 'Cambridge', 'Massachusetts Hall, Cambridge, MA 02138', '1636-09-08', 'https://www.harvard.edu'),
(NEWID(), 'MIT', 'university', 'USA', 'Cambridge', '77 Massachusetts Ave, Cambridge, MA 02139', '1861-04-10', 'https://www.mit.edu'),
(NEWID(), 'Stanford University', 'university', 'USA', 'Stanford', '450 Serra Mall, Stanford, CA 94305', '1885-11-11', 'https://www.stanford.edu'),
(NEWID(), 'Max Planck Institute', 'research_center', 'Germany', 'Munich', 'Hofgartenstraße 8, 80539 München', '1948-02-26', 'https://www.mpg.de'),
(NEWID(), 'Google Research', 'company', 'USA', 'Mountain View', '1600 Amphitheatre Parkway, Mountain View, CA', '1998-09-04', 'https://research.google'),
(NEWID(), 'NIH', 'governmental', 'USA', 'Bethesda', '9000 Rockville Pike, Bethesda, MD 20892', '1887-08-08', 'https://www.nih.gov'),
(NEWID(), 'University of Oxford', 'university', 'UK', 'Oxford', 'University Offices, Wellington Square, Oxford OX1 2JD', '1096-01-01', 'https://www.ox.ac.uk'),
(NEWID(), 'ETH Zurich', 'university', 'Switzerland', 'Zurich', 'Rämistrasse 101, 8092 Zürich', '1855-02-07', 'https://www.ethz.ch'),
(NEWID(), 'Pasteur Institute', 'research_center', 'France', 'Paris', '28 Rue du Docteur Roux, 75015 Paris', '1887-06-04', 'https://www.pasteur.fr'),
(NEWID(), 'NASA', 'governmental', 'USA', 'Washington', '300 E St SW, Washington, DC 20546', '1958-07-29', 'https://www.nasa.gov');
GO

-- Declarar variables para almacenar IDs de instituciones
DECLARE @harvard_id UNIQUEIDENTIFIER, @mit_id UNIQUEIDENTIFIER, @stanford_id UNIQUEIDENTIFIER, @maxplanck_id UNIQUEIDENTIFIER, @google_id UNIQUEIDENTIFIER;
DECLARE @nih_id UNIQUEIDENTIFIER, @oxford_id UNIQUEIDENTIFIER, @eth_id UNIQUEIDENTIFIER, @pasteur_id UNIQUEIDENTIFIER, @nasa_id UNIQUEIDENTIFIER;

SELECT @harvard_id = institution_id FROM institutions WHERE name = 'Harvard University';
SELECT @mit_id = institution_id FROM institutions WHERE name = 'MIT';
SELECT @stanford_id = institution_id FROM institutions WHERE name = 'Stanford University';
SELECT @maxplanck_id = institution_id FROM institutions WHERE name = 'Max Planck Institute';
SELECT @google_id = institution_id FROM institutions WHERE name = 'Google Research';
SELECT @nih_id = institution_id FROM institutions WHERE name = 'NIH';
SELECT @oxford_id = institution_id FROM institutions WHERE name = 'University of Oxford';
SELECT @eth_id = institution_id FROM institutions WHERE name = 'ETH Zurich';
SELECT @pasteur_id = institution_id FROM institutions WHERE name = 'Pasteur Institute';
SELECT @nasa_id = institution_id FROM institutions WHERE name = 'NASA';

-- 2. Insertar departamentos
INSERT INTO departments (department_id, institution_id, name, code, phone_number, email)
VALUES
(NEWID(), @harvard_id, 'Computer Science', 'CS', '+1-617-495-1000', 'cs@harvard.edu'),
(NEWID(), @harvard_id, 'Biology', 'BIO', '+1-617-495-2000', 'bio@harvard.edu'),
(NEWID(), @mit_id, 'Electrical Engineering', 'EE', '+1-617-253-1000', 'ee@mit.edu'),
(NEWID(), @mit_id, 'Physics', 'PHY', '+1-617-253-2000', 'physics@mit.edu'),
(NEWID(), @stanford_id, 'Medicine', 'MED', '+1-650-723-1000', 'medicine@stanford.edu'),
(NEWID(), @stanford_id, 'Chemistry', 'CHEM', '+1-650-723-2000', 'chemistry@stanford.edu'),
(NEWID(), @maxplanck_id, 'Quantum Optics', 'QO', '+49-89-2108-1000', 'quantum@mpg.de'),
(NEWID(), @google_id, 'AI Research', 'AI', '+1-650-253-0000', 'ai-research@google.com'),
(NEWID(), @nih_id, 'Infectious Diseases', 'ID', '+1-301-496-4000', 'infectious@nih.gov'),
(NEWID(), @oxford_id, 'Mathematics', 'MATH', '+44-1865-270000', 'maths@ox.ac.uk');


-- Declarar variables para departamentos
DECLARE @harvard_cs_id UNIQUEIDENTIFIER, @harvard_bio_id UNIQUEIDENTIFIER, @mit_ee_id UNIQUEIDENTIFIER, @mit_phy_id UNIQUEIDENTIFIER, @stanford_med_id UNIQUEIDENTIFIER;
DECLARE @stanford_chem_id UNIQUEIDENTIFIER, @mpg_qo_id UNIQUEIDENTIFIER, @google_ai_id UNIQUEIDENTIFIER, @nih_id_id UNIQUEIDENTIFIER, @oxford_math_id UNIQUEIDENTIFIER;

SELECT @harvard_cs_id = department_id FROM departments WHERE name = 'Computer Science' AND institution_id = @harvard_id;
SELECT @harvard_bio_id = department_id FROM departments WHERE name = 'Biology' AND institution_id = @harvard_id;
SELECT @mit_ee_id = department_id FROM departments WHERE name = 'Electrical Engineering' AND institution_id = @mit_id;
SELECT @mit_phy_id = department_id FROM departments WHERE name = 'Physics' AND institution_id = @mit_id;
SELECT @stanford_med_id = department_id FROM departments WHERE name = 'Medicine' AND institution_id = @stanford_id;
SELECT @stanford_chem_id = department_id FROM departments WHERE name = 'Chemistry' AND institution_id = @stanford_id;
SELECT @mpg_qo_id = department_id FROM departments WHERE name = 'Quantum Optics' AND institution_id = @maxplanck_id;
SELECT @google_ai_id = department_id FROM departments WHERE name = 'AI Research' AND institution_id = @google_id;
SELECT @nih_id_id = department_id FROM departments WHERE name = 'Infectious Diseases' AND institution_id = @nih_id;
SELECT @oxford_math_id = department_id FROM departments WHERE name = 'Mathematics' AND institution_id = @oxford_id;

-- 3. Insertar investigadores
INSERT INTO researchers (researcher_id, institution_id, full_name, institutional_email, academic_degree, orcid_id, academic_category, incorporation_date, h_index, total_citations, total_publications)
VALUES
(NEWID(), @harvard_id, 'Dr. Sarah Chen', 'schen@harvard.edu', 'PhD', '0000-0001-2345-6789', 'Professor', '2010-09-01', 42, 8500, 120),
(NEWID(), @mit_id, 'Prof. Michael Rodriguez', 'mrodriguez@mit.edu', 'PhD', '0000-0002-3456-7890', 'Full Professor', '2005-03-15', 38, 7200, 95),
(NEWID(), @stanford_id, 'Dr. Emily Watson', 'ewatson@stanford.edu', 'MD PhD', '0000-0003-4567-8901', 'Associate Professor', '2015-01-10', 28, 4500, 65),
(NEWID(), @maxplanck_id, 'Prof. Klaus Schmidt', 'kschmidt@mpg.de', 'PhD', '0000-0004-5678-9012', 'Director', '2000-06-01', 55, 12500, 180),
(NEWID(), @google_id, 'Dr. Jennifer Kim', 'jkim@google.com', 'PhD', '0000-0005-6789-0123', 'Senior Researcher', '2018-08-20', 22, 3200, 45),
(NEWID(), @nih_id, 'Dr. Robert Johnson', 'rjohnson@nih.gov', 'MD', '0000-0006-7890-1234', 'Research Fellow', '2019-04-05', 18, 2100, 32),
(NEWID(), @oxford_id, 'Prof. James Wilson', 'jwilson@ox.ac.uk', 'PhD', '0000-0007-8901-2345', 'Professor', '2008-10-15', 35, 6800, 88),
(NEWID(), @eth_id, 'Dr. Anna Müller', 'amueller@ethz.ch', 'PhD', '0000-0008-9012-3456', 'Assistant Professor', '2017-02-28', 20, 2800, 38),
(NEWID(), @pasteur_id, 'Dr. Pierre Dubois', 'pdubois@pasteur.fr', 'PhD', '0000-0009-0123-4567', 'Research Director', '2012-07-12', 31, 5200, 72),
(NEWID(), @nasa_id, 'Dr. Maria Gonzalez', 'mgonzalez@nasa.gov', 'PhD', '0000-0010-1234-5678', 'Lead Scientist', '2014-11-30', 26, 4100, 58);


-- Declarar variables para investigadores
DECLARE @sarah_id UNIQUEIDENTIFIER, @michael_id UNIQUEIDENTIFIER, @emily_id UNIQUEIDENTIFIER, @klaus_id UNIQUEIDENTIFIER, @jennifer_id UNIQUEIDENTIFIER;
DECLARE @robert_id UNIQUEIDENTIFIER, @james_id UNIQUEIDENTIFIER, @anna_id UNIQUEIDENTIFIER, @pierre_id UNIQUEIDENTIFIER, @maria_id UNIQUEIDENTIFIER;

SELECT @sarah_id = researcher_id FROM researchers WHERE full_name = 'Dr. Sarah Chen';
SELECT @michael_id = researcher_id FROM researchers WHERE full_name = 'Prof. Michael Rodriguez';
SELECT @emily_id = researcher_id FROM researchers WHERE full_name = 'Dr. Emily Watson';
SELECT @klaus_id = researcher_id FROM researchers WHERE full_name = 'Prof. Klaus Schmidt';
SELECT @jennifer_id = researcher_id FROM researchers WHERE full_name = 'Dr. Jennifer Kim';
SELECT @robert_id = researcher_id FROM researchers WHERE full_name = 'Dr. Robert Johnson';
SELECT @james_id = researcher_id FROM researchers WHERE full_name = 'Prof. James Wilson';
SELECT @anna_id = researcher_id FROM researchers WHERE full_name = 'Dr. Anna Müller';
SELECT @pierre_id = researcher_id FROM researchers WHERE full_name = 'Dr. Pierre Dubois';
SELECT @maria_id = researcher_id FROM researchers WHERE full_name = 'Dr. Maria Gonzalez';

-- 4. Insertar áreas de conocimiento
INSERT INTO knowledge_areas (area_id, name, unesco_code, parent_area_id, description, level)
VALUES
(NEWID(), 'Computer Science', '1203', NULL, 'Study of computers and computational systems', 1),
(NEWID(), 'Artificial Intelligence', '1203.04', (SELECT area_id FROM knowledge_areas WHERE name = 'Computer Science'), 'Development of intelligent machines', 2),
(NEWID(), 'Medicine', '3200', NULL, 'Science and practice of diagnosis and treatment', 1),
(NEWID(), 'Oncology', '3201.07', (SELECT area_id FROM knowledge_areas WHERE name = 'Medicine'), 'Study and treatment of cancer', 2),
(NEWID(), 'Physics', '2200', NULL, 'Study of matter, energy, and their interactions', 1),
(NEWID(), 'Quantum Mechanics', '2207.02', (SELECT area_id FROM knowledge_areas WHERE name = 'Physics'), 'Study of particles at quantum level', 2),
(NEWID(), 'Biology', '2400', NULL, 'Study of living organisms', 1),
(NEWID(), 'Genetics', '2409.01', (SELECT area_id FROM knowledge_areas WHERE name = 'Biology'), 'Study of genes and heredity', 2),
(NEWID(), 'Mathematics', '1201', NULL, 'Study of numbers, quantities, and shapes', 1),
(NEWID(), 'Statistics', '1201.08', (SELECT area_id FROM knowledge_areas WHERE name = 'Mathematics'), 'Collection and analysis of numerical data', 2);

-- Declarar variables para áreas de conocimiento
DECLARE @cs_area_id UNIQUEIDENTIFIER, @ai_area_id UNIQUEIDENTIFIER, @med_area_id UNIQUEIDENTIFIER, @onco_area_id UNIQUEIDENTIFIER, @phy_area_id UNIQUEIDENTIFIER;
DECLARE @quantum_area_id UNIQUEIDENTIFIER, @bio_area_id UNIQUEIDENTIFIER, @genetics_area_id UNIQUEIDENTIFIER, @math_area_id UNIQUEIDENTIFIER, @stats_area_id UNIQUEIDENTIFIER;

SELECT @cs_area_id = area_id FROM knowledge_areas WHERE name = 'Computer Science';
SELECT @ai_area_id = area_id FROM knowledge_areas WHERE name = 'Artificial Intelligence';
SELECT @med_area_id = area_id FROM knowledge_areas WHERE name = 'Medicine';
SELECT @onco_area_id = area_id FROM knowledge_areas WHERE name = 'Oncology';
SELECT @phy_area_id = area_id FROM knowledge_areas WHERE name = 'Physics';
SELECT @quantum_area_id = area_id FROM knowledge_areas WHERE name = 'Quantum Mechanics';
SELECT @bio_area_id = area_id FROM knowledge_areas WHERE name = 'Biology';
SELECT @genetics_area_id = area_id FROM knowledge_areas WHERE name = 'Genetics';
SELECT @math_area_id = area_id FROM knowledge_areas WHERE name = 'Mathematics';
SELECT @stats_area_id = area_id FROM knowledge_areas WHERE name = 'Statistics';

-- 5. Insertar equipos de investigación
INSERT INTO research_teams (team_id, department_id, name, code, creation_date, recognition_date, main_research_line)
VALUES
(NEWID(), @harvard_cs_id, 'AI Research Group', 'HARV-AI', '2015-03-10', '2016-05-15', 'Artificial Intelligence and Machine Learning'),
(NEWID(), @mit_phy_id, 'Quantum Computing Lab', 'MIT-QC', '2018-09-05', '2019-11-20', 'Quantum Information Processing'),
(NEWID(), @stanford_med_id, 'Cancer Research Center', 'SU-CRC', '2010-01-15', '2011-03-22', 'Oncology and Cancer Treatment'),
(NEWID(), @mpg_qo_id, 'Quantum Optics Team', 'MPG-QOT', '2005-06-20', '2006-08-12', 'Quantum Optics and Photonics'),
(NEWID(), @google_ai_id, 'Deep Learning Research', 'GOOG-DL', '2019-02-14', '2019-12-10', 'Deep Neural Networks'),
(NEWID(), @nih_id_id, 'Infectious Disease Unit', 'NIH-IDU', '2012-07-30', '2013-09-18', 'Viral and Bacterial Diseases'),
(NEWID(), @oxford_math_id, 'Mathematical Modeling', 'OXF-MM', '2016-04-25', '2017-06-08', 'Mathematical Analysis'),
(NEWID(), @harvard_bio_id, 'Genetics Laboratory', 'HARV-GEN', '2014-11-08', '2015-12-15', 'Genetic Engineering'),
(NEWID(), @mit_ee_id, 'Robotics Research', 'MIT-ROB', '2017-08-12', '2018-10-05', 'Autonomous Systems'),
(NEWID(), @stanford_chem_id, 'Materials Science', 'SU-MS', '2013-05-20', '2014-07-14', 'Nanomaterials Development');

-- 6. Insertar laboratorios
INSERT INTO laboratories (laboratory_id, department_id, name, location, capacity, main_equipment, responsible_id, status)
VALUES
(NEWID(), @harvard_cs_id, 'AI Research Lab', 'Maxwell Dworkin Building Room 235', 25, 'GPU clusters, VR systems', @sarah_id, 'active'),
(NEWID(), @mit_phy_id, 'Quantum Lab', 'Building 26 Room 101', 15, 'Quantum computers, Cryogenic systems', @michael_id, 'active'),
(NEWID(), @stanford_med_id, 'Cancer Research Lab', 'Medical Center Lab 3B', 30, 'Microscopes, DNA sequencers', @emily_id, 'active'),
(NEWID(), @mpg_qo_id, 'Optics Laboratory', 'Main Building Floor 2', 20, 'Laser systems, Interferometers', @klaus_id, 'active'),
(NEWID(), @google_ai_id, 'AI Development Lab', 'Building 43 Room 210', 40, 'TPU clusters, Workstations', @jennifer_id, 'active'),
(NEWID(), @nih_id_id, 'BSL-3 Laboratory', 'Building 10 Room 5C103', 12, 'Biosafety cabinets, Incubators', @robert_id, 'active'),
(NEWID(), @oxford_math_id, 'Computational Lab', 'Andrew Wiles Building Room 304', 18, 'Supercomputers, Visualization systems', @james_id, 'active'),
(NEWID(), @harvard_bio_id, 'Genetics Lab', 'Biological Labs Room 208', 22, 'PCR machines, Electrophoresis', @sarah_id, 'active'),
(NEWID(), @mit_ee_id, 'Robotics Workshop', 'Building 38 Room 456', 28, '3D printers, Robot arms', @michael_id, 'active'),
(NEWID(), @stanford_chem_id, 'Materials Lab', 'Spilker Building Room 132', 24, 'Electron microscopes, Spectrometers', @emily_id, 'active');

-- 7. Insertar convocatorias
INSERT INTO funding_calls (call_id, name, calling_entity, funding_type, total_budget, opening_date, closing_date, requirements, status)
VALUES
(NEWID(), 'AI Research Grant 2024', 'National Science Foundation', 'external', 5000000.00, '2024-01-15', '2024-03-15', 'PhD required, research proposal', 'open'),
(NEWID(), 'Quantum Initiative', 'Department of Energy', 'governmental', 7500000.00, '2024-02-01', '2024-04-30', 'Background in physics, team required', 'open'),
(NEWID(), 'Cancer Research Program', 'National Institutes of Health', 'governmental', 3000000.00, '2024-01-10', '2024-02-28', 'MD or PhD, clinical experience', 'evaluation'),
(NEWID(), 'Renewable Energy Challenge', 'European Commission', 'external', 4000000.00, '2023-11-01', '2024-01-31', 'Engineering background, prototype', 'closed'),
(NEWID(), 'Google Research Award', 'Google Inc.', 'external', 2000000.00, '2024-03-01', '2024-05-31', 'Open to universities, AI focus', 'open'),
(NEWID(), 'Space Exploration Grant', 'NASA', 'governmental', 10000000.00, '2024-02-15', '2024-06-15', 'Aerospace engineering, team required', 'open'),
(NEWID(), 'Mathematics Fellowship', 'Simons Foundation', 'external', 1500000.00, '2024-01-20', '2024-03-20', 'PhD in mathematics, publications', 'evaluation'),
(NEWID(), 'Climate Change Research', 'World Bank', 'external', 6000000.00, '2023-12-01', '2024-02-29', 'Environmental science, impact study', 'closed'),
(NEWID(), 'Biotechnology Innovation', 'Bill & Melinda Gates Foundation', 'external', 3500000.00, '2024-02-10', '2024-04-10', 'Life sciences, developing countries focus', 'open'),
(NEWID(), 'Cybersecurity Initiative', 'Department of Defense', 'governmental', 8000000.00, '2024-03-15', '2024-07-15', 'Security clearance, computer science', 'open');

-- 8. Insertar proyectos de investigación
INSERT INTO research_projects (project_id, title, official_code, description, principal_researcher_id, team_id, laboratory_id, department_id, call_id, start_date, estimated_end_date, actual_end_date, total_budget, project_type, status)
VALUES
(NEWID(), 'Advanced Neural Networks for Medical Diagnosis', 'ANN-MD-2024', 'Developing AI systems for early disease detection using deep learning', @sarah_id, (SELECT team_id FROM research_teams WHERE name = 'AI Research Group'), (SELECT laboratory_id FROM laboratories WHERE name = 'AI Research Lab'), @harvard_cs_id, (SELECT call_id FROM funding_calls WHERE name = 'AI Research Grant 2024'), '2024-04-01', '2026-03-31', NULL, 1200000.00, 'applied', 'planning'),
(NEWID(), 'Quantum Computing for Drug Discovery', 'QCDD-2024', 'Using quantum algorithms to accelerate pharmaceutical research', @michael_id, (SELECT team_id FROM research_teams WHERE name = 'Quantum Computing Lab'), (SELECT laboratory_id FROM laboratories WHERE name = 'Quantum Lab'), @mit_phy_id, (SELECT call_id FROM funding_calls WHERE name = 'Quantum Initiative'), '2024-05-15', '2027-05-14', NULL, 2500000.00, 'development', 'planning'),
(NEWID(), 'Personalized Cancer Immunotherapy', 'PCI-2024', 'Developing tailored immunotherapies based on genetic profiling', @emily_id, (SELECT team_id FROM research_teams WHERE name = 'Cancer Research Center'), (SELECT laboratory_id FROM laboratories WHERE name = 'Cancer Research Lab'), @stanford_med_id, (SELECT call_id FROM funding_calls WHERE name = 'Cancer Research Program'), '2024-03-01', '2028-02-28', NULL, 1800000.00, 'applied', 'execution'),
(NEWID(), 'Quantum Entanglement for Secure Communications', 'QESC-2024', 'Exploring quantum entanglement for unbreakable encryption systems', @klaus_id, (SELECT team_id FROM research_teams WHERE name = 'Quantum Optics Team'), (SELECT laboratory_id FROM laboratories WHERE name = 'Optics Laboratory'), @mpg_qo_id, (SELECT call_id FROM funding_calls WHERE name = 'Quantum Initiative'), '2024-06-01', '2026-11-30', NULL, 950000.00, 'basic', 'planning'),
(NEWID(), 'Deep Learning for Natural Language Understanding', 'DL-NLU-2024', 'Advanced NLP models for human-like language comprehension', @jennifer_id, (SELECT team_id FROM research_teams WHERE name = 'Deep Learning Research'), (SELECT laboratory_id FROM laboratories WHERE name = 'AI Development Lab'), @google_ai_id, (SELECT call_id FROM funding_calls WHERE name = 'Google Research Award'), '2024-04-15', '2025-10-14', NULL, 750000.00, 'development', 'execution'),
(NEWID(), 'Novel Antiviral Therapies for Emerging Pathogens', 'NAT-EP-2024', 'Developing broad-spectrum antiviral treatments', @robert_id, (SELECT team_id FROM research_teams WHERE name = 'Infectious Disease Unit'), (SELECT laboratory_id FROM laboratories WHERE name = 'BSL-3 Laboratory'), @nih_id_id, (SELECT call_id FROM funding_calls WHERE name = 'Cancer Research Program'), '2024-02-01', '2027-01-31', NULL, 2200000.00, 'applied', 'execution'),
(NEWID(), 'Mathematical Models for Climate Prediction', 'MMCP-2024', 'Advanced statistical models for accurate climate forecasting', @james_id, (SELECT team_id FROM research_teams WHERE name = 'Mathematical Modeling'), (SELECT laboratory_id FROM laboratories WHERE name = 'Computational Lab'), @oxford_math_id, (SELECT call_id FROM funding_calls WHERE name = 'Climate Change Research'), '2023-12-01', '2025-11-30', NULL, 850000.00, 'basic', 'execution'),
(NEWID(), 'CRISPR-Based Gene Editing for Rare Diseases', 'CRISPR-RD-2024', 'Developing precise gene editing techniques for genetic disorders', @sarah_id, (SELECT team_id FROM research_teams WHERE name = 'Genetics Laboratory'), (SELECT laboratory_id FROM laboratories WHERE name = 'Genetics Lab'), @harvard_bio_id, (SELECT call_id FROM funding_calls WHERE name = 'Biotechnology Innovation'), '2024-03-15', '2028-03-14', NULL, 3100000.00, 'innovation', 'planning'),
(NEWID(), 'Autonomous Surgical Robotics System', 'ASRS-2024', 'Developing AI-powered robots for precision surgery', @michael_id, (SELECT team_id FROM research_teams WHERE name = 'Robotics Research'), (SELECT laboratory_id FROM laboratories WHERE name = 'Robotics Workshop'), @mit_ee_id, (SELECT call_id FROM funding_calls WHERE name = 'Google Research Award'), '2024-05-01', '2026-04-30', NULL, 1650000.00, 'development', 'planning'),
(NEWID(), 'Nanomaterials for Sustainable Energy Storage', 'NSES-2024', 'Developing advanced nanomaterials for efficient energy storage', @emily_id, (SELECT team_id FROM research_teams WHERE name = 'Materials Science'), (SELECT laboratory_id FROM laboratories WHERE name = 'Materials Lab'), @stanford_chem_id, (SELECT call_id FROM funding_calls WHERE name = 'Renewable Energy Challenge'), '2024-01-15', '2026-07-14', NULL, 1950000.00, 'innovation', 'execution');

-- Declarar variables para proyectos
DECLARE @project1_id UNIQUEIDENTIFIER, @project2_id UNIQUEIDENTIFIER, @project3_id UNIQUEIDENTIFIER, @project4_id UNIQUEIDENTIFIER, @project5_id UNIQUEIDENTIFIER;
DECLARE @project6_id UNIQUEIDENTIFIER, @project7_id UNIQUEIDENTIFIER, @project8_id UNIQUEIDENTIFIER, @project9_id UNIQUEIDENTIFIER, @project10_id UNIQUEIDENTIFIER;

SELECT @project1_id = project_id FROM research_projects WHERE official_code = 'ANN-MD-2024';
SELECT @project2_id = project_id FROM research_projects WHERE official_code = 'QCDD-2024';
SELECT @project3_id = project_id FROM research_projects WHERE official_code = 'PCI-2024';
SELECT @project4_id = project_id FROM research_projects WHERE official_code = 'QESC-2024';
SELECT @project5_id = project_id FROM research_projects WHERE official_code = 'DL-NLU-2024';
SELECT @project6_id = project_id FROM research_projects WHERE official_code = 'NAT-EP-2024';
SELECT @project7_id = project_id FROM research_projects WHERE official_code = 'MMCP-2024';
SELECT @project8_id = project_id FROM research_projects WHERE official_code = 'CRISPR-RD-2024';
SELECT @project9_id = project_id FROM research_projects WHERE official_code = 'ASRS-2024';
SELECT @project10_id = project_id FROM research_projects WHERE official_code = 'NSES-2024';

-- 9. Insertar relaciones investigadores-proyectos
INSERT INTO researcher_projects (researcher_id, project_id, role, weekly_hours, incorporation_date)
VALUES
(@sarah_id, @project1_id, 'principal', 35, '2024-04-01'),
(@michael_id, @project2_id, 'principal', 40, '2024-05-15'),
(@emily_id, @project3_id, 'principal', 38, '2024-03-01'),
(@klaus_id, @project4_id, 'principal', 32, '2024-06-01'),
(@jennifer_id, @project5_id, 'principal', 36, '2024-04-15'),
(@robert_id, @project6_id, 'principal', 34, '2024-02-01'),
(@james_id, @project7_id, 'principal', 30, '2023-12-01'),
(@sarah_id, @project8_id, 'principal', 37, '2024-03-15'),
(@michael_id, @project9_id, 'principal', 39, '2024-05-01'),
(@emily_id, @project10_id, 'principal', 35, '2024-01-15'),
(@anna_id, @project1_id, 'co-researcher', 20, '2024-04-01'),
(@pierre_id, @project2_id, 'collaborator', 15, '2024-05-15'),
(@maria_id, @project3_id, 'co-researcher', 25, '2024-03-01'),
(@anna_id, @project4_id, 'collaborator', 10, '2024-06-01'),
(@pierre_id, @project5_id, 'co-researcher', 22, '2024-04-15'),
(@maria_id, @project6_id, 'collaborator', 12, '2024-02-01'),
(@anna_id, @project7_id, 'co-researcher', 18, '2023-12-01'),
(@pierre_id, @project8_id, 'collaborator', 14, '2024-03-15'),
(@maria_id, @project9_id, 'co-researcher', 24, '2024-05-01'),
(@anna_id, @project10_id, 'collaborator', 16, '2024-01-15');

-- 10. Insertar relaciones proyectos-áreas
INSERT INTO project_areas (project_id, area_id, is_main)
VALUES
(@project1_id, @ai_area_id, 1),
(@project1_id, @med_area_id, 0),
(@project2_id, @quantum_area_id, 1),
(@project2_id, @med_area_id, 0),
(@project3_id, @onco_area_id, 1),
(@project3_id, @genetics_area_id, 0),
(@project4_id, @quantum_area_id, 1),
(@project4_id, @cs_area_id, 0),
(@project5_id, @ai_area_id, 1),
(@project5_id, @cs_area_id, 0),
(@project6_id, @med_area_id, 1),
(@project6_id, @bio_area_id, 0),
(@project7_id, @stats_area_id, 1),
(@project7_id, @math_area_id, 0),
(@project8_id, @genetics_area_id, 1),
(@project8_id, @bio_area_id, 0),
(@project9_id, @ai_area_id, 1),
(@project9_id, @med_area_id, 0),
(@project10_id, @phy_area_id, 1),
(@project10_id, @cs_area_id, 0);

-- 11. Insertar financiamientos
INSERT INTO fundings (funding_id, project_id, institution_id, call_id, contract_code, description, funding_type, total_amount, currency, approval_date, disbursement_start_date, disbursement_end_date, status)
VALUES
(NEWID(), @project1_id, @harvard_id, (SELECT call_id FROM funding_calls WHERE name = 'AI Research Grant 2024'), 'CONTRACT-001', 'Initial funding for AI medical research', 'external', 1200000.00, 'USD', '2024-03-20', '2024-04-01', '2026-03-31', 'active'),
(NEWID(), @project2_id, @mit_id, (SELECT call_id FROM funding_calls WHERE name = 'Quantum Initiative'), 'CONTRACT-002', 'Quantum computing for pharmaceuticals', 'governmental', 2500000.00, 'USD', '2024-04-30', '2024-05-15', '2027-05-14', 'active'),
(NEWID(), @project3_id, @stanford_id, (SELECT call_id FROM funding_calls WHERE name = 'Cancer Research Program'), 'CONTRACT-003', 'Personalized cancer treatment research', 'governmental', 1800000.00, 'USD', '2024-02-28', '2024-03-01', '2028-02-28', 'active'),
(NEWID(), @project4_id, @maxplanck_id, (SELECT call_id FROM funding_calls WHERE name = 'Quantum Initiative'), 'CONTRACT-004', 'Quantum encryption systems development', 'governmental', 950000.00, 'EUR', '2024-05-31', '2024-06-01', '2026-11-30', 'active'),
(NEWID(), @project5_id, @google_id, (SELECT call_id FROM funding_calls WHERE name = 'Google Research Award'), 'CONTRACT-005', 'Natural language understanding research', 'external', 750000.00, 'USD', '2024-04-10', '2024-04-15', '2025-10-14', 'active'),
(NEWID(), @project6_id, @nih_id, (SELECT call_id FROM funding_calls WHERE name = 'Cancer Research Program'), 'CONTRACT-006', 'Antiviral therapies development', 'governmental', 2200000.00, 'USD', '2024-01-31', '2024-02-01', '2027-01-31', 'active'),
(NEWID(), @project7_id, @oxford_id, (SELECT call_id FROM funding_calls WHERE name = 'Climate Change Research'), 'CONTRACT-007', 'Climate prediction models research', 'external', 850000.00, 'GBP', '2024-01-15', '2023-12-01', '2025-11-30', 'active'),
(NEWID(), @project8_id, @harvard_id, (SELECT call_id FROM funding_calls WHERE name = 'Biotechnology Innovation'), 'CONTRACT-008', 'Gene editing for rare diseases', 'external', 3100000.00, 'USD', '2024-03-10', '2024-03-15', '2028-03-14', 'active'),
(NEWID(), @project9_id, @mit_id, (SELECT call_id FROM funding_calls WHERE name = 'Google Research Award'), 'CONTRACT-009', 'Surgical robotics development', 'external', 1650000.00, 'USD', '2024-04-20', '2024-05-01', '2026-04-30', 'active'),
(NEWID(), @project10_id, @stanford_id, (SELECT call_id FROM funding_calls WHERE name = 'Renewable Energy Challenge'), 'CONTRACT-010', 'Nanomaterials for energy storage', 'external', 1950000.00, 'USD', '2024-02-28', '2024-01-15', '2026-07-14', 'active');

-- 12. Insertar desembolsos
INSERT INTO disbursements (funding_id, amount, disbursement_date, invoice_number, concept, status)
SELECT funding_id, total_amount * 0.3, DATEADD(MONTH, 1, approval_date), 'INV-' + RIGHT('000' + CAST((ROW_NUMBER() OVER (ORDER BY funding_id)) AS VARCHAR(3)), 3), 'Initial disbursement', 'disbursed'
FROM fundings
UNION ALL
SELECT funding_id, total_amount * 0.4, DATEADD(MONTH, 6, approval_date), 'INV-' + RIGHT('000' + CAST((ROW_NUMBER() OVER (ORDER BY funding_id)) + 10 AS VARCHAR(3)), 3), 'Second disbursement', 'pending'
FROM fundings
UNION ALL
SELECT funding_id, total_amount * 0.3, DATEADD(MONTH, 12, approval_date), 'INV-' + RIGHT('000' + CAST((ROW_NUMBER() OVER (ORDER BY funding_id)) + 20 AS VARCHAR(3)), 3), 'Final disbursement', 'pending'
FROM fundings;

-- 13. Insertar eventos académicos
INSERT INTO academic_events (event_id, name, type, organizer, country, city, start_date, end_date, website, status)
VALUES
(NEWID(), 'International Conference on Artificial Intelligence', 'conference', 'IEEE', 'USA', 'San Francisco', '2024-07-15', '2024-07-18', 'https://icai2024.org', 'planned'),
(NEWID(), 'World Quantum Symposium', 'symposium', 'Quantum Foundation', 'Switzerland', 'Geneva', '2024-09-10', '2024-09-13', 'https://worldquantum.org', 'planned'),
(NEWID(), 'Global Cancer Research Summit', 'congress', 'WHO', 'France', 'Paris', '2024-05-20', '2024-05-23', 'https://cancersummit2024.org', 'planned'),
(NEWID(), 'Neural Information Processing Systems', 'conference', 'NeurIPS Foundation', 'Canada', 'Vancouver', '2024-12-10', '2024-12-15', 'https://neurips.cc', 'planned'),
(NEWID(), 'International Materials Science Workshop', 'workshop', 'Materials Research Society', 'Germany', 'Berlin', '2024-06-05', '2024-06-07', 'https://mrs-workshop2024.org', 'planned'),
(NEWID(), 'Bioinformatics and Genomics Seminar', 'seminar', 'EMBL', 'UK', 'Cambridge', '2024-08-22', '2024-08-24', 'https://embl-seminar2024.org', 'planned'),
(NEWID(), 'Robotics and Automation Conference', 'conference', 'IEEE Robotics', 'Japan', 'Tokyo', '2024-10-15', '2024-10-18', 'https://icra2024.org', 'planned'),
(NEWID(), 'Climate Change Symposium', 'symposium', 'UN Environment', 'Kenya', 'Nairobi', '2024-11-05', '2024-11-08', 'https://un-climate2024.org', 'planned'),
(NEWID(), 'Nanotechnology Congress', 'congress', 'International Nanotech Society', 'USA', 'Boston', '2024-07-25', '2024-07-28', 'https://nanocongress2024.org', 'planned'),
(NEWID(), 'Medical Innovation Summit', 'congress', 'Mayo Clinic', 'USA', 'Rochester', '2024-09-30', '2024-10-02', 'https://medicalinnovation2024.org', 'planned');

-- 14. Insertar publicaciones
INSERT INTO publications (publication_id, title, abstract, publication_date, doi, isbn_issn, pages, volume, number, journal_name, event_id, type, indexing, impact_factor, quartile, total_citations, citations_last_year)
VALUES
(NEWID(), 'Deep Learning for Early Cancer Detection in Medical Imaging', 'This paper presents a novel deep learning approach for early detection of cancer in medical images using convolutional neural networks and transfer learning techniques.', '2024-01-15', '10.1016/j.media.2024.102345', '1361-8415', '123-135', '45', '3', 'Medical Image Analysis', (SELECT event_id FROM academic_events WHERE name = 'International Conference on Artificial Intelligence'), 'journal_article', 'scopus', 8.345, 'Q1', 42, 42),
(NEWID(), 'Quantum Algorithms for Molecular Simulation in Drug Discovery', 'We propose efficient quantum algorithms for simulating molecular interactions, significantly accelerating the drug discovery process compared to classical methods.', '2024-02-20', '10.1038/s41567-024-02445-9', '1745-2473', '567-580', '20', '4', 'Nature Physics', (SELECT event_id FROM academic_events WHERE name = 'World Quantum Symposium'), 'journal_article', 'wos', 25.345, 'Q1', 28, 28),
(NEWID(), 'Personalized Immunotherapy Based on Genetic Profiling of Tumor Microenvironment', 'This study demonstrates how genetic profiling of the tumor microenvironment can guide personalized immunotherapy approaches for better cancer treatment outcomes.', '2024-03-10', '10.1016/j.ccell.2024.03.005', '1535-6108', '234-247', '35', '2', 'Cancer Cell', (SELECT event_id FROM academic_events WHERE name = 'Global Cancer Research Summit'), 'journal_article', 'scopus', 22.456, 'Q1', 35, 35),
(NEWID(), 'Quantum Key Distribution Using Entangled Photon Pairs', 'We present a secure quantum communication protocol using entangled photon pairs for unbreakable encryption with practical implementation considerations.', '2024-01-30', '10.1103/PhysRevLett.132.040601', '0031-9007', '040601', '132', '4', 'Physical Review Letters', NULL, 'journal_article', 'wos', 9.185, 'Q1', 19, 19),
(NEWID(), 'Transformer Architectures for Multilingual Natural Language Understanding', 'This paper explores advanced transformer architectures for multilingual natural language understanding tasks, achieving state-of-the-art results across 50 languages.', '2024-02-15', '10.1162/tacl_a_00678', '1947-8767', '456-472', '12', '1', 'Transactions of the ACL', (SELECT event_id FROM academic_events WHERE name = 'Neural Information Processing Systems'), 'journal_article', 'scopus', 6.789, 'Q1', 31, 31),
(NEWID(), 'Broad-Spectrum Antiviral Compounds Targeting Viral Polymerases', 'We identify and characterize novel broad-spectrum antiviral compounds that effectively inhibit multiple viral polymerases with high specificity and low toxicity.', '2024-03-05', '10.1126/science.adn1234', '0036-8075', '1123-1135', '383', '6685', 'Science', NULL, 'journal_article', 'wos', 47.728, 'Q1', 57, 57),
(NEWID(), 'Bayesian Hierarchical Models for Climate Prediction Uncertainty', 'This work develops Bayesian hierarchical models to better quantify uncertainty in climate predictions, improving reliability of long-term climate forecasts.', '2024-01-25', '10.1175/JCLI-D-23-0452.1', '0894-8755', '789-802', '37', '3', 'Journal of Climate', (SELECT event_id FROM academic_events WHERE name = 'Climate Change Symposium'), 'journal_article', 'scopus', 5.432, 'Q1', 23, 23),
(NEWID(), 'CRISPR-Cas9 Precision Editing for Monogenic Disorders', 'We demonstrate highly precise CRISPR-Cas9 editing techniques for treating monogenic disorders with minimal off-target effects in preclinical models.', '2024-02-28', '10.1038/s41587-024-02345-9', '1546-1696', '345-358', '42', '2', 'Nature Biotechnology', NULL, 'journal_article', 'wos', 36.558, 'Q1', 48, 48),
(NEWID(), 'Autonomous Robotic System for Minimally Invasive Surgery', 'This paper presents an autonomous robotic system capable of performing complex minimally invasive surgical procedures with superhuman precision.', '2024-03-15', '10.1126/scirobotics.adn5678', '1940-1892', 'eadn5678', '9', '87', 'Science Robotics', (SELECT event_id FROM academic_events WHERE name = 'Robotics and Automation Conference'), 'journal_article', 'scopus', 18.345, 'Q1', 26, 26),
(NEWID(), 'Graphene-Based Nanocomposites for High-Capacity Energy Storage', 'We develop graphene-based nanocomposite materials that demonstrate exceptional energy storage capacity and cycling stability for next-generation batteries.', '2024-02-10', '10.1016/j.joule.2024.02.008', '2542-4351', '234-247', '8', '2', 'Joule', (SELECT event_id FROM academic_events WHERE name = 'Nanotechnology Congress'), 'journal_article', 'scopus', 27.345, 'Q1', 39, 39);

-- Declarar variables para publicaciones
DECLARE @pub1_id UNIQUEIDENTIFIER, @pub2_id UNIQUEIDENTIFIER, @pub3_id UNIQUEIDENTIFIER, @pub4_id UNIQUEIDENTIFIER, @pub5_id UNIQUEIDENTIFIER;
DECLARE @pub6_id UNIQUEIDENTIFIER, @pub7_id UNIQUEIDENTIFIER, @pub8_id UNIQUEIDENTIFIER, @pub9_id UNIQUEIDENTIFIER, @pub10_id UNIQUEIDENTIFIER;

SELECT @pub1_id = publication_id FROM publications WHERE doi = '10.1016/j.media.2024.102345';
SELECT @pub2_id = publication_id FROM publications WHERE doi = '10.1038/s41567-024-02445-9';
SELECT @pub3_id = publication_id FROM publications WHERE doi = '10.1016/j.ccell.2024.03.005';
SELECT @pub4_id = publication_id FROM publications WHERE doi = '10.1103/PhysRevLett.132.040601';
SELECT @pub5_id = publication_id FROM publications WHERE doi = '10.1162/tacl_a_00678';
SELECT @pub6_id = publication_id FROM publications WHERE doi = '10.1126/science.adn1234';
SELECT @pub7_id = publication_id FROM publications WHERE doi = '10.1175/JCLI-D-23-0452.1';
SELECT @pub8_id = publication_id FROM publications WHERE doi = '10.1038/s41587-024-02345-9';
SELECT @pub9_id = publication_id FROM publications WHERE doi = '10.1126/scirobotics.adn5678';
SELECT @pub10_id = publication_id FROM publications WHERE doi = '10.1016/j.joule.2024.02.008';

-- 15. Insertar autores de publicaciones
INSERT INTO publication_authors (researcher_id, publication_id, author_order, contribution, is_corresponding)
VALUES
(@sarah_id, @pub1_id, 1, 'Conceptualization, Methodology, Writing - original draft', 1),
(@anna_id, @pub1_id, 2, 'Data curation, Formal analysis', 0),
(@michael_id, @pub2_id, 1, 'Conceptualization, Software development', 1),
(@pierre_id, @pub2_id, 2, 'Validation, Visualization', 0),
(@emily_id, @pub3_id, 1, 'Methodology, Investigation, Writing', 1),
(@maria_id, @pub3_id, 2, 'Resources, Data curation', 0),
(@klaus_id, @pub4_id, 1, 'Conceptualization, Supervision', 1),
(@jennifer_id, @pub5_id, 1, 'Software, Validation, Writing', 1),
(@robert_id, @pub6_id, 1, 'Investigation, Methodology', 1),
(@anna_id, @pub6_id, 2, 'Formal analysis, Visualization', 0),
(@james_id, @pub7_id, 1, 'Conceptualization, Data analysis', 1),
(@pierre_id, @pub7_id, 2, 'Methodology, Software', 0),
(@sarah_id, @pub8_id, 1, 'Supervision, Writing - review', 1),
(@maria_id, @pub8_id, 2, 'Investigation, Validation', 0),
(@michael_id, @pub9_id, 1, 'Conceptualization, Project administration', 1),
(@anna_id, @pub9_id, 2, 'Software development, Testing', 0),
(@emily_id, @pub10_id, 1, 'Methodology, Resources', 1),
(@pierre_id, @pub10_id, 2, 'Data curation, Formal analysis', 0);

-- 16. Insertar relaciones proyectos-publicaciones
INSERT INTO project_publications (project_id, publication_id)
VALUES
(@project1_id, @pub1_id),
(@project2_id, @pub2_id),
(@project3_id, @pub3_id),
(@project4_id, @pub4_id),
(@project5_id, @pub5_id),
(@project6_id, @pub6_id),
(@project7_id, @pub7_id),
(@project8_id, @pub8_id),
(@project9_id, @pub9_id),
(@project10_id, @pub10_id);

-- 17. Insertar relaciones publicaciones-áreas
INSERT INTO publication_areas (publication_id, area_id, is_main)
VALUES
(@pub1_id, @ai_area_id, 1),
(@pub1_id, @med_area_id, 0),
(@pub2_id, @quantum_area_id, 1),
(@pub2_id, @med_area_id, 0),
(@pub3_id, @onco_area_id, 1),
(@pub3_id, @genetics_area_id, 0),
(@pub4_id, @quantum_area_id, 1),
(@pub4_id, @phy_area_id, 0),
(@pub5_id, @ai_area_id, 1),
(@pub5_id, @cs_area_id, 0),
(@pub6_id, @med_area_id, 1),
(@pub6_id, @bio_area_id, 0),
(@pub7_id, @stats_area_id, 1),
(@pub7_id, @math_area_id, 0),
(@pub8_id, @genetics_area_id, 1),
(@pub8_id, @bio_area_id, 0),
(@pub9_id, @ai_area_id, 1),
(@pub9_id, @cs_area_id, 0),
(@pub10_id, @phy_area_id, 1),
(@pub10_id, @cs_area_id, 0);

-- 18. Insertar citas entre publicaciones
INSERT INTO publication_citations (citing_publication_id, cited_publication_id, context, citation_date)
VALUES
(@pub2_id, @pub1_id, 'Our quantum approach builds upon the deep learning foundations established by Chen et al.', '2024-02-20'),
(@pub3_id, @pub1_id, 'The medical imaging techniques described provide valuable insights for our immunotherapy research', '2024-03-10'),
(@pub5_id, @pub1_id, 'Following the neural network architecture proposed for medical applications', '2024-02-15'),
(@pub6_id, @pub3_id, 'Building on the personalized medicine approach for antiviral development', '2024-03-05'),
(@pub8_id, @pub6_id, 'Using similar compound screening methodologies for genetic therapies', '2024-02-28'),
(@pub9_id, @pub5_id, 'Incorporating transformer architectures for robotic decision-making', '2024-03-15'),
(@pub10_id, @pub7_id, 'Applying statistical models for materials performance prediction', '2024-02-10'),
(@pub4_id, @pub2_id, 'Extending quantum algorithms for communication applications', '2024-01-30'),
(@pub7_id, @pub5_id, 'Adapting machine learning techniques for climate modeling', '2024-01-25'),
(@pub8_id, @pub1_id, 'Combining AI diagnostics with genetic interventions', '2024-02-28');

-- 19. Insertar patentes
INSERT INTO patents (patent_id, title, patent_number, description, application_date, grant_date, country, patent_office, status, project_id)
VALUES
(NEWID(), 'AI System for Medical Image Analysis and Diagnosis', 'US20240123456A1', 'An artificial intelligence system for automated analysis of medical images and diagnostic assistance', '2024-01-15', NULL, 'USA', 'USPTO', 'applied', @project1_id),
(NEWID(), 'Quantum Algorithm for Molecular Simulation', 'EP20240198765B1', 'Novel quantum computing algorithm for efficient molecular simulation and drug discovery', '2024-02-20', '2024-03-15', 'European Union', 'EPO', 'granted', @project2_id),
(NEWID(), 'Personalized Cancer Immunotherapy Protocol', 'JP2024054321A', 'Method for developing personalized immunotherapy based on genetic profiling', '2024-03-10', NULL, 'Japan', 'JPO', 'applied', @project3_id),
(NEWID(), 'Quantum Encryption System Using Entangled Photons', 'US20240111111A1', 'Secure communication system utilizing quantum entanglement for unbreakable encryption', '2024-01-30', NULL, 'USA', 'USPTO', 'applied', @project4_id),
(NEWID(), 'Multilingual Natural Language Processing Framework', 'WO2024022222A1', 'Software framework for multilingual natural language understanding and processing', '2024-02-15', '2024-04-01', 'International', 'WIPO', 'granted', @project5_id),
(NEWID(), 'Broad-Spectrum Antiviral Compound Formulation', 'US20240333333A1', 'Pharmaceutical composition with broad-spectrum antiviral activity', '2024-03-05', NULL, 'USA', 'USPTO', 'applied', @project6_id),
(NEWID(), 'Climate Prediction Uncertainty Quantification System', 'EP2024044444A2', 'System for quantifying and visualizing uncertainty in climate predictions', '2024-01-25', NULL, 'European Union', 'EPO', 'applied', @project7_id),
(NEWID(), 'Precision CRISPR-Cas9 Gene Editing Method', 'US20240555555A1', 'Method for highly precise gene editing with reduced off-target effects', '2024-02-28', NULL, 'USA', 'USPTO', 'applied', @project8_id),
(NEWID(), 'Autonomous Surgical Robotics Control System', 'KR2024066666A', 'Control system for autonomous robotic surgery with real-time adaptation', '2024-03-15', NULL, 'South Korea', 'KIPO', 'applied', @project9_id),
(NEWID(), 'Graphene Nanocomposite for Energy Storage', 'CN2024077777A', 'Nanocomposite material based on graphene for high-capacity energy storage devices', '2024-02-10', '2024-04-10', 'China', 'CNIPA', 'granted', @project10_id);

-- 20. Insertar inventores de patentes
INSERT INTO patent_inventors (researcher_id, patent_id, inventor_order, contribution)
SELECT researcher_id, patent_id, 1, 'Primary inventor and conceptual designer'
FROM patents p
INNER JOIN research_projects rp ON p.project_id = rp.project_id
UNION ALL
SELECT 
    CASE 
        WHEN p.project_id = @project1_id THEN @anna_id
        WHEN p.project_id = @project2_id THEN @pierre_id
        WHEN p.project_id = @project3_id THEN @maria_id
        WHEN p.project_id = @project4_id THEN @jennifer_id
        WHEN p.project_id = @project5_id THEN @robert_id
        WHEN p.project_id = @project6_id THEN @james_id
        WHEN p.project_id = @project7_id THEN @sarah_id
        WHEN p.project_id = @project8_id THEN @michael_id
        WHEN p.project_id = @project9_id THEN @emily_id
        WHEN p.project_id = @project10_id THEN @klaus_id
    END,
    patent_id, 2, 'Co-inventor and technical implementer'
FROM patents;

-- 21. Insertar revisores
INSERT INTO reviewers (reviewer_id, researcher_id, expertise_areas, affiliation_institution, status)
VALUES
(NEWID(), @sarah_id, 'Artificial Intelligence, Medical Imaging, Machine Learning', 'Harvard University', 'active'),
(NEWID(), @michael_id, 'Quantum Computing, Physics, Algorithms', 'MIT', 'active'),
(NEWID(), @emily_id, 'Oncology, Immunology, Genetics', 'Stanford University', 'active'),
(NEWID(), @klaus_id, 'Quantum Optics, Photonics, Encryption', 'Max Planck Institute', 'active'),
(NEWID(), @jennifer_id, 'Natural Language Processing, Deep Learning', 'Google Research', 'active'),
(NEWID(), @robert_id, 'Virology, Pharmacology, Infectious Diseases', 'NIH', 'active'),
(NEWID(), @james_id, 'Statistics, Climate Science, Mathematics', 'University of Oxford', 'active'),
(NEWID(), @anna_id, 'Computer Science, Bioinformatics, AI', 'ETH Zurich', 'active'),
(NEWID(), @pierre_id, 'Microbiology, Genetics, Molecular Biology', 'Pasteur Institute', 'active'),
(NEWID(), @maria_id, 'Aerospace Engineering, Physics, Materials Science', 'NASA', 'active');

-- 22. Insertar procesos de evaluación
INSERT INTO review_processes (process_id, publication_id, reviewer_id, assignment_date, deadline_date, completion_date, comments, decision, score)
VALUES
(NEWID(), @pub1_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @michael_id), '2023-11-15', '2023-12-15', '2023-12-10', 'Excellent methodology and significant contribution to the field. Well-written and thoroughly researched.', 'accepted', 5),
(NEWID(), @pub2_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @klaus_id), '2023-12-01', '2024-01-15', '2024-01-10', 'Novel approach but requires additional validation experiments. Good potential impact.', 'major_revision', 4),
(NEWID(), @pub3_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @emily_id), '2023-12-10', '2024-01-31', '2024-01-25', 'Outstanding clinical relevance and rigorous experimental design. Minor grammatical corrections needed.', 'minor_revision', 5),
(NEWID(), @pub4_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @michael_id), '2023-11-20', '2023-12-20', '2023-12-18', 'Solid theoretical foundation but lacks practical implementation details.', 'major_revision', 3),
(NEWID(), @pub5_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @jennifer_id), '2023-12-05', '2024-01-20', '2024-01-15', 'Comprehensive study with impressive multilingual results. Well-executed research.', 'accepted', 5),
(NEWID(), @pub6_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @robert_id), '2023-12-15', '2024-02-15', '2024-02-10', 'Important contribution to antiviral research. Additional cytotoxicity data required.', 'minor_revision', 4),
(NEWID(), @pub7_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @james_id), '2023-11-25', '2023-12-31', '2023-12-28', 'Innovative statistical approach to climate modeling. Clear presentation of methods.', 'accepted', 4),
(NEWID(), @pub8_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @pierre_id), '2023-12-20', '2024-02-10', '2024-02-05', 'Significant advance in gene editing precision. More in vivo validation needed.', 'major_revision', 4),
(NEWID(), @pub9_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @sarah_id), '2024-01-05', '2024-02-28', NULL, 'Review in progress', 'pending', NULL),
(NEWID(), @pub10_id, (SELECT reviewer_id FROM reviewers WHERE researcher_id = @maria_id), '2023-12-08', '2024-01-25', '2024-01-20', 'Excellent materials science research with practical energy applications.', 'accepted', 5);

-- 23. Insertar relaciones revisores-áreas
INSERT INTO reviewer_areas (reviewer_id, area_id, expertise_level)
VALUES
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @sarah_id), @ai_area_id, 'high'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @sarah_id), @med_area_id, 'medium'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @michael_id), @quantum_area_id, 'high'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @michael_id), @phy_area_id, 'high'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @emily_id), @onco_area_id, 'high'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @emily_id), @genetics_area_id, 'medium'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @klaus_id), @quantum_area_id, 'high'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @klaus_id), @cs_area_id, 'medium'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @jennifer_id), @ai_area_id, 'high'),
((SELECT reviewer_id FROM reviewers WHERE researcher_id = @jennifer_id), @cs_area_id, 'high');

-- 24. Insertar indicadores de impacto
INSERT INTO impact_indicators (researcher_id, publication_id, indicator_type, value, measurement_date, source)
VALUES
(@sarah_id, NULL, 'h_index', 42.00, '2024-03-01', 'Scopus'),
(@michael_id, NULL, 'h_index', 38.00, '2024-03-01', 'Web of Science'),
(@emily_id, NULL, 'h_index', 28.00, '2024-03-01', 'Scopus'),
(@klaus_id, NULL, 'h_index', 55.00, '2024-03-01', 'Web of Science'),
(@jennifer_id, NULL, 'h_index', 22.00, '2024-03-01', 'Google Scholar'),
(@robert_id, NULL, 'h_index', 18.00, '2024-03-01', 'Scopus'),
(@james_id, NULL, 'h_index', 35.00, '2024-03-01', 'Web of Science'),
(@anna_id, NULL, 'h_index', 20.00, '2024-03-01', 'Scopus'),
(@pierre_id, NULL, 'h_index', 31.00, '2024-03-01', 'Web of Science'),
(@maria_id, NULL, 'h_index', 26.00, '2024-03-01', 'Scopus'),
(NULL, @pub1_id, 'citations', 42.00, '2024-03-20', 'Google Scholar'),
(NULL, @pub2_id, 'citations', 28.00, '2024-03-20', 'Web of Science'),
(NULL, @pub3_id, 'citations', 35.00, '2024-03-20', 'Scopus'),
(NULL, @pub4_id, 'citations', 19.00, '2024-03-20', 'Web of Science'),
(NULL, @pub5_id, 'citations', 31.00, '2024-03-20', 'Google Scholar'),
(NULL, @pub6_id, 'citations', 57.00, '2024-03-20', 'Scopus'),
(NULL, @pub7_id, 'citations', 23.00, '2024-03-20', 'Web of Science'),
(NULL, @pub8_id, 'citations', 48.00, '2024-03-20', 'Scopus'),
(NULL, @pub9_id, 'citations', 26.00, '2024-03-20', 'Google Scholar'),
(NULL, @pub10_id, 'citations', 39.00, '2024-03-20', 'Web of Science');
