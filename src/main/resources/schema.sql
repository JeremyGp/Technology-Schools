-- Tabla Roles (Alumnos, Profesores)
CREATE TABLE Rol (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla Usuarios
CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    codigo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    fechaCreacion DATE NOT NULL,
    rol_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES Rol(id)
);

-- Tabla Categorías de Matriculas (Mañana, Tarde)
CREATE TABLE Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla Matriculas
CREATE TABLE Matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    categoria_precio DECIMAL(10,2) NOT NULL,
    categoria_id INT NOT NULL,
    fechaCreacion date not null,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (categoria_precio) REFERENCES Categoria(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
    
);

-- Detalles de cada compra (productos comprados y cantidades)
CREATE TABLE Asistencia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    categoria_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);