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

insert  into  ItemCarrito (Usuario_ID,Producto_ID,FechaAgregado,Cantidad,Vendido,Cancelado)
VALUES
(1,1,'2025-06-07',2,0,0)

select ID,Usuario_ID,Producto_ID,FechaAgregado,Cantidad,Vendido,Cancelado from ItemCarrito
select * from Usuarios
select * from ItemCarrito where Cancelado = 0

select i.ID,i.Usuario_ID,Producto_ID,FechaAgregado,Cantidad,
                    Vendido,Cancelado,p.Precio as PrecioUnitario 
                    from ItemCarrito as i 
                    inner join Productos as p on p.ID = i.Producto_ID
                    where Usuario_ID = 2 and Cancelado = 0
select * from imagenes
select * from MediosDePago
update MediosDePago set CBU='UKq+orEO7FqKoR4PTBH8okdDnDnbjtRvaCwCmG+CzO1TMfCIcnMItDpWf+ySAjaI6TXi0Pl74GMj1N9h8jR/htvDBrePvQQ4+foXDKKXtJM=',Alias='UKq+orEO7FqKoR4PTBH8okdDnDnbjtRvaCwCmG+CzO1TMfCIcnMItDpWf+ySAjaI6TXi0Pl74GMj1N9h8jR/htvDBrePvQQ4+foXDKKXtJM=',Token='UKq+orEO7FqKoR4PTBH8okdDnDnbjtRvaCwCmG+CzO1TMfCIcnMItDpWf+ySAjaI6TXi0Pl74GMj1N9h8jR/htvDBrePvQQ4+foXDKKXtJM=' where id = 1; 

