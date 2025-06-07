use eCommerce
select a.id , a.Nombre , a.Descripcion , a.Categoria_ID , a.Marca_id , a.precio , a.descuento ,
m.Nombre as MarcaNombre , c.Nombre as CategoriaNombre
from Productos as a
inner join Categorias as c on c.ID = a.Categoria_ID
inner join Marcas as m on m.ID = a.Marca_ID
where a.FechaBaja is null

select Uri_imagen, Producto_ID from Imagenes
where FechaBaja is null

update Imagenes
set Uri_imagen = 'https://www.quamo.com.ar/3661-thickbox_default/silla-ergonomica-grou-1d-spp.jpg'
where Uri_imagen like '%silla%' 

DROP DATABASE eCommerce