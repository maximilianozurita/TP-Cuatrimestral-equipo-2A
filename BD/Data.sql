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
(1, 435000.00, GETDATE()),
(2, 900000.00, GETDATE());
GO

-- Insertar VentasProducto
INSERT INTO VentasProducto (Venta_ID, Producto_id, Cantidad, PrecioUnitario)
VALUES
(1, 1, 1, 350000.00),
(1, 2, 1, 85000.00),
(2, 3, 1, 900000.00);
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
('Upluad/Products/ImagenPrueba1.png', 1),
('Upluad/Products/ImagenPrueba2.jpeg', 2),
('Upluad/Products/ImagenPrueba3.jpg', 3),
('Upluad/Products/ImagenPrueba3.jpg', 4);
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
