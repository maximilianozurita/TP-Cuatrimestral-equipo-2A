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
('Intel'),
('Jaguar'),
('Atma'),
('Gadnit'),
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
('adminUsuario', 'admin', 'adminUsuario@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1234567890', 'Calle Falsa 1523', 4, GETDATE()),
('adminProductos', 'admin', 'adminProductos@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0987654321', 'Av. Siempre Viva 742', 8, GETDATE()),
('adminVentas', 'admin', 'adminVentas@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0987654321', 'Av. Siempre Viva 5642', 16, GETDATE()),
('admin', 'admin', 'admin@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0987654321', 'Av. Siempre Viva 7492', 28, GETDATE()),
('cliente1', 'cliente1', 'cliente1@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0987654321', 'Av. Siempre Viva 74872', 2, GETDATE()),
('cliente2', 'cliente2', 'cliente2@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '11556677', 'Av Siempre Viva 742', 2, GETDATE()),
('cliente3', 'cliente3', 'cliente3@example.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1155655', 'Av Siempre Viva 247', 2, GETDATE());
GO

-- Insertar Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Marca_ID, Categoria_ID, Destacado, Descuento)
VALUES
-- Procesador Intel
('Intel Core i7 12700K', 'Procesador Intel de 12va generación con 12 núcleos y 20 hilos. Ideal para gaming, diseño 3D y edición de video de alto rendimiento.', 220000,
(SELECT ID FROM Marcas WHERE Nombre = 'Intel'), (SELECT ID FROM Categorias WHERE Nombre = 'Electrónica'), 1, 10),

-- Zapatillas Jaguar
('Zapatillas Jaguar Urban Run', 'Zapatillas urbanas deportivas con diseño moderno, suela flexible y tela transpirable. Perfectas para uso diario o entrenamiento.', 35000,
(SELECT ID FROM Marcas WHERE Nombre = 'Jaguar'), (SELECT ID FROM Categorias WHERE Nombre = 'Ropa'), 1, 15),

-- Aspiradora Atma
('Aspiradora Atma MaxClean 2000W', 'Aspiradora ciclónica sin bolsa con sistema de filtros HEPA, potencia regulable y diseño compacto.', 58000,
(SELECT ID FROM Marcas WHERE Nombre = 'Atma'), (SELECT ID FROM Categorias WHERE Nombre = 'Hogar'), 0, 0),

-- Silla Gadnit
('Silla Gamer Gadnit Pro X500', 'Silla ergonómica con respaldo reclinable, soporte lumbar, y estructura robusta para sesiones largas frente al escritorio.', 120000,
(SELECT ID FROM Marcas WHERE Nombre = 'Gadnit'), (SELECT ID FROM Categorias WHERE Nombre = 'Hogar'), 1, 20),

-- Consola PlayStation 5 Sony
('Sony PlayStation 5 1TB', 'Consola de nueva generación con SSD ultra rápido, gráficos 4K, y control DualSense con respuesta háptica avanzada.', 750000,
(SELECT ID FROM Marcas WHERE Nombre = 'Sony'), (SELECT ID FROM Categorias WHERE Nombre = 'Electrónica'), 1, 5),

--TV
('Smart TV Samsung 55" UHD 4K', 'Televisor inteligente de 55 pulgadas con resolución UHD 4K, tecnología Crystal Display, HDR10+, control por voz y acceso a apps como Netflix, YouTube y Disney+.', 1000000,
(SELECT ID FROM Marcas WHERE Nombre = 'Samsung'), (SELECT ID FROM Categorias WHERE Nombre = 'Electrónica'), 1, 5);

-- Insertar Ventas
INSERT INTO Ventas (Usuario_id, SumaTotal, FechaVenta)
VALUES
(6, 435000.00, DATEADD(DAY, -10, GETDATE())),
(6, 900000.00, DATEADD(DAY, -9, GETDATE())),
(6, 800000.00, DATEADD(DAY, -8, GETDATE())),
(6, 700000.00, DATEADD(DAY, -7, GETDATE())),
(6, 600000.00, DATEADD(DAY, -6, GETDATE())),
(5, 100000.00, DATEADD(DAY, -30, GETDATE())),
(5, 180000.00, DATEADD(DAY, -25, GETDATE())),
(5, 95000.00, DATEADD(DAY, -21, GETDATE())),
(7, 230000.00, DATEADD(DAY, -18, GETDATE())),
(7, 120000.00, DATEADD(DAY, -15, GETDATE())),
(7, 175000.00, DATEADD(DAY, -10, GETDATE())),
(7, 205000.00, DATEADD(DAY, -7, GETDATE())),
(5, 99000.00, DATEADD(DAY, -4, GETDATE())),
(5, 140000.00, DATEADD(DAY, -2, GETDATE())),
(5, 185000.00, GETDATE());
GO

-- Insertar VentasProducto
INSERT INTO VentasProducto (Venta_ID, Producto_id, Cantidad, PrecioUnitario)
VALUES
(1, 1, 1, 350000.00), (1, 2, 2, 42500.00),
(2, 3, 1, 900000.00),
(3, 2, 2, 200000.00), (3, 1, 1, 400000.00),
(4, 1, 1, 350000.00), (4, 4, 2, 175000.00),
(5, 2, 3, 200000.00),
(6, 2, 1, 85000.00), (6, 4, 1, 15000.00),
(7, 3, 1, 180000.00),
(8, 2, 2, 47500.00),
(9, 1, 1, 120000.00), (9, 4, 1, 110000.00),
(10, 2, 1, 120000.00),
(11, 3, 1, 95000.00), (11, 4, 1, 80000.00),
(12, 1, 1, 175000.00),
(13, 4, 1, 99000.00),
(14, 3, 1, 140000.00),
(15, 2, 1, 185000.00);
GO

-- Insertar ItemCarrito
INSERT INTO ItemCarrito (Usuario_ID, Producto_ID, FechaAgregado, Cantidad, Vendido, Cancelado)
VALUES 
(7, 1, DATEADD(DAY, -10, GETDATE()), 1, 1, 0),
(7, 2, DATEADD(DAY, -9, GETDATE()), 2, 0, 0),
(7, 3, DATEADD(DAY, -8, GETDATE()), 1, 1, 0),
(6, 4, DATEADD(DAY, -7, GETDATE()), 1, 0, 1),
(6, 2, DATEADD(DAY, -6, GETDATE()), 1, 1, 0),
(6, 2, DATEADD(DAY, -5, GETDATE()), 2, 1, 0),
(5, 4, DATEADD(DAY, -4, GETDATE()), 1, 0, 0),
(5, 1, DATEADD(DAY, -3, GETDATE()), 3, 1, 0),
(5, 3, DATEADD(DAY, -2, GETDATE()), 1, 0, 1);

-- Insertar Imágenes
INSERT INTO Imagenes (URI, Producto_ID)
VALUES
('Procesador1.webp', 1),
('Procesador2.webp', 1),
('Procesador3.jpg', 1),
('Zapatilla1.webp', 2),
('Zapatilla2.webp', 2),
('Zapatilla3.webp', 2),
('Zapatilla4.webp', 2),
('Aspiradora1.webp', 3),
('Aspiradora2.webp', 3),
('Aspiradora3.webp', 3),
('Silla1.webp', 4),
('Silla2.webp', 4),
('Silla3.webp', 4),
('Silla4.webp', 4),
('Silla5.webp', 4),
('Silla6.webp', 4),
('ps51.jpeg', 5),
('ps52.webp', 5),
('ps53.webp', 5),
('ps54.webp', 5),
('ps55.webp', 5),
('TV1.webp', 6),
('TV2.webp', 6),
('TV3.webp', 6),
('TV4.webp', 6);
GO

-- Insertar Favoritos
INSERT INTO Favoritos (Producto_id, Usuario_id)
VALUES
(1, 5),
(3, 6),
(2, 7);
GO

-- Insertar Envíos
INSERT INTO Envios (Venta_ID, Estado_envio_ID)
VALUES 
(1, 2),
(2, 3),
(3, 1),
(4, 3),
(5, 4),
(6, 2),
(7, 1),
(8, 3),
(9, 2),
(10, 1),
(11, 3),
(12, 2),
(13, 1),
(14, 4),
(15, 3);
GO
INSERT INTO MediosDePago (Id, CBU, Alias, Token)
VALUES (1, 'cbu', 'alias', 'token');
GO
