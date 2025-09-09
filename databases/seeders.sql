USE ResearchManagementDB;
GO

-- 1. Insertar en instituciones
INSERT INTO institutions (institution_id, name, type, country, city, address, foundation_date, website)
VALUES 
  a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Harvard University', 'university', 'USA', 'Cambridge', 'Massachusetts Hall, Cambridge, MA 02138', '1636-09-08', 'https://www.harvard.edu'),
('b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'MIT', 'university', 'USA', 'Cambridge', '77 Massachusetts Ave, Cambridge, MA 02139', '1861-04-10', 'https://www.mit.edu'),
('c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Stanford University', 'university', 'USA', 'Stanford', '450 Serra Mall, Stanford, CA 94305', '1885-11-11', 'https://www.stanford.edu'),
('d3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Max Planck Institute', 'research_center', 'Germany', 'Munich', 'Hofgartenstraße 8, 80539 München', '1948-02-26', 'https://www.mpg.de'),
('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Google Research', 'company', 'USA', 'Mountain View', '1600 Amphitheatre Parkway, Mountain View, CA', '1998-09-04', 'https://research.google'),
('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'NIH', 'governmental', 'USA', 'Bethesda', '9000 Rockville Pike, Bethesda, MD 20892', '1887-08-08', 'https://www.nih.gov'),
('g6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'University of Oxford', 'university', 'UK', 'Oxford', 'University Offices, Wellington Square, Oxford OX1 2JD', '1096-01-01', 'https://www.ox.ac.uk'),
('h7eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'ETH Zurich', 'university', 'Switzerland', 'Zurich', 'Rämistrasse 101, 8092 Zürich', '1855-02-07', 'https://www.ethz.ch'),
('i8eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Pasteur Institute', 'research_center', 'France', 'Paris', '28 Rue du Docteur Roux, 75015 Paris', '1887-06-04', 'https://www.pasteur.fr'),
('j9eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'NASA', 'governmental', 'USA', 'Washington', '300 E St SW, Washington, DC 20546', '1958-07-29', 'https://www.nasa.gov');

-- 2. Insertar departamentos
INSERT INTO departments (department_id, institution_id, name, code, phone_number, email)
VALUES
('d1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Computer Science', 'CS', '+1-617-495-1000', 'cs@harvard.edu'),
('d2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Biology', 'BIO', '+1-617-495-2000', 'bio@harvard.edu'),
('d3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Electrical Engineering', 'EE', '+1-617-253-1000', 'ee@mit.edu'),
('d4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Physics', 'PHY', '+1-617-253-2000', 'physics@mit.edu'),
('d5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Medicine', 'MED', '+1-650-723-1000', 'medicine@stanford.edu'),
('d6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Chemistry', 'CHEM', '+1-650-723-2000', 'chemistry@stanford.edu'),
('d7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Quantum Optics', 'QO', '+49-89-2108-1000', 'quantum@mpg.de'),
('d8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'AI Research', 'AI', '+1-650-253-0000', 'ai-research@google.com'),
('d9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Infectious Diseases', 'ID', '+1-301-496-4000', 'infectious@nih.gov'),
('d10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'g6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Mathematics', 'MATH', '+44-1865-270000', 'maths@ox.ac.uk');

-- 3. Insertar investigadores
INSERT INTO researchers (researcher_id, institution_id, full_name, institutional_email, academic_degree, orcid_id, academic_category, incorporation_date, h_index, total_citations, total_publications)
VALUES
('r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Dr. Sarah Chen', 'schen@harvard.edu', 'PhD', '0000-0001-2345-6789', 'Professor', '2010-09-01', 42, 8500, 120),
('r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Prof. Michael Rodriguez', 'mrodriguez@mit.edu', 'PhD', '0000-0002-3456-7890', 'Full Professor', '2005-03-15', 38, 7200, 95),
('r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Dr. Emily Watson', 'ewatson@stanford.edu', 'MD PhD', '0000-0003-4567-8901', 'Associate Professor', '2015-01-10', 28, 4500, 65),
('r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Prof. Klaus Schmidt', 'kschmidt@mpg.de', 'PhD', '0000-0004-5678-9012', 'Director', '2000-06-01', 55, 12500, 180),
('r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Dr. Jennifer Kim', 'jkim@google.com', 'PhD', '0000-0005-6789-0123', 'Senior Researcher', '2018-08-20', 22, 3200, 45),
('r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Dr. Robert Johnson', 'rjohnson@nih.gov', 'MD', '0000-0006-7890-1234', 'Research Fellow', '2019-04-05', 18, 2100, 32),
('r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'g6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Prof. James Wilson', 'jwilson@ox.ac.uk', 'PhD', '0000-0007-8901-2345', 'Professor', '2008-10-15', 35, 6800, 88),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'h7eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Dr. Anna Müller', 'amueller@ethz.ch', 'PhD', '0000-0008-9012-3456', 'Assistant Professor', '2017-02-28', 20, 2800, 38),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'i8eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Dr. Pierre Dubois', 'pdubois@pasteur.fr', 'PhD', '0000-0009-0123-4567', 'Research Director', '2012-07-12', 31, 5200, 72),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'j9eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Dr. Maria Gonzalez', 'mgonzalez@nasa.gov', 'PhD', '0000-0010-1234-5678', 'Lead Scientist', '2014-11-30', 26, 4100, 58);


-- 4. Insertar áreas de conocimiento
INSERT INTO knowledge_areas (area_id, name, unesco_code, parent_area_id, description, level)
VALUES
('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Computer Science', '1203', NULL, 'Study of computers and computational systems', 1),
('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Artificial Intelligence', '1203.04', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Development of intelligent machines', 2),
('a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Medicine', '3200', NULL, 'Science and practice of diagnosis and treatment', 1),
('a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Oncology', '3201.07', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Study and treatment of cancer', 2),
('a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Physics', '2200', NULL, 'Study of matter, energy, and their interactions', 1),
('a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Quantum Mechanics', '2207.02', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Study of particles at quantum level', 2),
('a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Biology', '2400', NULL, 'Study of living organisms', 1),
('a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Genetics', '2409.01', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Study of genes and heredity', 2),
('a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Mathematics', '1201', NULL, 'Study of numbers, quantities, and shapes', 1),
('a10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Statistics', '1201.08', 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Collection and analysis of numerical data', 2);

-- 5. Insertar equipos de investigación
INSERT INTO research_teams (team_id, department_id, name, code, creation_date, recognition_date, main_research_line)
VALUES
('t1d1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'd1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'AI Research Group', 'HARV-AI', '2015-03-10', '2016-05-15', 'Artificial Intelligence and Machine Learning'),
('t2d4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'd4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Quantum Computing Lab', 'MIT-QC', '2018-09-05', '2019-11-20', 'Quantum Information Processing'),
('t3d5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'd5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Cancer Research Center', 'SU-CRC', '2010-01-15', '2011-03-22', 'Oncology and Cancer Treatment'),
('t4d7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'd7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Quantum Optics Team', 'MPG-QOT', '2005-06-20', '2006-08-12', 'Quantum Optics and Photonics'),
('t5d8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'd8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Deep Learning Research', 'GOOG-DL', '2019-02-14', '2019-12-10', 'Deep Neural Networks'),
('t6d9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'd9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Infectious Disease Unit', 'NIH-IDU', '2012-07-30', '2013-09-18', 'Viral and Bacterial Diseases'),
('t7d10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'd10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Mathematical Modeling', 'OXF-MM', '2016-04-25', '2017-06-08', 'Mathematical Analysis'),
('t8d2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'd2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Genetics Laboratory', 'HARV-GEN', '2014-11-08', '2015-12-15', 'Genetic Engineering'),
('t9d3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'd3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Robotics Research', 'MIT-ROB', '2017-08-12', '2018-10-05', 'Autonomous Systems'),
('t10d6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'd6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Materials Science', 'SU-MS', '2013-05-20', '2014-07-14', 'Nanomaterials Development');

-- 6. Insertar laboratorios
INSERT INTO laboratories (laboratory_id, department_id, name, location, capacity, main_equipment, responsible_id, status)
VALUES
('l1d1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'd1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'AI Research Lab', 'Maxwell Dworkin Building Room 235', 25, 'GPU clusters, VR systems', 'r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'active'),
('l2d4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'd4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Quantum Lab', 'Building 26 Room 101', 15, 'Quantum computers, Cryogenic systems', 'r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'active'),
('l3d5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'd5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Cancer Research Lab', 'Medical Center Lab 3B', 30, 'Microscopes, DNA sequencers', 'r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'active'),
('l4d7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'd7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Optics Laboratory', 'Main Building Floor 2', 20, 'Laser systems, Interferometers', 'r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'active'),
('l5d8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'd8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'AI Development Lab', 'Building 43 Room 210', 40, 'TPU clusters, Workstations', 'r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'active'),
('l6d9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'd9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'BSL-3 Laboratory', 'Building 10 Room 5C103', 12, 'Biosafety cabinets, Incubators', 'r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'active'),
('l7d10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'd10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Computational Lab', 'Andrew Wiles Building Room 304', 18, 'Supercomputers, Visualization systems', 'r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'active'),
('l8d2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'd2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Genetics Lab', 'Biological Labs Room 208', 22, 'PCR machines, Electrophoresis', 'r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'active'),
('l9d3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'd3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Robotics Workshop', 'Building 38 Room 456', 28, '3D printers, Robot arms', 'r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'active'),
('l10d6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'd6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Materials Lab', 'Spilker Building Room 132', 24, 'Electron microscopes, Spectrometers', 'r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'active');

-- 7. Insertar convocatorias
INSERT INTO funding_calls (call_id, name, calling_entity, funding_type, total_budget, opening_date, closing_date, requirements, status)
VALUES
('f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'AI Research Grant 2024', 'National Science Foundation', 'external', 5000000.00, '2024-01-15', '2024-03-15', 'PhD required, research proposal', 'open'),
('f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Quantum Initiative', 'Department of Energy', 'governmental', 7500000.00, '2024-02-01', '2024-04-30', 'Background in physics, team required', 'open'),
('f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Cancer Research Program', 'National Institutes of Health', 'governmental', 3000000.00, '2024-01-10', '2024-02-28', 'MD or PhD, clinical experience', 'evaluation'),
('f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Renewable Energy Challenge', 'European Commission', 'external', 4000000.00, '2023-11-01', '2024-01-31', 'Engineering background, prototype', 'closed'),
('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Google Research Award', 'Google Inc.', 'external', 2000000.00, '2024-03-01', '2024-05-31', 'Open to universities, AI focus', 'open'),
('f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Space Exploration Grant', 'NASA', 'governmental', 10000000.00, '2024-02-15', '2024-06-15', 'Aerospace engineering, team required', 'open'),
('f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Mathematics Fellowship', 'Simons Foundation', 'external', 1500000.00, '2024-01-20', '2024-03-20', 'PhD in mathematics, publications', 'evaluation'),
('f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Climate Change Research', 'World Bank', 'external', 6000000.00, '2023-12-01', '2024-02-29', 'Environmental science, impact study', 'closed'),
('f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Biotechnology Innovation', 'Bill & Melinda Gates Foundation', 'external', 3500000.00, '2024-02-10', '2024-04-10', 'Life sciences, developing countries focus', 'open'),
('f10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Cybersecurity Initiative', 'Department of Defense', 'governmental', 8000000.00, '2024-03-15', '2024-07-15', 'Security clearance, computer science', 'open');

-- 8. Insertar proyectos de investigación
INSERT INTO research_projects (project_id, title, official_code, description, principal_researcher_id, team_id, laboratory_id, department_id, call_id, start_date, estimated_end_date, actual_end_date, total_budget, project_type, status)
VALUES
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Advanced Neural Networks for Medical Diagnosis', 'ANN-MD-2024', 'Developing AI systems for early disease detection using deep learning', 'r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 't1d1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'l1d1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'd1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2024-04-01', '2026-03-31', NULL, 1200000.00, 'applied', 'planning'),
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Quantum Computing for Drug Discovery', 'QCDD-2024', 'Using quantum algorithms to accelerate pharmaceutical research', 'r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 't2d4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'l2d4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'd4b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', '2024-05-15', '2027-05-14', NULL, 2500000.00, 'development', 'planning'),
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Personalized Cancer Immunotherapy', 'PCI-2024', 'Developing tailored immunotherapies based on genetic profiling', 'r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 't3d5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'l3d5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'd5c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '2024-03-01', '2028-02-28', NULL, 1800000.00, 'applied', 'execution'),
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Quantum Entanglement for Secure Communications', 'QESC-2024', 'Exploring quantum entanglement for unbreakable encryption systems', 'r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 't4d7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'l4d7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'd7d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', '2024-06-01', '2026-11-30', NULL, 950000.00, 'basic', 'planning'),
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Deep Learning for Natural Language Understanding', 'DL-NLU-2024', 'Advanced NLP models for human-like language comprehension', 'r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 't5d8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'l5d8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'd8e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2024-04-15', '2025-10-14', NULL, 750000.00, 'development', 'execution'),
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Novel Antiviral Therapies for Emerging Pathogens', 'NAT-EP-2024', 'Developing broad-spectrum antiviral treatments', 'r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 't6d9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'l6d9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'd9f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '2024-02-01', '2027-01-31', NULL, 2200000.00, 'applied', 'execution'),
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Mathematical Models for Climate Prediction', 'MMCP-2024', 'Advanced statistical models for accurate climate forecasting', 'r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 't7d10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'l7d10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'd10g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', '2023-12-01', '2025-11-30', NULL, 850000.00, 'basic', 'execution'),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'CRISPR-Based Gene Editing for Rare Diseases', 'CRISPR-RD-2024', 'Developing precise gene editing techniques for genetic disorders', 'r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 't8d2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'l8d2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'd2a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', '2024-03-15', '2028-03-14', NULL, 3100000.00, 'innovation', 'planning'),
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Autonomous Surgical Robotics System', 'ASRS-2024', 'Developing AI-powered robots for precision surgery', 'r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 't9d3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'l9d3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'd3b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2024-05-01', '2026-04-30', NULL, 1650000.00, 'development', 'planning'),
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Nanomaterials for Sustainable Energy Storage', 'NSES-2024', 'Developing advanced nanomaterials for efficient energy storage', 'r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 't10d6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'l10d6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'd6c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', '2024-01-15', '2026-07-14', NULL, 1950000.00, 'innovation', 'execution');

-- 9. Insertar relaciones investigadores-proyectos
INSERT INTO researcher_projects (researcher_id, project_id, role, weekly_hours, incorporation_date)
VALUES
('r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'principal', 35, '2024-04-01'),
('r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'principal', 40, '2024-05-15'),
('r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'principal', 38, '2024-03-01'),
('r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'principal', 32, '2024-06-01'),
('r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'principal', 36, '2024-04-15'),
('r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'principal', 34, '2024-02-01'),
('r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'principal', 30, '2023-12-01'),
('r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'principal', 37, '2024-03-15'),
('r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'principal', 39, '2024-05-01'),
('r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'principal', 35, '2024-01-15'),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'co-researcher', 20, '2024-04-01'),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'collaborator', 15, '2024-05-15'),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'co-researcher', 25, '2024-03-01'),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'collaborator', 10, '2024-06-01'),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'co-researcher', 22, '2024-04-15'),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'collaborator', 12, '2024-02-01'),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'co-researcher', 18, '2023-12-01'),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'collaborator', 14, '2024-03-15'),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'co-researcher', 24, '2024-05-01'),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'collaborator', 16, '2024-01-15');

-- 10. Insertar relaciones proyectos-áreas
INSERT INTO project_areas (project_id, area_id, is_main)
VALUES
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 1),  
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 0),  
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 1),  
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 0),  
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 1),  
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 0),  
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 1),  
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 0), 
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 1),  
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 0),  
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 1),  
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 0),  
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 1), 
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 0),  
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 1),  
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 0), 
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 1),  
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 0),  
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 1), 
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 0);

-- 11. Insertar financiamientos
INSERT INTO fundings (funding_id, project_id, institution_id, call_id, contract_code, description, funding_type, total_amount, currency, approval_date, disbursement_start_date, disbursement_end_date, status)
VALUES
('f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'CONTRACT-001', 'Initial funding for AI medical research', 'external', 1200000.00, 'USD', '2024-03-20', '2024-04-01', '2026-03-31', 'active'),
('f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'CONTRACT-002', 'Quantum computing for pharmaceuticals', 'governmental', 2500000.00, 'USD', '2024-04-30', '2024-05-15', '2027-05-14', 'active'),
('f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'CONTRACT-003', 'Personalized cancer treatment research', 'governmental', 1800000.00, 'USD', '2024-02-28', '2024-03-01', '2028-02-28', 'active'),
('f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'CONTRACT-004', 'Quantum encryption systems development', 'governmental', 950000.00, 'EUR', '2024-05-31', '2024-06-01', '2026-11-30', 'active'),
('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'CONTRACT-005', 'Natural language understanding research', 'external', 750000.00, 'USD', '2024-04-10', '2024-04-15', '2025-10-14', 'active'),
('f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'CONTRACT-006', 'Antiviral therapies development', 'governmental', 2200000.00, 'USD', '2024-01-31', '2024-02-01', '2027-01-31', 'active'),
('f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'g6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'CONTRACT-007', 'Climate prediction models research', 'external', 850000.00, 'GBP', '2024-01-15', '2023-12-01', '2025-11-30', 'active'),
('f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a28', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'CONTRACT-008', 'Gene editing for rare diseases', 'external', 3100000.00, 'USD', '2024-03-10', '2024-03-15', '2028-03-14', 'active'),
('f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a29', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'CONTRACT-009', 'Surgical robotics development', 'external', 1650000.00, 'USD', '2024-04-20', '2024-05-01', '2026-04-30', 'active'),
('f10eebc99-9c0b-4ef8-bb6d-6bb9bd380a30', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'CONTRACT-010', 'Nanomaterials for energy storage', 'external', 1950000.00, 'USD', '2024-02-28', '2024-01-15', '2026-07-14', 'active');

-- 12. Insertar desembolsos
INSERT INTO disbursements (funding_id, amount, disbursement_date, invoice_number, concept, status)
-- Initial disbursements (30%)
SELECT funding_id, total_amount * 0.3, DATEADD(MONTH, 1, approval_date), 'INV-' + RIGHT('000' + CAST((ROW_NUMBER() OVER (ORDER BY funding_id)) AS VARCHAR(3)), 3), 'Initial disbursement', 'disbursed'
FROM fundings
WHERE funding_id IN (
    'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21',
    'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a22',
    'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a23',
    'f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a24',
    'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a25',
    'f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a26',
    'f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a27',
    'f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a28',
    'f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a29',
    'f10eebc99-9c0b-4ef8-bb6d-6bb9bd380a30'
)
UNION ALL
-- Second disbursements (40%)
SELECT funding_id, total_amount * 0.4, DATEADD(MONTH, 6, approval_date), 'INV-' + RIGHT('000' + CAST((ROW_NUMBER() OVER (ORDER BY funding_id)) + 10 AS VARCHAR(3)), 3), 'Second disbursement', 'pending'
FROM fundings
WHERE funding_id IN (
    'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21',
    'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a22',
    'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a23',
    'f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a24',
    'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a25',
    'f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a26',
    'f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a27',
    'f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a28',
    'f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a29',
    'f10eebc99-9c0b-4ef8-bb6d-6bb9bd380a30'
)
UNION ALL
-- Final disbursements (30%)
SELECT funding_id, total_amount * 0.3, DATEADD(MONTH, 12, approval_date), 'INV-' + RIGHT('000' + CAST((ROW_NUMBER() OVER (ORDER BY funding_id)) + 20 AS VARCHAR(3)), 3), 'Final disbursement', 'pending'
FROM fundings
WHERE funding_id IN (
    'f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a21',
    'f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a22',
    'f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a23',
    'f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a24',
    'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a25',
    'f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a26',
    'f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a27',
    'f8eebc99-9c0b-4ef8-bb6d-6bb9bd380a28',
    'f9eebc99-9c0b-4ef8-bb6d-6bb9bd380a29',
    'f10eebc99-9c0b-4ef8-bb6d-6bb9bd380a30'
);

-- 13. Insertar eventos académicos
INSERT INTO academic_events (event_id, name, type, organizer, country, city, start_date, end_date, website, status)
VALUES
('e1eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 'International Conference on Artificial Intelligence', 'conference', 'IEEE', 'USA', 'San Francisco', '2024-07-15', '2024-07-18', 'https://icai2024.org', 'planned'),
('e2eebc99-9c0b-4ef8-bb6d-6bb9bd380a32', 'World Quantum Symposium', 'symposium', 'Quantum Foundation', 'Switzerland', 'Geneva', '2024-09-10', '2024-09-13', 'https://worldquantum.org', 'planned'),
('e3eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Global Cancer Research Summit', 'congress', 'WHO', 'France', 'Paris', '2024-05-20', '2024-05-23', 'https://cancersummit2024.org', 'planned'),
('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 'Neural Information Processing Systems', 'conference', 'NeurIPS Foundation', 'Canada', 'Vancouver', '2024-12-10', '2024-12-15', 'https://neurips.cc', 'planned'),
('e5eebc99-9c0b-4ef8-bb6d-6bb9bd380a35', 'International Materials Science Workshop', 'workshop', 'Materials Research Society', 'Germany', 'Berlin', '2024-06-05', '2024-06-07', 'https://mrs-workshop2024.org', 'planned'),
('e6eebc99-9c0b-4ef8-bb6d-6bb9bd380a36', 'Bioinformatics and Genomics Seminar', 'seminar', 'EMBL', 'UK', 'Cambridge', '2024-08-22', '2024-08-24', 'https://embl-seminar2024.org', 'planned'),
('e7eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 'Robotics and Automation Conference', 'conference', 'IEEE Robotics', 'Japan', 'Tokyo', '2024-10-15', '2024-10-18', 'https://icra2024.org', 'planned'),
('e8eebc99-9c0b-4ef8-bb6d-6bb9bd380a38', 'Climate Change Symposium', 'symposium', 'UN Environment', 'Kenya', 'Nairobi', '2024-11-05', '2024-11-08', 'https://un-climate2024.org', 'planned'),
('e9eebc99-9c0b-4ef8-bb6d-6bb9bd380a39', 'Nanotechnology Congress', 'congress', 'International Nanotech Society', 'USA', 'Boston', '2024-07-25', '2024-07-28', 'https://nanocongress2024.org', 'planned'),
('e10eebc99-9c0b-4ef8-bb6d-6bb9bd380a40', 'Medical Innovation Summit', 'congress', 'Mayo Clinic', 'USA', 'Rochester', '2024-09-30', '2024-10-02', 'https://medicalinnovation2024.org', 'planned');

-- 14. Insertar publicaciones
INSERT INTO publications (publication_id, title, abstract, publication_date, doi, isbn_issn, pages, volume, number, journal_name, event_id, type, indexing, impact_factor, quartile, total_citations, citations_last_year)
VALUES
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'Deep Learning for Early Cancer Detection in Medical Imaging', 'This paper presents a novel deep learning approach for early detection of cancer in medical images using convolutional neural networks and transfer learning techniques.', '2024-01-15', '10.1016/j.media.2024.102345', '1361-8415', '123-135', '45', '3', 'Medical Image Analysis', 'e1eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 'journal_article', 'scopus', 8.345, 'Q1', 42, 42),
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'Quantum Algorithms for Molecular Simulation in Drug Discovery', 'We propose efficient quantum algorithms for simulating molecular interactions, significantly accelerating the drug discovery process compared to classical methods.', '2024-02-20', '10.1038/s41567-024-02445-9', '1745-2473', '567-580', '20', '4', 'Nature Physics', 'e2eebc99-9c0b-4ef8-bb6d-6bb9bd380a32', 'journal_article', 'wos', 25.345, 'Q1', 28, 28),
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'Personalized Immunotherapy Based on Genetic Profiling of Tumor Microenvironment', 'This study demonstrates how genetic profiling of the tumor microenvironment can guide personalized immunotherapy approaches for better cancer treatment outcomes.', '2024-03-10', '10.1016/j.ccell.2024.03.005', '1535-6108', '234-247', '35', '2', 'Cancer Cell', 'e3eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'journal_article', 'scopus', 22.456, 'Q1', 35, 35),
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Quantum Key Distribution Using Entangled Photon Pairs', 'We present a secure quantum communication protocol using entangled photon pairs for unbreakable encryption with practical implementation considerations.', '2024-01-30', '10.1103/PhysRevLett.132.040601', '0031-9007', '040601', '132', '4', 'Physical Review Letters', NULL, 'journal_article', 'wos', 9.185, 'Q1', 19, 19),
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'Transformer Architectures for Multilingual Natural Language Understanding', 'This paper explores advanced transformer architectures for multilingual natural language understanding tasks, achieving state-of-the-art results across 50 languages.', '2024-02-15', '10.1162/tacl_a_00678', '1947-8767', '456-472', '12', '1', 'Transactions of the ACL', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 'journal_article', 'scopus', 6.789, 'Q1', 31, 31),
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'Broad-Spectrum Antiviral Compounds Targeting Viral Polymerases', 'We identify and characterize novel broad-spectrum antiviral compounds that effectively inhibit multiple viral polymerases with high specificity and low toxicity.', '2024-03-05', '10.1126/science.adn1234', '0036-8075', '1123-1135', '383', '6685', 'Science', NULL, 'journal_article', 'wos', 47.728, 'Q1', 57, 57),
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'Bayesian Hierarchical Models for Climate Prediction Uncertainty', 'This work develops Bayesian hierarchical models to better quantify uncertainty in climate predictions, improving reliability of long-term climate forecasts.', '2024-01-25', '10.1175/JCLI-D-23-0452.1', '0894-8755', '789-802', '37', '3', 'Journal of Climate', 'e8eebc99-9c0b-4ef8-bb6d-6bb9bd380a38', 'journal_article', 'scopus', 5.432, 'Q1', 23, 23),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'CRISPR-Cas9 Precision Editing for Monogenic Disorders', 'We demonstrate highly precise CRISPR-Cas9 editing techniques for treating monogenic disorders with minimal off-target effects in preclinical models.', '2024-02-28', '10.1038/s41587-024-02345-9', '1546-1696', '345-358', '42', '2', 'Nature Biotechnology', NULL, 'journal_article', 'wos', 36.558, 'Q1', 48, 48),
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 'Autonomous Robotic System for Minimally Invasive Surgery', 'This paper presents an autonomous robotic system capable of performing complex minimally invasive surgical procedures with superhuman precision.', '2024-03-15', '10.1126/scirobotics.adn5678', '1940-1892', 'eadn5678', '9', '87', 'Science Robotics', 'e7eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 'journal_article', 'scopus', 18.345, 'Q1', 26, 26),
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 'Graphene-Based Nanocomposites for High-Capacity Energy Storage', 'We develop graphene-based nanocomposite materials that demonstrate exceptional energy storage capacity and cycling stability for next-generation batteries.', '2024-02-10', '10.1016/j.joule.2024.02.008', '2542-4351', '234-247', '8', '2', 'Joule', 'e9eebc99-9c0b-4ef8-bb6d-6bb9bd380a39', 'journal_article', 'scopus', 27.345, 'Q1', 39, 39);

-- 15. Insertar autores de publicaciones
INSERT INTO publication_authors (researcher_id, publication_id, author_order, contribution, is_corresponding)
VALUES
('r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 1, 'Conceptualization, Methodology, Writing - original draft', 1),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 2, 'Data curation, Formal analysis', 0),
('r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 1, 'Conceptualization, Software development', 1),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 2, 'Validation, Visualization', 0),
('r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 1, 'Methodology, Investigation, Writing', 1),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 2, 'Resources, Data curation', 0),
('r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 1, 'Conceptualization, Supervision', 1),
('r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 1, 'Software, Validation, Writing', 1),
('r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 1, 'Investigation, Methodology', 1),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 2, 'Formal analysis, Visualization', 0),
('r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 1, 'Conceptualization, Data analysis', 1),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 2, 'Methodology, Software', 0),
('r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 1, 'Supervision, Writing - review', 1),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 2, 'Investigation, Validation', 0),
('r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 1, 'Conceptualization, Project administration', 1),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 2, 'Software development, Testing', 0),
('r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 1, 'Methodology, Resources', 1),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 2, 'Data curation, Formal analysis', 0);

-- 16. Insertar relaciones proyectos-publicaciones
INSERT INTO project_publications (project_id, publication_id)
VALUES
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41'),
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42'),
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43'),
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44'),
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45'),
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46'),
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47'),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48'),
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49'),
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50');

--17 insertar en areas de publicacion
INSERT INTO publication_areas (publication_id, area_id, is_main)
VALUES
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 1),
('p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 0),
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 1),
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 0),
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 1),
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 0),
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 1),
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 0),
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 1),
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 0),
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 1),
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 0),
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'a10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 1),
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 0),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 1),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 0),
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 1),
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 0),
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 1),
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 0);

-- 18. Insertar citas entre publicaciones
INSERT INTO publication_citations (citing_publication_id, cited_publication_id, context, citation_date)
VALUES
('p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'Our quantum approach builds upon the deep learning foundations established by Chen et al.', '2024-02-20'),
('p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'The medical imaging techniques described provide valuable insights for our immunotherapy research', '2024-03-10'),
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'Following the neural network architecture proposed for medical applications', '2024-02-15'),
('p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'Building on the personalized medicine approach for antiviral development', '2024-03-05'),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'Using similar compound screening methodologies for genetic therapies', '2024-02-28'),
('p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'Incorporating transformer architectures for robotic decision-making', '2024-03-15'),
('p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'Applying statistical models for materials performance prediction', '2024-02-10'),
('p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'Extending quantum algorithms for communication applications', '2024-01-30'),
('p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'Adapting machine learning techniques for climate modeling', '2024-01-25'),
('p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'Combining AI diagnostics with genetic interventions', '2024-02-28');

-- 19. Insertar patentes
INSERT INTO patents (patent_id, title, patent_number, description, application_date, grant_date, country, patent_office, status, project_id)
VALUES
('pat1eebc99-9c0b-4ef8-bb6d-6bb9bd380a51', 'AI System for Medical Image Analysis and Diagnosis', 'US20240123456A1', 'An artificial intelligence system for automated analysis of medical images and diagnostic assistance', '2024-01-15', NULL, 'USA', 'USPTO', 'applied', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'),
('pat2eebc99-9c0b-4ef8-bb6d-6bb9bd380a52', 'Quantum Algorithm for Molecular Simulation', 'EP20240198765B1', 'Novel quantum computing algorithm for efficient molecular simulation and drug discovery', '2024-02-20', '2024-03-15', 'European Union', 'EPO', 'granted', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12'),
('pat3eebc99-9c0b-4ef8-bb6d-6bb9bd380a53', 'Personalized Cancer Immunotherapy Protocol', 'JP2024054321A', 'Method for developing personalized immunotherapy based on genetic profiling', '2024-03-10', NULL, 'Japan', 'JPO', 'applied', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13'),
('pat4eebc99-9c0b-4ef8-bb6d-6bb9bd380a54', 'Quantum Encryption System Using Entangled Photons', 'US20240111111A1', 'Secure communication system utilizing quantum entanglement for unbreakable encryption', '2024-01-30', NULL, 'USA', 'USPTO', 'applied', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14'),
('pat5eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Multilingual Natural Language Processing Framework', 'WO2024022222A1', 'Software framework for multilingual natural language understanding and processing', '2024-02-15', '2024-04-01', 'International', 'WIPO', 'granted', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15'),
('pat6eebc99-9c0b-4ef8-bb6d-6bb9bd380a56', 'Broad-Spectrum Antiviral Compound Formulation', 'US20240333333A1', 'Pharmaceutical composition with broad-spectrum antiviral activity', '2024-03-05', NULL, 'USA', 'USPTO', 'applied', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16'),
('pat7eebc99-9c0b-4ef8-bb6d-6bb9bd380a57', 'Climate Prediction Uncertainty Quantification System', 'EP2024044444A2', 'System for quantifying and visualizing uncertainty in climate predictions', '2024-01-25', NULL, 'European Union', 'EPO', 'applied', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17'),
('pat8eebc99-9c0b-4ef8-bb6d-6bb9bd380a58', 'Precision CRISPR-Cas9 Gene Editing Method', 'US20240555555A1', 'Method for highly precise gene editing with reduced off-target effects', '2024-02-28', NULL, 'USA', 'USPTO', 'applied', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18'),
('pat9eebc99-9c0b-4ef8-bb6d-6bb9bd380a59', 'Autonomous Surgical Robotics Control System', 'KR2024066666A', 'Control system for autonomous robotic surgery with real-time adaptation', '2024-03-15', NULL, 'South Korea', 'KIPO', 'applied', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19'),
('pat10eebc99-9c0b-4ef8-bb6d-6bb9bd380a60', 'Graphene Nanocomposite for Energy Storage', 'CN2024077777A', 'Nanocomposite material based on graphene for high-capacity energy storage devices', '2024-02-10', '2024-04-10', 'China', 'CNIPA', 'granted', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20');

-- 20. Insertar inventores de patentes
INSERT INTO patent_inventors (researcher_id, patent_id, inventor_order, contribution)
SELECT rp.principal_researcher_id, p.patent_id, 1, 'Primary inventor and conceptual designer'
FROM patents p
INNER JOIN research_projects rp ON p.project_id = rp.project_id
UNION ALL
SELECT 
    CASE 
        WHEN p.project_id = 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11' THEN 'r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18'
        WHEN p.project_id = 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12' THEN 'r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19'
        WHEN p.project_id = 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13' THEN 'r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20'
        WHEN p.project_id = 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14' THEN 'r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15'
        WHEN p.project_id = 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15' THEN 'r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16'
        WHEN p.project_id = 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16' THEN 'r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17'
        WHEN p.project_id = 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17' THEN 'r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11'
        WHEN p.project_id = 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18' THEN 'r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12'
        WHEN p.project_id = 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19' THEN 'r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13'
        WHEN p.project_id = 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a20' THEN 'r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14'
    END,
    p.patent_id, 2, 'Co-inventor and technical implementer'
FROM patents p;

-- 21. Insertar revisores
INSERT INTO reviewers (reviewer_id, researcher_id, expertise_areas, affiliation_institution, status)
VALUES
('rev1eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Artificial Intelligence, Medical Imaging, Machine Learning', 'Harvard University', 'active'),
('rev2eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', 'r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Quantum Computing, Physics, Algorithms', 'MIT', 'active'),
('rev3eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', 'r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Oncology, Immunology, Genetics', 'Stanford University', 'active'),
('rev4eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', 'r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Quantum Optics, Photonics, Encryption', 'Max Planck Institute', 'active'),
('rev5eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', 'r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Natural Language Processing, Deep Learning', 'Google Research', 'active'),
('rev6eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Virology, Pharmacology, Infectious Diseases', 'NIH', 'active'),
('rev7eebc99-9c0b-4ef8-bb6d-6bb9bd380a67', 'r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Statistics, Climate Science, Mathematics', 'University of Oxford', 'active'),
('rev8eebc99-9c0b-4ef8-bb6d-6bb9bd380a68', 'r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Computer Science, Bioinformatics, AI', 'ETH Zurich', 'active'),
('rev9eebc99-9c0b-4ef8-bb6d-6bb9bd380a69', 'r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Microbiology, Genetics, Molecular Biology', 'Pasteur Institute', 'active'),
('rev10eebc99-9c0b-4ef8-bb6d-6bb9bd380a70', 'r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Aerospace Engineering, Physics, Materials Science', 'NASA', 'active');

-- 22. Insertar procesos de evaluación
INSERT INTO review_processes (process_id, publication_id, reviewer_id, assignment_date, deadline_date, completion_date, comments, decision, score)
VALUES
('rp1eebc99-9c0b-4ef8-bb6d-6bb9bd380a71', 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'rev2eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', '2023-11-15', '2023-12-15', '2023-12-10', 'Excellent methodology and significant contribution to the field. Well-written and thoroughly researched.', 'accepted', 5),
('rp2eebc99-9c0b-4ef8-bb6d-6bb9bd380a72', 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'rev4eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', '2023-12-01', '2024-01-15', '2024-01-10', 'Novel approach but requires additional validation experiments. Good potential impact.', 'major_revision', 4),
('rp3eebc99-9c0b-4ef8-bb6d-6bb9bd380a73', 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'rev3eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', '2023-12-10', '2024-01-31', '2024-01-25', 'Outstanding clinical relevance and rigorous experimental design. Minor grammatical corrections needed.', 'minor_revision', 5),
('rp4eebc99-9c0b-4ef8-bb6d-6bb9bd380a74', 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'rev2eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', '2023-11-20', '2023-12-20', '2023-12-18', 'Solid theoretical foundation but lacks practical implementation details.', 'major_revision', 3),
('rp5eebc99-9c0b-4ef8-bb6d-6bb9bd380a75', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'rev5eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', '2023-12-05', '2024-01-20', '2024-01-15', 'Comprehensive study with impressive multilingual results. Well-executed research.', 'accepted', 5),
('rp6eebc99-9c0b-4ef8-bb6d-6bb9bd380a76', 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'rev6eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', '2023-12-15', '2024-02-15', '2024-02-10', 'Important contribution to antiviral research. Additional cytotoxicity data required.', 'minor_revision', 4),
('rp7eebc99-9c0b-4ef8-bb6d-6bb9bd380a77', 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'rev7eebc99-9c0b-4ef8-bb6d-6bb9bd380a67', '2023-11-25', '2023-12-31', '2023-12-28', 'Innovative statistical approach to climate modeling. Clear presentation of methods.', 'accepted', 4),
('rp8eebc99-9c0b-4ef8-bb6d-6bb9bd380a78', 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'rev9eebc99-9c0b-4ef8-bb6d-6bb9bd380a69', '2023-12-20', '2024-02-10', '2024-02-05', 'Significant advance in gene editing precision. More in vivo validation needed.', 'major_revision', 4),
('rp9eebc99-9c0b-4ef8-bb6d-6bb9bd380a79', 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 'rev1eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', '2024-01-05', '2024-02-28', NULL, 'Review in progress', 'pending', NULL),
('rp10eebc99-9c0b-4ef8-bb6d-6bb9bd380a80', 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 'rev10eebc99-9c0b-4ef8-bb6d-6bb9bd380a70', '2023-12-08', '2024-01-25', '2024-01-20', 'Excellent materials science research with practical energy applications.', 'accepted', 5);

-- 23. Insertar relaciones revisores-áreas
INSERT INTO reviewer_areas (reviewer_id, area_id, expertise_level)
VALUES
('rev1eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'high'),
('rev1eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'medium'),
('rev2eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'high'),
('rev2eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'high'),
('rev3eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'high'),
('rev3eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'medium'),
('rev4eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'high'),
('rev4eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'medium'),
('rev5eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'high'),
('rev5eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'high');

-- 24. Insertar indicadores de impacto
INSERT INTO impact_indicators (researcher_id, publication_id, indicator_type, value, measurement_date, source)
VALUES
('r1a0eebc-99-9c0b-4ef8-bb6d-6bb9bd380a11', NULL, 'h_index', 42.00, '2024-03-01', 'Scopus'),
('r2b1eebc-99-9c0b-4ef8-bb6d-6bb9bd380a12', NULL, 'h_index', 38.00, '2024-03-01', 'Web of Science'),
('r3c2eebc-99-9c0b-4ef8-bb6d-6bb9bd380a13', NULL, 'h_index', 28.00, '2024-03-01', 'Scopus'),
('r4d3eebc-99-9c0b-4ef8-bb6d-6bb9bd380a14', NULL, 'h_index', 55.00, '2024-03-01', 'Web of Science'),
('r5e4eebc-99-9c0b-4ef8-bb6d-6bb9bd380a15', NULL, 'h_index', 22.00, '2024-03-01', 'Google Scholar'),
('r6f5eebc-99-9c0b-4ef8-bb6d-6bb9bd380a16', NULL, 'h_index', 18.00, '2024-03-01', 'Scopus'),
('r7g6eebc-99-9c0b-4ef8-bb6d-6bb9bd380a17', NULL, 'h_index', 35.00, '2024-03-01', 'Web of Science'),
('r8h7eebc-99-9c0b-4ef8-bb6d-6bb9bd380a18', NULL, 'h_index', 20.00, '2024-03-01', 'Scopus'),
('r9i8eebc-99-9c0b-4ef8-bb6d-6bb9bd380a19', NULL, 'h_index', 31.00, '2024-03-01', 'Web of Science'),
('r10j9eebc-99-9c0b-4ef8-bb6d-6bb9bd380a20', NULL, 'h_index', 26.00, '2024-03-01', 'Scopus'),
(NULL, 'p1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'citations', 42.00, '2024-03-20', 'Google Scholar'),
(NULL, 'p2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42', 'citations', 28.00, '2024-03-20', 'Web of Science'),
(NULL, 'p3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43', 'citations', 35.00, '2024-03-20', 'Scopus'),
(NULL, 'p4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'citations', 19.00, '2024-03-20', 'Web of Science'),
(NULL, 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45', 'citations', 31.00, '2024-03-20', 'Google Scholar'),
(NULL, 'p6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46', 'citations', 57.00, '2024-03-20', 'Scopus'),
(NULL, 'p7eebc99-9c0b-4ef8-bb6d-6bb9bd380a47', 'citations', 23.00, '2024-03-20', 'Web of Science'),
(NULL, 'p8eebc99-9c0b-4ef8-bb6d-6bb9bd380a48', 'citations', 48.00, '2024-03-20', 'Scopus'),
(NULL, 'p9eebc99-9c0b-4ef8-bb6d-6bb9bd380a49', 'citations', 26.00, '2024-03-20', 'Google Scholar'),
(NULL, 'p10eebc99-9c0b-4ef8-bb6d-6bb9bd380a50', 'citations', 39.00, '2024-03-20', 'Web of Science');

