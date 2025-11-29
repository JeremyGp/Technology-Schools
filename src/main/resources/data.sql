-- Insertar roles
INSERT INTO Rol (nombre) VALUES 
('Alumno'),
('Profesor');

-- Insertar usuarios (Alumnos)
INSERT INTO Usuario (nombre, email, codigo, contrasena, fechaCreacion, rol_id) VALUES
('Leonardo Diaz', 'leonar@gmail.com', 's245690', '12345', '2025-10-15', 1),
('Sofia Martinez', 'sofimar@gmail.com', 's245691', '12345', '2025-10-15', 1),
('Mateo Ramirez', 'marami@gmail.com', 's245692', '12345', '2025-10-15', 1),
('Isabella Torres', 'isabellat@gmail.com','s245693', '12345', '2025-10-15', 1);

-- Insertar usuarios (Profesores)
INSERT INTO Usuario (nombre, email, codigo, contrasena, fechaCreacion, rol_id) VALUES
('Carlos Gomez', 'calosgomez3@gmail.com', 'p123456', '12345', '2025-10-15', 2),
('Maria Fernandez', 'marifer13@gmail.com', 'p123457', '12345', '2025-10-15', 2),
('Carlos Torres', 'torrescl@gmail.com','p123458', '12345', '2025-10-15', 2),
('Ana Lopez', 'analop@gmail.com','p123459', '12345', '2025-10-15', 2),
('Javier Morales', 'javiermorales@gmai.com', 'p123460', '12345', '2025-10-15', 2),
('Lucia Alvarez', 'lucialvarez@gmail.com','p123461', '12345', '2025-10-15', 2),
('Diego Herrera', 'herraradi@gmail.com', 'p123462', '12345', '2025-10-15', 2),
('Valeria Ruiz', 'valeriz@gmail.com', 'p123463', '12345', '2025-10-15', 2);

-- Insertar Categorías
INSERT INTO Categoria (nombre, precio) VALUES 
('Mañana', 450.00),
('Tarde', 390.00);

-- Insertar Matriculas con precios correctos según categoría
-- Categoría 1 (Mañana → 450.00)
INSERT INTO Matriculas (usuario_id, categoria_precio, categoria_id, fechaCreacion) VALUES
(1, 450.00, 1, '2025-09-15'),
(2, 450.00, 1, '2025-09-15');

-- Categoría 2 (Tarde → 390.00)
INSERT INTO Matriculas (usuario_id, categoria_precio, categoria_id, fechaCreacion) VALUES 
(3, 390.00, 2, '2025-09-15'),
(4, 390.00, 2, '2025-09-15');

INSERT INTO Asistencia (estado, usuario_id, categoria_id, fecha) VALUES
('Presente', 1, 1, '2025-11-27'),
('Presente', 1, 1, '2025-11-26'),
('Presente', 2, 1, '2025-11-27'),
('Presente', 2, 1, '2025-11-26'),
('Presente', 3, 1, '2025-11-27'),
('Presente', 3, 1, '2025-11-26'),
('Presente', 4, 1, '2025-11-27'),
('Presente', 4, 1, '2025-11-26');
