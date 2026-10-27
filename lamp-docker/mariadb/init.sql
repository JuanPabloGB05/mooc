CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  rol ENUM('user','admin') DEFAULT 'user',
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  completada TINYINT(1) DEFAULT 0,
  creada_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE materiales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('libro','revista','dvd') NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  autor VARCHAR(150) NOT NULL,
  anio INT,
  isbn VARCHAR(20),
  numero INT,              -- solo revistas
  duracion_min INT,        -- solo DVDs
  disponible TINYINT(1) DEFAULT 1,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prestamos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  material_id INT NOT NULL,
  usuario_id INT NOT NULL,
  fecha_prestamo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_devolucion TIMESTAMP NULL,
  FOREIGN KEY (material_id) REFERENCES materiales(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO materiales (tipo, titulo, autor, anio, isbn, numero, duracion_min, disponible) VALUES
('libro',   'Cien años de soledad', 'García Márquez', 1967, '978-0307474728', NULL, NULL, 1),
('libro',   'El Quijote',           'Cervantes',      1605, '978-8420412146', NULL, NULL, 1),
('revista', 'National Geographic',  'NatGeo',         2024, NULL, 245, NULL, 1),
('revista', 'Muy Interesante',      'Zinet',          2024, NULL, 512, NULL, 1),
('dvd',     'El Padrino',           'Coppola',        1972, NULL, NULL, 175, 1),
('dvd',     'Blade Runner',         'Scott',          1982, NULL, NULL, 117, 1);

INSERT INTO usuarios (email, password_hash, rol) VALUES
('admin@demo.com', '$2y$10$OdDdOYjvNoVak9kab4bqvuTBwI0iVgFb3Sb5mpjPKl27J6EJLG5L6', 'admin'),
('user@demo.com',  '$2y$10$vOqLGCjA8.04A8Pe1Ji/S.oJnv9stWbWkt4hryTFrpbpb05ZydO56', 'user');