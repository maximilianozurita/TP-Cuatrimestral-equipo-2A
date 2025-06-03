USE eCommerce;
GO
-- Permisos
INSERT INTO Permisos (Codigo, BitWise, Estado) VALUES
('Ninguno', 0, 1),
('Prueba', 1, 1),
('Cliente', 2, 1),
('AdministrarUsuarios', 4, 1),
('AdministrarProductos', 8, 1),
('AdministrarVentas', 16, 1)

-- Categorias
INSERT INTO Categorias (Nombre, Estado) VALUES
('Electrónica', 1),
('Ropa', 1),
('Hogar', 1),
('Juguetes', 1);

-- Marcas
INSERT INTO Marcas (Nombre, Estado) VALUES
('Sony', 1),
('Nike', 1),
('Samsung', 1),
('LG', 1);

-- Estado_envio
INSERT INTO Estado_envio (Descripcion, Estado) VALUES
('Pendiente', 1),
('Enviado', 1),
('Entregado', 1),
('Cancelado', 1);

-- Usuarios
INSERT INTO Usuarios (Permisos, Fecha_alta, Fecha_baja, Nombre, Apellido, Email, Telefono, Password, Direccion) VALUES
(1, GETDATE(), NULL, 'Juan', 'Pérez', 'juan.perez@mail.com', '1234567890', 'hashpassword1', 'Calle Falsa 123'),
(2, GETDATE(), NULL, 'Ana', 'Gómez', 'ana.gomez@mail.com', '0987654321', 'hashpassword2', 'Avenida Siempre Viva 742'),
(3, GETDATE(), NULL, 'Carlos', 'Lopez', 'carlos.lopez@mail.com', '111222333', 'hashpassword3', 'Boulevard Central 55');

-- Productos
INSERT INTO Productos (Nombre, Descripcion, Categoria_ID, Marca_ID, Precio, Descuento, Estado) VALUES
('Smart TV 50"', 'Televisor 50 pulgadas 4K Ultra HD', 1, 3, 1200.00, 100.00, 1),
('Zapatillas Running', 'Zapatillas deportivas para correr', 2, 2, 150.00, 20.00, 1),
('Refrigerador', 'Refrigerador con congelador separado', 3, 4, 850.00, 50.00, 1),
('Robot de Cocina', 'Robot multifunción para cocina', 3, 1, 300.00, 25.00, 1);

-- Ventas
INSERT INTO Ventas (Usuario_id, Suma_total, Fecha_venta) VALUES
(1, 1100.00, GETDATE()),
(2, 170.00, GETDATE());

-- Carrito
INSERT INTO Carrito (Usuario_id, Producto_id, Cantidad, Precio, Venta_id) VALUES
(1, 1, 1, 1100.00, 1),
(2, 2, 1, 150.00, 2);

-- Imagenes
INSERT INTO Imagenes (Uri_imagen, Producto_ID, Estado) VALUES
('https://mi-tienda.com/images/smarttv50.jpg', 1, 1),
('https://mi-tienda.com/images/zapatillas_running.jpg', 2, 1),
('https://mi-tienda.com/images/refrigerador.jpg', 3, 1),
('https://mi-tienda.com/images/robot_cocina.jpg', 4, 1);

-- Favoritos
INSERT INTO Favoritos (Usuario_id, Producto_id) VALUES
(1, 2),
(2, 1);

-- Envios
INSERT INTO Envios (Usuario_id, Venta_ID, Estado_envio_ID) VALUES
(1, 1, 2),
(2, 2, 1);
