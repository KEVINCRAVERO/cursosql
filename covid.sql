-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS covid;

-- Usar la base de datos creada
USE covid;

-- Crear la tabla "paises"
CREATE TABLE IF NOT EXISTS paises (
    id_paises INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_pais TEXT NOT NULL,
    nombre_continente TEXT NOT NULL,
    cantidad_habitantes INT NOT NULL
);

-- Crear la tabla "fecha"
CREATE TABLE IF NOT EXISTS fecha (
    id_fecha DATETIME PRIMARY KEY NOT NULL,
    dia INT NOT NULL,
    mes NVARCHAR(255) NOT NULL,
    año INT NOT NULL
);

-- Crear la tabla "vacunas"
CREATE TABLE IF NOT EXISTS vacunas (
    id_vacuna INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_fecha DATETIME NOT NULL,
    id_pais INT NOT NULL,
    nombre_vacuna NVARCHAR(255) NOT NULL,
    cantidad_vacunados INT NOT NULL,
    FOREIGN KEY (id_fecha) REFERENCES fecha(id_fecha),
    FOREIGN KEY (id_pais) REFERENCES paises(id_paises)
);

-- Crear la tabla "decesos_por_covid"
CREATE TABLE IF NOT EXISTS decesos_por_covid (
    id_pais INT NOT NULL,
    id_fecha DATETIME NOT NULL,
    id_vacuna INT NOT NULL,
    cantidad_decesos INT NOT NULL,
    PRIMARY KEY (id_pais, id_fecha),
    FOREIGN KEY (id_pais) REFERENCES paises(id_paises),
    FOREIGN KEY (id_fecha) REFERENCES fecha(id_fecha),
    FOREIGN KEY (id_vacuna) REFERENCES vacunas(id_vacuna)
);

-- Usar la base de datos creada
USE covid;
-- Crear la tabla "recuperados"
CREATE TABLE IF NOT EXISTS recuperados (
    id_pais INT NOT NULL,
    id_fecha DATETIME NOT NULL,
    cantidad_recuperados INT NOT NULL,
    PRIMARY KEY (id_pais, id_fecha),
    FOREIGN KEY (id_pais) REFERENCES paises(id_paises),
    FOREIGN KEY (id_fecha) REFERENCES fecha(id_fecha)
);