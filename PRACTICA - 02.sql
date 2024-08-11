-- ESQUEMA SQL:

--  Creo la Base de Datos denominada 'Tienda'
CREATE DATABASE Tienda;
USE Tienda;

--  Creo las tablas necesarias para gestionar la Tienda y guardar parámetros

CREATE TABLE Proveedores(
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(50)
);

CREATE TABLE Productos(
    ProductoID INT PRIMARY KEY,
    NombreProducto VARCHAR(100),
    Precio DECIMAL(10, 2),
    Stock INT,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

CREATE TABLE Ventas(
    VentaID INT PRIMARY KEY,
    ProductoID INT,
    Cantidad INT,
    FechaVenta DATE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- INSERTO DATOS A LAS TABLAS

INSERT INTO Proveedores (ProveedorID, Nombre, Telefono)
VALUES 
(1, 'Facundo', '2613358172'),
(2, 'Marcelo', '2614537898'),
(3, 'Martin', '2615643678');

INSERT INTO Productos(ProductoID, NombreProducto, Precio, Stock, ProveedorID)
VALUES
(1, 'Cafetera Express NesCafé', 19800.28, 51, 3),
(2, 'Café NesCafé', 250.90, 99, 3),
(3, 'Chocolate Aguila', 750.00, 25, 2),
(4, 'Zucaritas', 450.00, 25, 1);

INSERT INTO Ventas (VentaID, ProductoID, Cantidad, FechaVenta)
VALUES
(1, 1, 2, '2024-08-01'),
(2, 3, 1, '2024-08-02'),
(3, 4, 5, '2024-08-03'),
(4, 2, 1, '2024-08-04');

-- CONSULTAS:

-- CONSULTA PARA LISTAR PRODUCTOS Y SUS PROVEEDORES

SELECT p.NombreProducto AS Producto, pr.Nombre AS Proveedor
FROM Productos p
INNER JOIN Proveedores pr ON p.ProveedorID = pr.ProveedorID;