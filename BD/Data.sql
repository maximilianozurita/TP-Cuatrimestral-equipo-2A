USE eCommerce;
GO

-- Insertar Categorías
INSERT INTO Categorias (Nombre) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Libros');
GO

-- Insertar Marcas
INSERT INTO Marcas (Nombre) VALUES
('Sony'),
('Apple'),
('Nike'),
('Samsung');
GO

-- Insertar Estados de envío
INSERT INTO Estado_envio (Descripcion) VALUES
('Pendiente'),
('En camino'),
('Entregado'),
('Cancelado');
GO

-- Insertar Usuarios
INSERT INTO Usuarios (Nombre, Apellido, Email, Password, Telefono, Direccion, Permisos, Fecha_alta)
VALUES
('Juan', 'Pérez', 'juan@example.com', '123456', '1234567890', 'Calle Falsa 123', 1, GETDATE()),
('Ana', 'García', 'ana@example.com', 'abcdef', '0987654321', 'Av. Siempre Viva 742', 0, GETDATE());
GO

-- Insertar Productos
INSERT INTO Productos (Nombre, Descripcion, Categoria_ID, Marca_ID, Precio, Descuento)
VALUES
('Televisor 50"', 'TV LED 50 pulgadas 4K', 1, 1, 350000.00, 10.00),
('Zapatillas Running', 'Zapatillas deportivas', 2, 3, 85000.00, 5.00),
('iPhone 14', 'Último modelo de Apple', 1, 2, 900000.00, 15.00),
('Silla Gamer', 'Silla ergonómica para juegos', 3, 4, 120000.00, 20.00);
GO

-- Insertar Ventas
INSERT INTO Ventas (Usuario_id, Suma_total, Fecha_venta)
VALUES
(1, 435000.00, GETDATE()),
(2, 900000.00, GETDATE());
GO

-- Insertar Carrito (con productos vendidos y no vendidos)
INSERT INTO Carrito (Usuario_id, Producto_id, Cantidad, Precio, Venta_id)
VALUES
(1, 1, 1, 350000.00, 1),
(1, 2, 1, 85000.00, 1),
(2, 3, 1, 900000.00, 2),
(1, 4, 1, 120000.00, NULL);
GO

-- Insertar Imágenes
INSERT INTO Imagenes (URI, Producto_ID)
VALUES
('https://example.com/tv.jpg', 1),
('https://example.com/zapatillas.jpg', 2),
('https://example.com/iphone.jpg', 3),
('https://example.com/silla.jpg', 4);
GO

-- Insertar Favoritos
INSERT INTO Favoritos (Producto_id, Usuario_id)
VALUES
(1, 1),
(3, 1),
(2, 2);
GO

-- Insertar Envíos
INSERT INTO Envios (Usuario_id, Venta_ID, Estado_envio_ID)
VALUES
(1, 1, 2),
(2, 2, 1);
GO
