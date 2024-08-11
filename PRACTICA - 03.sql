-- ESQUEMA SQL:

-- Creo la Base de datos

CREATE DATABASE TiendaRopa;
USE TiendaRopa;

-- Creo las tablas necesarias para gestinar la tienda

CREATE TABLE Categorias (
	CategoriaID INT PRIMARY KEY,
  	NombreCategoria VARCHAR (50)
);

CREATE TABLE Productos (
  ProductoID INT PRIMARY KEY,
  NombreProducto VARCHAR(50),
  Precio DECIMAL(10,2),
  Stock INT,
  CategoriaID INT,
  FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY,
  	Nombre VARCHAR(50),
  	Correo VARCHAR(100)
);

CREATE TABLE Ventas (
	VentaID INT PRIMARY KEY,
  	ProductoID INT,
  	ClienteID INT,
  	Cantidad INT,
  	FechaVenta DATE,
  	FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  
);


-- INSERTO DATOS A LA TABLAS

INSERT INTO Categorias (CategoriaID, NombreCategoria)
VALUES 
	(1, 'Camisetas'),
	(2, 'Pantalones'),
    (3, 'Zapatos');
    
INSERT INTO Productos (ProductoID, NombreProducto, Precio, Stock, CategoriaID)
VALUES 
	(1, 'Camiseta Blanca', 19800.02, 65, 1),
	(2, 'Pantalón Rayado', 5600.89, 98, 2),
    (3, 'Zapatos Nike', 163987.99, 56, 3);

INSERT INTO Clientes (ClienteID, Nombre, Correo)
VALUES 
	(1, 'Pepito', 'Pepito@gmail.com'),
	(2, 'Hongo', 'Hongo@dibiagi.local'),
    (3, 'Martin', 'Martin@dibiagi.local');

INSERT INTO Ventas (VentaID, ProductoID, ClienteID, Cantidad, FechaVenta)
VALUES 
	(1, 2, 1, 23, '2024-05-23'),
	(2, 1, 3, 52, '2006-06-23'),
    (3, 3, 2, 21, '2022-07-12');
    

-- CONSULTAS A LA BASEDE DATOS:

USE TiendaRopa;

SELECT p.NombreProducto AS Producto, c.NombreCategoria AS Categoria
FROM Productos p
INNER JOIN Categorias c ON p.CategoriaID = c.CategoriaID;