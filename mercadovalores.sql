-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS mercado_de_valores;

-- Usar la base de datos creada
USE mercado_de_valores;

-- Crear la tabla "paises"
CREATE TABLE IF NOT EXISTS paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_pais TEXT NOT NULL,
    nombre_continente TEXT NOT NULL
);

-- Usar la base de datos creada
USE mercado_de_valores;

-- Crear la tabla "brokers"
CREATE TABLE IF NOT EXISTS brokers (
    id_broker INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_broker NVARCHAR(255) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

-- Usar la base de datos creada
USE mercado_de_valores;

-- Crear la tabla "acciones"
CREATE TABLE IF NOT EXISTS acciones (
    id_acciones INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    stiker NVARCHAR(255) NOT NULL,
    nombre_accion NVARCHAR(255) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

