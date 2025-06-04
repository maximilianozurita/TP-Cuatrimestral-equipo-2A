CREATE DATABASE eCommerce
go
use eCommerce
go 
CREATE TABLE Permisos (
	ID INT PRIMARY KEY IDENTITY(1,1),
    BitWise INT,
	Codigo NVARCHAR(30),
	Estado BIT
);

CREATE TABLE Categorias (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	Estado BIT
);

CREATE TABLE Marcas (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	Estado BIT
);

CREATE TABLE Estado_envio (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Descripcion NVARCHAR(100),
	Estado BIT
);


CREATE TABLE Usuarios (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Permisos INT,
	Fecha_alta DATETIME,
	Fecha_baja DATETIME NULL,
	Nombre NVARCHAR(50),
	Apellido NVARCHAR(50),
	Email NVARCHAR(100),
	Telefono NVARCHAR(20),
	Password NVARCHAR(255),
	Direccion NVARCHAR(255)
);


CREATE TABLE Productos (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	Descripcion NVARCHAR(MAX),
	Categoria_ID INT FOREIGN KEY REFERENCES Categorias(ID),
	Marca_ID INT FOREIGN KEY REFERENCES Marcas(ID),
	Precio DECIMAL(18, 2),
	Descuento DECIMAL(5, 2),
	Estado BIT
);

CREATE TABLE Ventas (
	Venta_ID INT PRIMARY KEY IDENTITY(1,1),
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	Suma_total DECIMAL(18, 2),
	Fecha_venta DATETIME
);

CREATE TABLE Carrito (
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	Producto_id INT FOREIGN KEY REFERENCES Productos(ID),
	Cantidad INT,
	Precio DECIMAL(18, 2),
	Venta_id INT NULL FOREIGN KEY REFERENCES Ventas(Venta_ID),
	PRIMARY KEY (Usuario_id, Producto_id)
);

CREATE TABLE Imagenes (
	Uri_imagen NVARCHAR(255),
	Producto_ID INT FOREIGN KEY REFERENCES Productos(ID),
	Estado BIT
);

CREATE TABLE Favoritos (
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	Producto_id INT FOREIGN KEY REFERENCES Productos(ID),
	PRIMARY KEY (Usuario_id, Producto_id)
);

CREATE TABLE Envios (
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	Venta_ID INT FOREIGN KEY REFERENCES Ventas(Venta_ID),
	Estado_envio_ID INT FOREIGN KEY REFERENCES Estado_envio(ID),
	PRIMARY KEY (Usuario_id, Venta_ID)
);