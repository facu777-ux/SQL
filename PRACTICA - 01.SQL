-- Schema SQL
CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(50)
);

CREATE TABLE Libros (
    LibroID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Genero VARCHAR(50),
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE Miembros (
    MiembroID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    FechaNacimiento DATE
);

CREATE TABLE Prestamos (
    PrestamoID INT PRIMARY KEY,
    LibroID INT,
    MiembroID INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID),
    FOREIGN KEY (MiembroID) REFERENCES Miembros(MiembroID)
);

INSERT INTO Autores (AutorID, Nombre, Nacionalidad)
VALUES 
(1, 'Gabriel García Márquez', 'Argentino'),
(2, 'Cristóbal Rolón', 'Peruano'),
(3, 'Tego El Bambino', 'Boliviano');

INSERT INTO Libros (LibroID, Nombre, Genero, AutorID)
VALUES 
(1, 'Los mapuches', 'Acción', 1),
(2, 'Los Pehuelches', 'Historia', 2),
(3, 'Los katunes', 'Aventura', 3),
(4, 'Los ninjas', 'Tristeza Japonesa', 2);

INSERT INTO Miembros (MiembroID, Nombre, FechaNacimiento)
VALUES 
(1, 'Juan', '1990-01-01'),
(2, 'Pepe', '1992-02-02'),
(3, 'Honguito', '1993-03-03');

INSERT INTO Prestamos (PrestamoID, LibroID, MiembroID, FechaPrestamo, FechaDevolucion)
VALUES 
(1, 1, 1, '2024-08-01', '2024-08-15'),
(2, 2, 2, '2024-08-05', '2024-08-19'),
(3, 3, 3, '2024-08-08', NULL);

-- Query SQL
SELECT Biblioteca.Libros.Nombre, Biblioteca.Autores.Nombre AS Autor
FROM Biblioteca.Libros
INNER JOIN Biblioteca.Autores ON Biblioteca.Libros.AutorID = Biblioteca.Autores.AutorID;
