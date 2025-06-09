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
go
CREATE TABLE Carrito (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Usuario_ID INT,
	Precio DECIMAL(18, 2),
	CONSTRAINT FK_Carrito_Usuarios FOREIGN KEY (Usuario_ID) REFERENCES Usuarios(ID)
);
GO
CREATE TABLE ItemCarrito (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Carrito_ID INT,
	Producto_ID INT,
	FechaAgregado DATETIME,
	Cantidad INT,
	PrecioTotal DECIMAL(18,2),
	Vendido BIT,
	Cancelado BIT,
	CONSTRAINT FK_ItemCarrito_Carrito FOREIGN KEY (Carrito_ID) REFERENCES Carrito(ID),
	CONSTRAINT FK_ItemCarrito_Productos FOREIGN KEY (Producto_ID) REFERENCES Productos(ID)
);
go
CREATE TABLE Imagenes (
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
	Usuario_ID INT,
	Venta_ID INT,
	Estado_envio_ID INT,
	PRIMARY KEY (Usuario_ID, Venta_ID),
	CONSTRAINT FK_Envios_Usuarios FOREIGN KEY (Usuario_ID) REFERENCES Usuarios(ID),
	CONSTRAINT FK_Envios_Ventas FOREIGN KEY (Venta_ID) REFERENCES Ventas(ID),
	CONSTRAINT FK_Envios_EstadoEnvio FOREIGN KEY (Estado_envio_ID) REFERENCES Estado_envio(ID)
);
GO