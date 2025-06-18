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
('adminUsuario', 'admin', 'adminUsuario@example.com', '1234', '1234567890', 'Calle Falsa 1523', 4, GETDATE()),
('adminProductos', 'admin', 'adminProductos@example.com', '1234', '0987654321', 'Av. Siempre Viva 742', 8, GETDATE()),
('adminVentas', 'admin', 'adminVentas@example.com', '1234', '0987654321', 'Av. Siempre Viva 5642', 16, GETDATE()),
('admin', 'admin', 'admin@example.com', '1234', '0987654321', 'Av. Siempre Viva 7492', 28, GETDATE()),
('cliente', 'cliente', 'cliente@example.com', '1234', '0987654321', 'Av. Siempre Viva 74872', 2, GETDATE());
GO

-- Insertar Productos
INSERT INTO Productos (Nombre, Descripcion, Categoria_ID, Marca_ID, Precio, Descuento, Destacado)
VALUES
('Televisor 50"', 'TV LED 50 pulgadas 4K', 1, 1, 350000.00, 10.00, 1),
('Zapatillas Running', 'Zapatillas deportivas', 2, 3, 85000.00, 5.00, 0),
('iPhone 14', 'Último modelo de Apple', 1, 2, 900000.00, 15.00, 1),
('Silla Gamer', 'Silla ergonómica para juegos', 3, 4, 120000.00, 20.00, 1);
GO

-- Insertar Ventas
INSERT INTO Ventas (Usuario_id, SumaTotal, FechaVenta)
VALUES
(1, 435000.00, DATEADD(DAY, -10, GETDATE())),
(2, 900000.00, DATEADD(DAY, -9, GETDATE())),
(3, 800000.00, DATEADD(DAY, -8, GETDATE())),
(3, 700000.00, DATEADD(DAY, -7, GETDATE())),
(3, 600000.00, DATEADD(DAY, -6, GETDATE())),
(1, 150000.00, DATEADD(DAY, -5, GETDATE())),
(2, 300000.00, DATEADD(DAY, -4, GETDATE())),
(1, 500000.00, DATEADD(DAY, -3, GETDATE())),
(2, 250000.00, DATEADD(DAY, -2, GETDATE())),
(3, 900000.00, DATEADD(DAY, -1, GETDATE()));
GO

-- Insertar VentasProducto
INSERT INTO VentasProducto (Venta_ID, Producto_id, Cantidad, PrecioUnitario)
VALUES
(1, 1, 1, 350000.00),
(1, 2, 2, 42500.00),

(2, 3, 1, 900000.00),

(3, 2, 2, 200000.00),
(3, 5, 1, 400000.00),

(4, 1, 1, 350000.00),
(4, 4, 2, 175000.00),

(5, 2, 3, 200000.00),

(6, 1, 1, 150000.00),

(7, 3, 2, 150000.00),

(8, 5, 1, 500000.00),

(9, 1, 1, 250000.00),

(10, 4, 1, 500000.00),
(10, 5, 2, 200000.00);
GO

-- Insertar Carrito
INSERT INTO Carrito (Usuario_id, Precio)
VALUES
(1, 435000.00),
(2, 900000.00);
GO

-- Insertar ItemCarrito
INSERT INTO ItemCarrito (Carrito_ID, Producto_ID, FechaAgregado, Cantidad, PrecioTotal, Vendido, Cancelado)
VALUES
(1, 1, GETDATE(), 1, 350000.00, 1, 0),
(1, 2, GETDATE(), 1, 85000.00, 1, 0),
(2, 3, GETDATE(), 1, 900000.00, 1, 0),
(1, 4, GETDATE(), 1, 120000.00, 0, 0);  -- producto en carrito pero no vendido
GO

-- Insertar Imágenes
INSERT INTO Imagenes (URI, Producto_ID)
VALUES
('ImagenPrueba1.png', 1),
('ImagenPrueba2.jpeg', 2),
('ImagenPrueba3.jpg', 3),
('ImagenPrueba3.jpg', 4);
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
