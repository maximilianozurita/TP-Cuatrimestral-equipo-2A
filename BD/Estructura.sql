CREATE DATABASE eCommerce;
go
USE eCommerce;
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
	Email NVARCHAR(100) UNIQUE NOT NULL,
	Password NVARCHAR(255) NOT NULL,
	ResetToken VARCHAR(100) NULL,
	ResetTokenFecha DATETIME NULL,
	Telefono NVARCHAR(20),
	Direccion NVARCHAR(255),
	Permisos INT NOT NULL,
	Fecha_alta DATETIME NOT NULL DEFAULT GETDATE(),
	Fecha_baja DATETIME NULL
);
go
CREATE TABLE Productos (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(100),
	Descripcion NVARCHAR(MAX),
	Categoria_ID INT,
	Marca_ID INT,
	Precio DECIMAL(18, 2),
	Descuento DECIMAL(5, 2),
	Destacado BIT,
	FechaBaja DATETIME NULL,
	CONSTRAINT FK_Productos_Categorias FOREIGN KEY (Categoria_ID) REFERENCES Categorias(ID),
	CONSTRAINT FK_Productos_Marcas FOREIGN KEY (Marca_ID) REFERENCES Marcas(ID)

);
go
CREATE TABLE Ventas (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Usuario_ID INT,
	SumaTotal DECIMAL(18, 2),
	FechaVenta DATETIME,
	Confirmado Bit Default 0,
	CONSTRAINT FK_Ventas_Usuarios FOREIGN KEY (Usuario_ID) REFERENCES Usuarios(ID)
);
go
CREATE TABLE VentasProducto (
	Venta_ID INT,
	Producto_ID INT,
	Cantidad INT,
	PrecioUnitario DECIMAL(18,2),
	CONSTRAINT FK_VentasProducto_Ventas FOREIGN KEY (Venta_ID) REFERENCES Ventas(ID),
	CONSTRAINT FK_VentasProducto_Productos FOREIGN KEY (Producto_ID) REFERENCES Productos(ID),
	PRIMARY KEY (Venta_ID, Producto_ID)
);
GO
CREATE TABLE ItemCarrito(
	ID INT PRIMARY KEY IDENTITY (1,1),
	Usuario_ID int FOREIGN KEY REFERENCES Usuarios(ID),
	Producto_ID int FOREIGN KEY REFERENCES Productos(ID),
	FechaAgregado DATETIME,
   	Cantidad int,
	Vendido BIT,
	Cancelado BIT,
	CONSTRAINT FK_ItemCarrito_Productos FOREIGN KEY (Producto_ID) REFERENCES Productos(ID),
	CONSTRAINT FK_ItemCarrito_Usuarios FOREIGN KEY (Usuario_ID) REFERENCES Usuarios(ID)
);
go
CREATE TABLE Imagenes (
	ID INT PRIMARY KEY IDENTITY (1,1),
	URI NVARCHAR(255),
	Producto_ID INT,
	FechaBaja DATETIME NULL,
	CONSTRAINT FK_Imagenes_Productos FOREIGN KEY (Producto_ID) REFERENCES Productos(ID)
);
go
CREATE TABLE Favoritos (
	Producto_ID INT,
	Usuario_ID INT,
	PRIMARY KEY (Usuario_ID, Producto_ID),
	CONSTRAINT FK_Favoritos_Productos FOREIGN KEY (Producto_ID) REFERENCES Productos(ID),
	CONSTRAINT FK_Favoritos_Usuarios FOREIGN KEY (Usuario_ID) REFERENCES Usuarios(ID)
);
go
CREATE TABLE Envios (
	ID INT PRIMARY KEY IDENTITY (1,1),
	Venta_ID INT,
	Estado_envio_ID INT,
	CONSTRAINT FK_Envios_Ventas FOREIGN KEY (Venta_ID) REFERENCES Ventas(ID),
	CONSTRAINT FK_Envios_EstadoEnvio FOREIGN KEY (Estado_envio_ID) REFERENCES Estado_envio(ID)
);
GO
CREATE TABLE MediosDePago(
	Id INT PRIMARY KEY CHECK (Id = 1),
   CBU VARCHAR(256),
   Alias VARCHAR(256),
   Token VARCHAR(256)
);
GO
drop table MediosDePago
