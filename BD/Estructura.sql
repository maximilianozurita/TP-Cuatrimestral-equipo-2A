CREATE DATABASE eCommerce
go
use eCommerce
go
CREATE TABLE Categorias (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	FechaBaja DATETIME NULL
);
go
CREATE TABLE Marcas (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	FechaBaja DATETIME NULL
);
go
CREATE TABLE Estado_envio (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Descripcion NVARCHAR(100),
	FechaBaja DATETIME NULL
);
go
CREATE TABLE Usuarios (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(50),
	Apellido NVARCHAR(50),
	Email NVARCHAR(100) UNIQUE,
	Password NVARCHAR(255),
	Telefono NVARCHAR(20),
	Direccion NVARCHAR(255),
	Permisos INT,
	Fecha_alta DATETIME,
	Fecha_baja DATETIME NULL,
);
go
CREATE TABLE Productos (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	Descripcion NVARCHAR(MAX),
	Categoria_ID INT FOREIGN KEY REFERENCES Categorias(ID),
	Marca_ID INT FOREIGN KEY REFERENCES Marcas(ID),
	Precio DECIMAL(18, 2),
	Descuento DECIMAL(5, 2),
	FechaBaja DATETIME NULL
);
go
CREATE TABLE Ventas (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	SumaTotal DECIMAL(18, 2),
	FechaVenta DATETIME
);
go
CREATE TABLE VentasProducto (
	Venta_ID INT FOREIGN KEY REFERENCES Ventas(ID),
	Producto_id INT FOREIGN KEY REFERENCES Productos(ID),
	Cantidad INT,
	PrecioUnitario DECIMAL(18,2)
);
GO
CREATE TABLE ItemCarrito(
	ID INT PRIMARY KEY IDENTITY (1,1),
	Usuario_ID int FOREIGN KEY REFERENCES Usuarios(ID),
   Producto_ID int FOREIGN KEY REFERENCES Productos(ID),
   FechaAgregado DATETIME,
   Cantidad int,
	Vendido BIT,
	Cancelado BIT
)
go
CREATE TABLE Imagenes (
	URI NVARCHAR(255),
	Producto_ID INT FOREIGN KEY REFERENCES Productos(ID),
	FechaBaja DATETIME NULL
);
go
CREATE TABLE Favoritos (
	Producto_id INT FOREIGN KEY REFERENCES Productos(ID),
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	PRIMARY KEY (Usuario_id, Producto_id)
);
go
CREATE TABLE Envios (
	Usuario_id INT FOREIGN KEY REFERENCES Usuarios(ID),
	Venta_ID INT FOREIGN KEY REFERENCES Ventas(ID),
	Estado_envio_ID INT FOREIGN KEY REFERENCES Estado_envio(ID),
	PRIMARY KEY (Usuario_id, Venta_ID)
);