use eCommerce
select a.id , a.Nombre , a.Descripcion , a.Categoria_ID , a.Marca_id , a.precio , a.descuento , a.Destacado,
m.Nombre as MarcaNombre , c.Nombre as CategoriaNombre
from Productos as a
inner join Categorias as c on c.ID = a.Categoria_ID
inner join Marcas as m on m.ID = a.Marca_ID
where a.FechaBaja is null

select URI, Producto_ID from Imagenes
where FechaBaja is null

update Imagenes
set URI = 'https://www.quamo.com.ar/3661-thickbox_default/silla-ergonomica-grou-1d-spp.jpg'
where URI like '%silla%' 

select c.Id , c.Precio 
from Carrito as c 
where id=1

use eCommerce
select * from Usuarios

INSERT INTO Usuarios (
    Nombre,
    Apellido,
    Email,
    Password,
    Telefono,
    Direccion,
    Permisos,
    Fecha_alta,
    Fecha_baja
)
VALUES (
    'Gabriel',
    'Salas',
    'gabriel.salas@example.com',
    'hashed_password_123',  -- Reemplazá con la password hasheada real
    '1161234567',
    'El Talar, Buenos Aires',
    1,                     -- Ejemplo: 1 = cliente
    GETDATE(),
    NULL
);

insert  into  ItemCarrito (Usuario_ID,Producto_ID,FechaAgregado,Cantidad,Vendido,Cancelado)
VALUES
(1,1,'2025-06-07',2,0,0)

select ID,Usuario_ID,Producto_ID,FechaAgregado,Cantidad,Vendido,Cancelado from ItemCarrito
