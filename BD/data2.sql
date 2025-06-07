USE eCommerce;
GO

-- Insertar Categorias
INSERT INTO Categorias (Nombre) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Libros'),
('Deportes'),
('Juguetes'),
('Alimentos y Bebidas'),
('Salud y Belleza'),
('Automotriz'),
('Mascotas');
GO

-- Insertar Marcas
INSERT INTO Marcas (Nombre) VALUES
('Sony'),
('Apple'),
('Nike'),
('Samsung'),
('Adidas'),
('Xiaomi'),
('LG'),
('HP'),
('Dell'),
('Bosch'),
('Philips'),
('Coca-Cola'),
('Purina'),
('Pampers'),
('Hot Wheels'),
('Lego'),
('Puma'),
('Whirlpool');
GO

-- Insertar Productos (aproximadamente 65 productos)
INSERT INTO Productos (Nombre, Descripcion, Categoria_ID, Marca_ID, Precio, Descuento) VALUES
-- Electrónica (Categoría ID: 1)
('Smart TV 55" 4K HDR', 'Disfruta de imágenes vibrantes y sonido inmersivo con este televisor inteligente de última generación.', 1, 4, 780000.00, 10.00), -- Samsung
('Smartphone Galaxy S24 Ultra', 'Potencia y elegancia en tus manos con la cámara más avanzada de Samsung y un rendimiento inigualable.', 1, 4, 1560000.00, 5.00), -- Samsung
('Auriculares Inalámbricos WH-1000XM5', 'Cancelación de ruido líder en la industria para una experiencia auditiva pura y sin interrupciones.', 1, 1, 455000.00, 12.00), -- Sony
('Laptop HP Pavilion 15', 'Ideal para trabajo y entretenimiento, con procesador rápido y gráficos nítidos para todas tus tareas diarias.', 1, 8, 975000.00, 8.00), -- HP
('Smartwatch Apple Watch Series 9', 'Controla tu salud, tus notificaciones y tu actividad física con el smartwatch más inteligente y elegante.', 1, 2, 650000.00, 7.00), -- Apple
('Tablet Xiaomi Pad 6', 'Pantalla fluida y rendimiento ágil para productividad y diversión, ideal para estudiantes y profesionales.', 1, 6, 400000.00, 15.00), -- Xiaomi
('Cámara Mirrorless Sony Alpha A7 III', 'Captura momentos con calidad profesional, ideal para fotografía y video de alta resolución.', 1, 1, 1950000.00, 0.00), -- Sony
('Barra de Sonido LG Soundbar SP9YA', 'Sonido envolvente para tu hogar, transformando tu sala en una experiencia de cine inmersiva.', 1, 7, 325000.00, 10.00), -- LG
('Impresora Multifunción HP DeskJet 4120e', 'Imprime, escanea y copia con facilidad, con conectividad inalámbrica para tu comodidad.', 1, 8, 104000.00, 5.00), -- HP
('Monitor Gamer Dell Alienware AW2521HFL', 'Velocidad y respuesta para gamers exigentes, con alta tasa de refresco para una ventaja competitiva.', 1, 9, 715000.00, 18.00), -- Dell
('Consola de Videojuegos PlayStation 5', 'Experimenta la nueva generación de juegos con gráficos ultrarrealistas y tiempos de carga instantáneos.', 1, 1, 1040000.00, 5.00), -- Sony (usando Sony como fabricante de consolas)
('Router Wi-Fi Xiaomi AX3000', 'Conexión a internet rápida y estable para todos tus dispositivos, ideal para hogares inteligentes.', 1, 6, 91000.00, 10.00), -- Xiaomi
-- Ropa (Categoría ID: 2)
('Zapatillas Nike Air Force 1', 'Un clásico atemporal para tu estilo, combina con cualquier atuendo y brinda comodidad duradera.', 2, 3, 104000.00, 0.00), -- Nike
('Camiseta Adidas Essentials Logo', 'Comodidad y estilo para el día a día, perfecta para entrenar o para un look casual.', 2, 5, 39000.00, 10.00), -- Adidas
('Jean Slim Fit Elastizado Hombre', 'El ajuste perfecto para cualquier ocasión, con tejido elástico para mayor confort.', 2, NULL, 65000.00, 8.00),
('Vestido Midi Estampado Mujer', 'Elegancia y frescura para el verano, con un diseño que resalta tu figura.', 2, NULL, 58500.00, 15.00),
('Chaqueta Impermeable Puma Essential', 'Protección contra el viento y la lluvia, ideal para actividades al aire libre.', 2, 17, 91000.00, 12.00), -- Puma
('Pantalón Deportivo Nike Tech Fleece', 'Calidez y confort para tus entrenamientos, diseñado para ofrecer ligereza y transpirabilidad.', 2, 3, 84500.00, 5.00), -- Nike
('Sudadera con Capucha Adidas Trefoil', 'Icono de estilo urbano y comodidad, ideal para tus looks deportivos y casuales.', 2, 5, 71500.00, 10.00), -- Adidas
('Conjunto Pijama Algodón Mujer', 'Dulces sueños con la máxima suavidad y un diseño encantador para tus noches de descanso.', 2, NULL, 45500.00, 20.00),
('Remera Manga Corta Hombre Estampada', 'Frescura y diseño para tu look casual, con estampados modernos y tejido suave.', 2, NULL, 26000.00, 0.00),
('Short Deportivo Puma Knit', 'Libertad de movimiento para tus actividades, ideal para correr o ir al gimnasio.', 2, 17, 32500.00, 15.00), -- Puma
('Botas de Cuero Hombre Urbanas', 'Durabilidad y estilo para tu día a día, ideales para climas fríos y para un look robusto.', 2, NULL, 120000.00, 0.00),
('Bufanda de Lana Unisex', 'Abrigo y estilo para el invierno, suave al tacto y muy versátil.', 2, NULL, 18000.00, 5.00),
-- Hogar (Categoría ID: 3)
('Heladera No Frost Whirlpool WRE57K1', 'Gran capacidad y tecnología inteligente para mantener tus alimentos frescos por más tiempo.', 3, 18, 1300000.00, 10.00), -- Whirlpool
('Lavadora Carga Frontal Samsung WW90T504DAW', 'Limpieza profunda y ahorro de energía, con programas para todo tipo de ropa.', 3, 4, 910000.00, 8.00), -- Samsung
('Aspiradora Robot Xiaomi Robot Vacuum Mop 2 Pro', 'Limpieza automática y eficiente, mapea tu hogar para una limpieza impecable.', 3, 6, 260000.00, 15.00), -- Xiaomi
('Cafetera Philips L''Or Barista LM8012/60', 'Disfruta de tu café favorito en casa con la comodidad de las cápsulas y un diseño elegante.', 3, 11, 117000.00, 12.00), -- Philips
('Juego de Sábanas King Size Algodón', 'Máximo confort para tu descanso, suaves y frescas para un sueño reparador.', 3, NULL, 52000.00, 0.00),
('Microondas Samsung MS23K3513AW', 'Calienta tus comidas de forma rápida y uniforme, con funciones preestablecidas para mayor comodidad.', 3, 4, 156000.00, 5.00), -- Samsung
('Tostadora Philips HD2581/90', 'Tostadas perfectas cada mañana, con ranuras anchas para diferentes tipos de pan.', 3, 11, 39000.00, 10.00), -- Philips
('Batidora de Mano Bosch ErgoMixx MS6CM4110', 'Potencia y versatilidad en tu cocina, ideal para preparar todo tipo de mezclas.', 3, 10, 78000.00, 18.00), -- Bosch
('Set de Sartenes Antiadherentes Tramontina', 'Cocina sin que se pegue nada, con revestimiento duradero y fácil de limpiar.', 3, NULL, 91000.00, 20.00),
('Olla a Presión Eléctrica Instant Pot Duo', 'Cocina más rápido y saludable, ideal para sopas, guisos y mucho más.', 3, NULL, 182000.00, 10.00),
('Purificador de Aire Philips Serie 2000i', 'Aire más limpio en tu hogar, captura alérgenos, polen y partículas finas.', 3, 11, 280000.00, 7.00), -- Philips
('Licuadora Oster BLSTPYG1210RBG', 'Potente motor para licuados perfectos, batidos y sopas cremosas.', 3, NULL, 65000.00, 5.00),
-- Libros (Categoría ID: 4)
('Cien Años de Soledad', 'La obra maestra de Gabriel García Márquez que te sumerge en el realismo mágico.', 4, NULL, 26000.00, 5.00),
('El Señor de los Anillos', 'La épica saga de fantasía de Tolkien que ha cautivado a millones de lectores en todo el mundo.', 4, NULL, 39000.00, 0.00),
('Harry Potter y la Piedra Filosofal', 'El inicio de la aventura mágica que marcó a una generación, perfecto para jóvenes y adultos.', 4, NULL, 20800.00, 10.00),
('1984', 'La distopía clásica de George Orwell que te hará reflexionar sobre la sociedad y el control.', 4, NULL, 19500.00, 15.00),
('Sapiens: De animales a dioses', 'Una breve historia de la humanidad que explora el impacto de nuestra especie en el planeta.', 4, NULL, 35000.00, 8.00),
('El Principito', 'Un clásico atemporal que nos enseña sobre la amistad, el amor y el sentido de la vida.', 4, NULL, 15000.00, 0.00),
('Crónica de una Muerte Anunciada', 'La novela corta de Gabriel García Márquez que narra un destino inevitable.', 4, NULL, 22000.00, 7.00),
-- Deportes (Categoría ID: 5)
('Pelota de Fútbol Adidas Tango Rosario', 'Para tus partidos y entrenamientos, con un diseño clásico y durabilidad garantizada.', 5, 5, 32500.00, 0.00), -- Adidas
('Colchoneta de Yoga Manduka PRO', 'Comodidad y estabilidad para tus asanas, ideal para cualquier nivel de práctica.', 5, NULL, 78000.00, 10.00),
('Mancuernas Ajustables Set (20kg)', 'Ideal para entrenar en casa, con peso regulable para diferentes ejercicios.', 5, NULL, 130000.00, 12.00),
('Bicicleta de Montaña Rodado 29', 'Explora nuevos caminos y senderos con esta bicicleta robusta y de alto rendimiento.', 5, NULL, 455000.00, 5.00),
('Raqueta de Tenis Wilson Ultra 100 v3', 'Potencia y control para tu juego, ideal para jugadores intermedios y avanzados.', 5, NULL, 195000.00, 18.00),
('Zapatillas Running Adidas Ultraboost 23', 'Máxima amortiguación y retorno de energía para tus carreras diarias.', 5, 5, 120000.00, 8.00), -- Adidas
('Set de Pesas Rusas (Kettlebells)', 'Entrenamiento funcional completo para todo el cuerpo, ideal para fuerza y resistencia.', 5, NULL, 80000.00, 10.00),
-- Juguetes (Categoría ID: 6)
('Set de Construcción Lego City Comisaría', 'Horas de diversión construyendo y jugando, fomentando la creatividad y la imaginación.', 6, 16, 156000.00, 10.00), -- Lego
('Muñeca Barbie Dreamtopia Princesa', 'Aventuras mágicas en el reino de Barbie, con un vestido brillante y accesorios encantadores.', 6, NULL, 39000.00, 5.00),
('Pista de Carreras Hot Wheels Ultimate Garage', 'La máxima diversión con tus autos favoritos, con rampas y zonas de juego interactivas.', 6, 15, 260000.00, 15.00), -- Hot Wheels
('Peluche Grande Oso de Peluche', 'Suave y abrazable, el compañero ideal para niños y adultos, perfecto para decorar.', 6, NULL, 71500.00, 0.00),
('Juego de Mesa Catan', 'Estrategia y colonización para toda la familia, construye y comercia para dominar la isla.', 6, NULL, 58500.00, 8.00),
('Rompecabezas 1000 Piezas Paisaje', 'Desafío y relajación para toda la familia, con una imagen vibrante para enmarcar.', 6, NULL, 25000.00, 0.00),
-- Alimentos y Bebidas (Categoría ID: 7)
('Gaseosa Coca-Cola Original (1.5L)', 'Refresco icónico para acompañar tus comidas y refrescar tus momentos especiales.', 7, 12, 2600.00, 0.00), -- Coca-Cola
('Café Molido La Virginia Clásico (500g)', 'El aroma y sabor de un buen café, perfecto para empezar el día o disfrutar de una pausa.', 7, NULL, 6500.00, 5.00),
('Aceite de Oliva Extra Virgen (750ml)', 'Sabor intenso para tus platos, ideal para ensaladas, aderezos y cocina saludable.', 7, NULL, 13000.00, 0.00),
('Dulce de Leche Vacalin Tradicional (1kg)', 'El clásico sabor argentino, cremoso y delicioso, ideal para postres y desayunos.', 7, NULL, 9100.00, 10.00),
('Vino Malbec Catena Zapata Nicasia', 'Un tinto premium para ocasiones especiales, con notas frutales y un final elegante.', 7, NULL, 195000.00, 15.00),
('Yerba Mate Rosamonte Suave (1kg)', 'La tradición argentina en cada sorbo, con un sabor suave y duradero.', 7, NULL, 7000.00, 0.00),
-- Salud y Belleza (Categoría ID: 8)
('Crema Facial Anti-Edad L''Oréal Revitalift', 'Reduce arrugas y mejora la firmeza de tu piel, para un rostro más joven y radiante.', 8, NULL, 26000.00, 10.00),
('Shampoo Pantene Pro-V Reparación (400ml)', 'Cabello fuerte y saludable desde la raíz hasta las puntas, con fórmula reparadora.', 8, NULL, 9100.00, 5.00),
('Protector Solar Nivea Sun FSP 50+', 'Protección alta contra los rayos UV, ideal para el uso diario y para la exposición al sol.', 8, NULL, 13000.00, 0.00),
('Pañales Pampers Premium Care Talla M (x60)', 'Comodidad y sequedad para tu bebé, con materiales suaves y absorbentes.', 8, 14, 45500.00, 12.00), -- Pampers
('Set de Maquillaje Esencial Maybelline', 'Todo lo que necesitas para tu look diario, con productos de alta calidad y colores versátiles.', 8, NULL, 32500.00, 15.00),
('Cepillo de Dientes Eléctrico Oral-B Pro 2000', 'Limpieza superior y encías más saludables, elimina hasta 100% más placa.', 8, NULL, 70000.00, 8.00),
-- Automotriz (Categoría ID: 9)
('Aceite Motor Syntium 800 SN 10W-40 (4L)', 'Protección óptima para tu motor, prolongando su vida útil y mejorando su rendimiento.', 9, NULL, 39000.00, 5.00),
('Batería Automotriz Willard Plata 12x75', 'Potencia de arranque confiable para tu vehículo, incluso en las condiciones más extremas.', 9, NULL, 91000.00, 0.00),
('Limpiaparabrisas Bosch Aerotwin (par)', 'Visibilidad clara en todas las condiciones climáticas, con tecnología de barrido eficiente.', 9, 10, 19500.00, 10.00), -- Bosch
('Fundas Asiento Auto Universales', 'Protege y renueva el interior de tu auto, con materiales resistentes y fácil instalación.', 9, NULL, 45500.00, 15.00),
('Cargador de Batería de Auto Inteligente', 'Mantiene tu batería siempre lista, con protección contra sobrecarga y cortocircuitos.', 9, NULL, 26000.00, 8.00),
('Neumático Goodyear EfficientGrip Performance 2', 'Agarre superior y eficiencia en el consumo de combustible, ideal para viajes largos.', 9, NULL, 180000.00, 5.00),
-- Mascotas (Categoría ID: 10)
('Alimento Balanceado Purina Pro Plan Perro Adulto (15kg)', 'Nutrición avanzada para tu mejor amigo, con ingredientes de alta calidad para una vida saludable.', 10, 13, 104000.00, 10.00), -- Purina
('Rascador para Gatos con Juguetes', 'Entretenimiento y cuidado de sus uñas, un espacio ideal para que tu gato se divierta y se relaje.', 10, NULL, 32500.00, 5.00),
('Cama Ortopédica para Perros Grandes', 'Máximo confort para su descanso, con soporte para articulaciones y columna vertebral.', 10, NULL, 78000.00, 0.00),
('Arena Sanitaria para Gatos (10kg)', 'Control de olores y fácil limpieza, mantiene el arenero fresco y sin malos olores.', 10, NULL, 13000.00, 0.00),
('Juguete Interactivo para Perros Kong Classic', 'Durable y divertido para morder, ayuda a reducir la ansiedad y el aburrimiento en tu perro.', 10, NULL, 19500.00, 8.00),
('Bebedero Fuente Automática para Mascotas', 'Agua fresca y filtrada disponible 24/7, fomenta la hidratación y la salud renal.', 10, NULL, 45000.00, 10.00);
GO

-- Insertar Imagenes (3 imágenes por cada uno de los 65 productos)
INSERT INTO Imagenes (URI, Producto_ID) VALUES
-- Producto 1: Smart TV 55" 4K HDR
('https://placehold.co/600x400/000000/FFFFFF?text=Smart+TV+55+Pulgadas+-+Frontal', 1),
('https://placehold.co/600x400/000000/FFFFFF?text=Smart+TV+55+Pulgadas+-+Pantalla', 1),
('https://placehold.co/600x400/000000/FFFFFF?text=Smart+TV+55+Pulgadas+-+Lateral', 1),
-- Producto 2: Smartphone Galaxy S24 Ultra
('https://placehold.co/600x400/000000/FFFFFF?text=Galaxy+S24+Ultra+-+Frontal', 2),
('https://placehold.co/600x400/000000/FFFFFF?text=Galaxy+S24+Ultra+-+Trasera', 2),
('https://placehold.co/600x400/000000/FFFFFF?text=Galaxy+S24+Ultra+-+Detalle+Cámara', 2),
-- Producto 3: Auriculares Inalámbricos WH-1000XM5
('https://placehold.co/600x400/000000/FFFFFF?text=Auriculares+Sony+XM5+-+Lateral', 3),
('https://placehold.co/600x400/000000/FFFFFF?text=Auriculares+Sony+XM5+-+Estuche', 3),
('https://placehold.co/600x400/000000/FFFFFF?text=Auriculares+Sony+XM5+-+Puestos', 3),
-- Producto 4: Laptop HP Pavilion 15
('https://placehold.co/600x400/000000/FFFFFF?text=HP+Pavilion+15+-+Abierta', 4),
('https://placehold.co/600x400/000000/FFFFFF?text=HP+Pavilion+15+-+Teclado', 4),
('https://placehold.co/600x400/000000/FFFFFF?text=HP+Pavilion+15+-+Cerrada', 4),
-- Producto 5: Smartwatch Apple Watch Series 9
('https://placehold.co/600x400/000000/FFFFFF?text=Apple+Watch+Series+9+-+Pantalla', 5),
('https://placehold.co/600x400/000000/FFFFFF?text=Apple+Watch+Series+9+-+Muñeca', 5),
('https://placehold.co/600x400/000000/FFFFFF?text=Apple+Watch+Series+9+-+Parte+Trasera', 5),
-- Producto 6: Tablet Xiaomi Pad 6
('https://placehold.co/600x400/000000/FFFFFF?text=Xiaomi+Pad+6+-+Frontal', 6),
('https://placehold.co/600x400/000000/FFFFFF?text=Xiaomi+Pad+6+-+Lateral', 6),
('https://placehold.co/600x400/000000/FFFFFF?text=Xiaomi+Pad+6+-+Con+Lápiz', 6),
-- Producto 7: Cámara Mirrorless Sony Alpha A7 III
('https://placehold.co/600x400/000000/FFFFFF?text=Sony+Alpha+A7+III+-+Frontal', 7),
('https://placehold.co/600x400/000000/FFFFFF?text=Sony+Alpha+A7+III+-+Con+Lente', 7),
('https://placehold.co/600x400/000000/FFFFFF?text=Sony+Alpha+A7+III+-+Pantalla', 7),
-- Producto 8: Barra de Sonido LG Soundbar SP9YA
('https://placehold.co/600x400/000000/FFFFFF?text=LG+Soundbar+SP9YA+-+Frontal', 8),
('https://placehold.co/600x400/000000/FFFFFF?text=LG+Soundbar+SP9YA+-+Con+Subwoofer', 8),
('https://placehold.co/600x400/000000/FFFFFF?text=LG+Soundbar+SP9YA+-+Conectores', 8),
-- Producto 9: Impresora Multifunción HP DeskJet 4120e
('https://placehold.co/600x400/000000/FFFFFF?text=Impresora+HP+4120e+-+Frontal', 9),
('https://placehold.co/600x400/000000/FFFFFF?text=Impresora+HP+4120e+-+Panel', 9),
('https://placehold.co/600x400/000000/FFFFFF?text=Impresora+HP+4120e+-+Cartuchos', 9),
-- Producto 10: Monitor Gamer Dell Alienware AW2521HFL
('https://placehold.co/600x400/000000/FFFFFF?text=Monitor+Dell+Alienware+-+Frontal', 10),
('https://placehold.co/600x400/000000/FFFFFF?text=Monitor+Dell+Alienware+-+Gaming', 10),
('https://placehold.co/600x400/000000/FFFFFF?text=Monitor+Dell+Alienware+-+Puertos', 10),
-- Producto 11: Consola de Videojuegos PlayStation 5
('https://placehold.co/600x400/000000/FFFFFF?text=PlayStation+5+-+Consola', 11),
('https://placehold.co/600x400/000000/FFFFFF?text=PlayStation+5+-+Mando', 11),
('https://placehold.co/600x400/000000/FFFFFF?text=PlayStation+5+-+Juego', 11),
-- Producto 12: Router Wi-Fi Xiaomi AX3000
('https://placehold.co/600x400/000000/FFFFFF?text=Router+Xiaomi+-+Frontal', 12),
('https://placehold.co/600x400/000000/FFFFFF?text=Router+Xiaomi+-+Antenas', 12),
('https://placehold.co/600x400/000000/FFFFFF?text=Router+Xiaomi+-+Conectado', 12),
-- Producto 13: Zapatillas Nike Air Force 1
('https://placehold.co/600x400/000000/FFFFFF?text=Nike+Air+Force+1+-+Lateral', 13),
('https://placehold.co/600x400/000000/FFFFFF?text=Nike+Air+Force+1+-+Cerca', 13),
('https://placehold.co/600x400/000000/FFFFFF?text=Nike+Air+Force+1+-+Puestas', 13),
-- Producto 14: Camiseta Adidas Essentials Logo
('https://placehold.co/600x400/000000/FFFFFF?text=Camiseta+Adidas+Essentials+-+Frontal', 14),
('https://placehold.co/600x400/000000/FFFFFF?text=Camiseta+Adidas+Essentials+-+Logo', 14),
('https://placehold.co/600x400/000000/FFFFFF?text=Camiseta+Adidas+Essentials+-+Tela', 14),
-- Producto 15: Jean Slim Fit Elastizado Hombre
('https://placehold.co/600x400/000000/FFFFFF?text=Jean+Slim+Fit+Hombre+-+Delante', 15),
('https://placehold.co/600x400/000000/FFFFFF?text=Jean+Slim+Fit+Hombre+-+Detalle', 15),
('https://placehold.co/600x400/000000/FFFFFF?text=Jean+Slim+Fit+Hombre+-+Puesto', 15),
-- Producto 16: Vestido Midi Estampado Mujer
('https://placehold.co/600x400/000000/FFFFFF?text=Vestido+Midi+Estampado+-+Frontal', 16),
('https://placehold.co/600x400/000000/FFFFFF?text=Vestido+Midi+Estampado+-+Patrón', 16),
('https://placehold.co/600x400/000000/FFFFFF?text=Vestido+Midi+Estampado+-+Espalda', 16),
-- Producto 17: Chaqueta Impermeable Puma Essential
('https://placehold.co/600x400/000000/FFFFFF?text=Chaqueta+Puma+-+Frontal', 17),
('https://placehold.co/600x400/000000/FFFFFF?text=Chaqueta+Puma+-+Cierre', 17),
('https://placehold.co/600x400/000000/FFFFFF?text=Chaqueta+Puma+-+Detalle', 17),
-- Producto 18: Pantalón Deportivo Nike Tech Fleece
('https://placehold.co/600x400/000000/FFFFFF?text=Pantalón+Nike+Tech+Fleece+-+Lateral', 18),
('https://placehold.co/600x400/000000/FFFFFF?text=Pantalón+Nike+Tech+Fleece+-+Tela', 18),
('https://placehold.co/600x400/000000/FFFFFF?text=Pantalón+Nike+Tech+Fleece+-+Bolsillo', 18),
-- Producto 19: Sudadera con Capucha Adidas Trefoil
('https://placehold.co/600x400/000000/FFFFFF?text=Sudadera+Adidas+Trefoil+-+Frontal', 19),
('https://placehold.co/600x400/000000/FFFFFF?text=Sudadera+Adidas+Trefoil+-+Capucha', 19),
('https://placehold.co/600x400/000000/FFFFFF?text=Sudadera+Adidas+Trefoil+-+Logo', 19),
-- Producto 20: Conjunto Pijama Algodón Mujer
('https://placehold.co/600x400/000000/FFFFFF?text=Pijama+Mujer+-+Completo', 20),
('https://placehold.co/600x400/000000/FFFFFF?text=Pijama+Mujer+-+Detalle+Tela', 20),
('https://placehold.co/600x400/000000/FFFFFF?text=Pijama+Mujer+-+Pantalón', 20),
-- Producto 21: Remera Manga Corta Hombre Estampada
('https://placehold.co/600x400/000000/FFFFFF?text=Remera+Hombre+Estampada+-+Frontal', 21),
('https://placehold.co/600x400/000000/FFFFFF?text=Remera+Hombre+Estampada+-+Estampado', 21),
('https://placehold.co/600x400/000000/FFFFFF?text=Remera+Hombre+Estampada+-+Cuello', 21),
-- Producto 22: Short Deportivo Puma Knit
('https://placehold.co/600x400/000000/FFFFFF?text=Short+Puma+Knit+-+Frontal', 22),
('https://placehold.co/600x400/000000/FFFFFF?text=Short+Puma+Knit+-+Lateral', 22),
('https://placehold.co/600x400/000000/FFFFFF?text=Short+Puma+Knit+-+Detalle', 22),
-- Producto 23: Botas de Cuero Hombre Urbanas
('https://placehold.co/600x400/000000/FFFFFF?text=Botas+Cuero+Hombre+-+Lateral', 23),
('https://placehold.co/600x400/000000/FFFFFF?text=Botas+Cuero+Hombre+-+Suela', 23),
('https://placehold.co/600x400/000000/FFFFFF?text=Botas+Cuero+Hombre+-+Detalle+Cierre', 23),
-- Producto 24: Bufanda de Lana Unisex
('https://placehold.co/600x400/000000/FFFFFF?text=Bufanda+Lana+-+Enrollada', 24),
('https://placehold.co/600x400/000000/FFFFFF?text=Bufanda+Lana+-+Textura', 24),
('https://placehold.co/600x400/000000/FFFFFF?text=Bufanda+Lana+-+Puesta', 24),
-- Producto 25: Heladera No Frost Whirlpool WRE57K1
('https://placehold.co/600x400/000000/FFFFFF?text=Heladera+Whirlpool+-+Puerta+Abierta', 25),
('https://placehold.co/600x400/000000/FFFFFF?text=Heladera+Whirlpool+-+Interior', 25),
('https://placehold.co/600x400/000000/FFFFFF?text=Heladera+Whirlpool+-+Panel+Control', 25),
-- Producto 26: Lavadora Carga Frontal Samsung WW90T504DAW
('https://placehold.co/600x400/000000/FFFFFF?text=Lavadora+Samsung+-+Frontal', 26),
('https://placehold.co/600x400/000000/FFFFFF?text=Lavadora+Samsung+-+Tambor', 26),
('https://placehold.co/600x400/000000/FFFFFF?text=Lavadora+Samsung+-+Panel', 26),
-- Producto 27: Aspiradora Robot Xiaomi Robot Vacuum Mop 2 Pro
('https://placehold.co/600x400/000000/FFFFFF?text=Aspiradora+Xiaomi+Robot+-+Funcionando', 27),
('https://placehold.co/600x400/000000/FFFFFF?text=Aspiradora+Xiaomi+Robot+-+Base+Carga', 27),
('https://placehold.co/600x400/000000/FFFFFF?text=Aspiradora+Xiaomi+Robot+-+Sensores', 27),
-- Producto 28: Cafetera Philips L''Or Barista LM8012/60
('https://placehold.co/600x400/000000/FFFFFF?text=Cafetera+Philips+L%27Or+-+Frontal', 28),
('https://placehold.co/600x400/000000/FFFFFF?text=Cafetera+Philips+L%27Or+-+Cápsulas', 28),
('https://placehold.co/600x400/000000/FFFFFF?text=Cafetera+Philips+L%27Or+-+Vaso', 28),
-- Producto 29: Juego de Sábanas King Size Algodón
('https://placehold.co/600x400/000000/FFFFFF?text=Sábanas+King+Size+-+Cama', 29),
('https://placehold.co/600x400/000000/FFFFFF?text=Sábanas+King+Size+-+Textura', 29),
('https://placehold.co/600x400/000000/FFFFFF?text=Sábanas+King+Size+-+Dobladas', 29),
-- Producto 30: Microondas Samsung MS23K3513AW
('https://placehold.co/600x400/000000/FFFFFF?text=Microondas+Samsung+-+Frontal', 30),
('https://placehold.co/600x400/000000/FFFFFF?text=Microondas+Samsung+-+Interior', 30),
('https://placehold.co/600x400/000000/FFFFFF?text=Microondas+Samsung+-+Panel', 30),
-- Producto 31: Tostadora Philips HD2581/90
('https://placehold.co/600x400/000000/FFFFFF?text=Tostadora+Philips+-+Frontal', 31),
('https://placehold.co/600x400/000000/FFFFFF?text=Tostadora+Philips+-+Tostadas', 31),
('https://placehold.co/600x400/000000/FFFFFF?text=Tostadora+Philips+-+Controles', 31),
-- Producto 32: Batidora de Mano Bosch ErgoMixx MS6CM4110
('https://placehold.co/600x400/000000/FFFFFF?text=Batidora+Bosch+-+Con+Accesorios', 32),
('https://placehold.co/600x400/000000/FFFFFF?text=Batidora+Bosch+-+Mango', 32),
('https://placehold.co/600x400/000000/FFFFFF?text=Batidora+Bosch+-+Usando', 32),
-- Producto 33: Set de Sartenes Antiadherentes Tramontina
('https://placehold.co/600x400/000000/FFFFFF?text=Sartenes+Tramontina+-+Set', 33),
('https://placehold.co/600x400/000000/FFFFFF?text=Sartenes+Tramontina+-+Detalle+Antiadh', 33),
('https://placehold.co/600x400/000000/FFFFFF?text=Sartenes+Tramontina+-+Cocina', 33),
-- Producto 34: Olla a Presión Eléctrica Instant Pot Duo
('https://placehold.co/600x400/000000/FFFFFF?text=Instant+Pot+-+Frontal', 34),
('https://placehold.co/600x400/000000/FFFFFF?text=Instant+Pot+-+Interior', 34),
('https://placehold.co/600x400/000000/FFFFFF?text=Instant+Pot+-+Panel+Control', 34),
-- Producto 35: Purificador de Aire Philips Serie 2000i
('https://placehold.co/600x400/000000/FFFFFF?text=Purificador+Aire+Philips+-+Frontal', 35),
('https://placehold.co/600x400/000000/FFFFFF?text=Purificador+Aire+Philips+-+Filtros', 35),
('https://placehold.co/600x400/000000/FFFFFF?text=Purificador+Aire+Philips+-+Display', 35),
-- Producto 36: Licuadora Oster BLSTPYG1210RBG
('https://placehold.co/600x400/000000/FFFFFF?text=Licuadora+Oster+-+Completa', 36),
('https://placehold.co/600x400/000000/FFFFFF?text=Licuadora+Oster+-+Vaso', 36),
('https://placehold.co/600x400/000000/FFFFFF?text=Licuadora+Oster+-+Motor', 36),
-- Producto 37: Cien Años de Soledad
('https://placehold.co/600x400/000000/FFFFFF?text=Cien+Años+Soledad+-+Portada', 37),
('https://placehold.co/600x400/000000/FFFFFF?text=Cien+Años+Soledad+-+Abierto', 37),
('https://placehold.co/600x400/000000/FFFFFF?text=Cien+Años+Soledad+-+Autor', 37),
-- Producto 38: El Señor de los Anillos
('https://placehold.co/600x400/000000/FFFFFF?text=El+Señor+Anillos+-+Portada', 38),
('https://placehold.co/600x400/000000/FFFFFF?text=El+Señor+Anillos+-+Mapa', 38),
('https://placehold.co/600x400/000000/FFFFFF?text=El+Señor+Anillos+-+Trilogía', 38),
-- Producto 39: Harry Potter y la Piedra Filosofal
('https://placehold.co/600x400/000000/FFFFFF?text=Harry+Potter+-+Piedra+Filosofal+-+Portada', 39),
('https://placehold.co/600x400/000000/FFFFFF?text=Harry+Potter+-+Piedra+Filosofal+-+Libro', 39),
('https://placehold.co/600x400/000000/FFFFFF?text=Harry+Potter+-+Piedra+Filosofal+-+Ilustración', 39),
-- Producto 40: 1984
('https://placehold.co/600x400/000000/FFFFFF?text=1984+-+Portada', 40),
('https://placehold.co/600x400/000000/FFFFFF?text=1984+-+Libro', 40),
('https://placehold.co/600x400/000000/FFFFFF?text=1984+-+Detalle', 40),
-- Producto 41: Sapiens: De animales a dioses
('https://placehold.co/600x400/000000/FFFFFF?text=Sapiens+-+Portada', 41),
('https://placehold.co/600x400/000000/FFFFFF?text=Sapiens+-+Libro+Abierto', 41),
('https://placehold.co/600x400/000000/FFFFFF?text=Sapiens+-+Autor', 41),
-- Producto 42: El Principito
('https://placehold.co/600x400/000000/FFFFFF?text=El+Principito+-+Portada', 42),
('https://placehold.co/600x400/000000/FFFFFF?text=El+Principito+-+Ilustraciones', 42),
('https://placehold.co/600x400/000000/FFFFFF?text=El+Principito+-+Libro+Abierto', 42),
-- Producto 43: Crónica de una Muerte Anunciada
('https://placehold.co/600x400/000000/FFFFFF?text=Crónica+Muerte+Anunciada+-+Portada', 43),
('https://placehold.co/600x400/000000/FFFFFF?text=Crónica+Muerte+Anunciada+-+Libro', 43),
('https://placehold.co/600x400/000000/FFFFFF?text=Crónica+Muerte+Anunciada+-+Autor', 43),
-- Producto 44: Pelota de Fútbol Adidas Tango Rosario
('https://placehold.co/600x400/000000/FFFFFF?text=Pelota+Adidas+Tango+-+Cancha', 44),
('https://placehold.co/600x400/000000/FFFFFF?text=Pelota+Adidas+Tango+-+Cerca', 44),
('https://placehold.co/600x400/000000/FFFFFF?text=Pelota+Adidas+Tango+-+Patrón', 44),
-- Producto 45: Colchoneta de Yoga Manduka PRO
('https://placehold.co/600x400/000000/FFFFFF?text=Colchoneta+Yoga+Manduka+-+Extendida', 45),
('https://placehold.co/600x400/000000/FFFFFF?text=Colchoneta+Yoga+Manduka+-+Enrollada', 45),
('https://placehold.co/600x400/000000/FFFFFF?text=Colchoneta+Yoga+Manduka+-+Usando', 45),
-- Producto 46: Mancuernas Ajustables Set (20kg)
('https://placehold.co/600x400/000000/FFFFFF?text=Mancuernas+Ajustables+-+Set', 46),
('https://placehold.co/600x400/000000/FFFFFF?text=Mancuernas+Ajustables+-+Cerca', 46),
('https://placehold.co/600x400/000000/FFFFFF?text=Mancuernas+Ajustables+-+Usando', 46),
-- Producto 47: Bicicleta de Montaña Rodado 29
('https://placehold.co/600x400/000000/FFFFFF?text=Bicicleta+Montaña+-+Lateral', 47),
('https://placehold.co/600x400/000000/FFFFFF?text=Bicicleta+Montaña+-+Rueda', 47),
('https://placehold.co/600x400/000000/FFFFFF?text=Bicicleta+Montaña+-+Manubrio', 47),
-- Producto 48: Raqueta de Tenis Wilson Ultra 100 v3
('https://placehold.co/600x400/000000/FFFFFF?text=Raqueta+Tenis+Wilson+-+Frontal', 48),
('https://placehold.co/600x400/000000/FFFFFF?text=Raqueta+Tenis+Wilson+-+Agarre', 48),
('https://placehold.co/600x400/000000/FFFFFF?text=Raqueta+Tenis+Wilson+-+Cuerda', 48),
-- Producto 49: Zapatillas Running Adidas Ultraboost 23
('https://placehold.co/600x400/000000/FFFFFF?text=Adidas+Ultraboost+23+-+Lateral', 49),
('https://placehold.co/600x400/000000/FFFFFF?text=Adidas+Ultraboost+23+-+Suela', 49),
('https://placehold.co/600x400/000000/FFFFFF?text=Adidas+Ultraboost+23+-+Puestas', 49),
-- Producto 50: Set de Pesas Rusas (Kettlebells)
('https://placehold.co/600x400/000000/FFFFFF?text=Kettlebells+-+Set', 50),
('https://placehold.co/600x400/000000/FFFFFF?text=Kettlebells+-+Cerca', 50),
('https://placehold.co/600x400/000000/FFFFFF?text=Kettlebells+-+Usando', 50),
-- Producto 51: Set de Construcción Lego City Comisaría
('https://placehold.co/600x400/000000/FFFFFF?text=Lego+Comisaría+-+Armado', 51),
('https://placehold.co/600x400/000000/FFFFFF?text=Lego+Comisaría+-+Caja', 51),
('https://placehold.co/600x400/000000/FFFFFF?text=Lego+Comisaría+-+Figuras', 51),
-- Producto 52: Muñeca Barbie Dreamtopia Princesa
('https://placehold.co/600x400/000000/FFFFFF?text=Barbie+Dreamtopia+-+Muñeca', 52),
('https://placehold.co/600x400/000000/FFFFFF?text=Barbie+Dreamtopia+-+Vestido', 52),
('https://placehold.co/600x400/000000/FFFFFF?text=Barbie+Dreamtopia+-+Caja', 52),
-- Producto 53: Pista de Carreras Hot Wheels Ultimate Garage
('https://placehold.co/600x400/000000/FFFFFF?text=Hot+Wheels+Garage+-+Armado', 53),
('https://placehold.co/600x400/000000/FFFFFF?text=Hot+Wheels+Garage+-+Caja', 53),
('https://placehold.co/600x400/000000/FFFFFF?text=Hot+Wheels+Garage+-+Autos', 53),
-- Producto 54: Peluche Grande Oso de Peluche
('https://placehold.co/600x400/000000/FFFFFF?text=Oso+Peluche+Grande+-+Sentado', 54),
('https://placehold.co/600x400/000000/FFFFFF?text=Oso+Peluche+Grande+-+Abrazando', 54),
('https://placehold.co/600x400/000000/FFFFFF?text=Oso+Peluche+Grande+-+Textura', 54),
-- Producto 55: Juego de Mesa Catan
('https://placehold.co/600x400/000000/FFFFFF?text=Catan+-+Tablero', 55),
('https://placehold.co/600x400/000000/FFFFFF?text=Catan+-+Caja', 55),
('https://placehold.co/600x400/000000/FFFFFF?text=Catan+-+Fichas', 55),
-- Producto 56: Rompecabezas 1000 Piezas Paisaje
('https://placehold.co/600x400/000000/FFFFFF?text=Rompecabezas+Paisaje+-+Armado', 56),
('https://placehold.co/600x400/000000/FFFFFF?text=Rompecabezas+Paisaje+-+Caja', 56),
('https://placehold.co/600x400/000000/FFFFFF?text=Rompecabezas+Paisaje+-+Piezas', 56),
-- Producto 57: Gaseosa Coca-Cola Original (1.5L)
('https://placehold.co/600x400/000000/FFFFFF?text=Coca-Cola+1.5L+-+Botella', 57),
('https://placehold.co/600x400/000000/FFFFFF?text=Coca-Cola+1.5L+-+Vaso', 57),
('https://placehold.co/600x400/000000/FFFFFF?text=Coca-Cola+1.5L+-+Helada', 57),
-- Producto 58: Café Molido La Virginia Clásico (500g)
('https://placehold.co/600x400/000000/FFFFFF?text=Café+La+Virginia+-+Paquete', 58),
('https://placehold.co/600x400/000000/FFFFFF?text=Café+La+Virginia+-+Taza', 58),
('https://placehold.co/600x400/000000/FFFFFF?text=Café+La+Virginia+-+Granos', 58),
-- Producto 59: Aceite de Oliva Extra Virgen (750ml)
('https://placehold.co/600x400/000000/FFFFFF?text=Aceite+Oliva+-+Botella', 59),
('https://placehold.co/600x400/000000/FFFFFF?text=Aceite+Oliva+-+En+Plato', 59),
('https://placehold.co/600x400/000000/FFFFFF?text=Aceite+Oliva+-+Olivas', 59),
-- Producto 60: Dulce de Leche Vacalin Tradicional (1kg)
('https://placehold.co/600x400/000000/FFFFFF?text=Dulce+Leche+Vacalin+-+Pote', 60),
('https://placehold.co/600x400/000000/FFFFFF?text=Dulce+Leche+Vacalin+-+En+Cuchara', 60),
('https://placehold.co/600x400/000000/FFFFFF?text=Dulce+Leche+Vacalin+-+Con+Tostadas', 60),
-- Producto 61: Vino Malbec Catena Zapata Nicasia
('https://placehold.co/600x400/000000/FFFFFF?text=Vino+Catena+Zapata+-+Botella', 61),
('https://placehold.co/600x400/000000/FFFFFF?text=Vino+Catena+Zapata+-+Copa', 61),
('https://placehold.co/600x400/000000/FFFFFF?text=Vino+Catena+Zapata+-+Viñedo', 61),
-- Producto 62: Yerba Mate Rosamonte Suave (1kg)
('https://placehold.co/600x400/000000/FFFFFF?text=Yerba+Mate+Rosamonte+-+Paquete', 62),
('https://placehold.co/600x400/000000/FFFFFF?text=Yerba+Mate+Rosamonte+-+Mate', 62),
('https://placehold.co/600x400/000000/FFFFFF?text=Yerba+Mate+Rosamonte+-+Bombilla', 62),
-- Producto 63: Crema Facial Anti-Edad L''Oréal Revitalift
('https://placehold.co/600x400/000000/FFFFFF?text=Crema+Facial+L%27Oréal+-+Envase', 63),
('https://placehold.co/600x400/000000/FFFFFF?text=Crema+Facial+L%27Oréal+-+Aplicando', 63),
('https://placehold.co/600x400/000000/FFFFFF?text=Crema+Facial+L%27Oréal+-+Textura', 63),
-- Producto 64: Shampoo Pantene Pro-V Reparación (400ml)
('https://placehold.co/600x400/000000/FFFFFF?text=Shampoo+Pantene+-+Botella', 64),
('https://placehold.co/600x400/000000/FFFFFF?text=Shampoo+Pantene+-+Espuma', 64),
('https://placehold.co/600x400/000000/FFFFFF?text=Shampoo+Pantene+-+Pelo', 64),
-- Producto 65: Protector Solar Nivea Sun FSP 50+
('https://placehold.co/600x400/000000/FFFFFF?text=Protector+Solar+Nivea+-+Envase', 65),
('https://placehold.co/600x400/000000/FFFFFF?text=Protector+Solar+Nivea+-+Aplicando', 65),
('https://placehold.co/600x400/000000/FFFFFF?text=Protector+Solar+Nivea+-+Playa', 65),
-- Producto 66: Pañales Pampers Premium Care Talla M (x60)
('https://placehold.co/600x400/000000/FFFFFF?text=Pañales+Pampers+-+Paquete', 66),
('https://placehold.co/600x400/000000/FFFFFF?text=Pañales+Pampers+-+Pañal+Abierto', 66),
('https://placehold.co/600x400/000000/FFFFFF?text=Pañales+Pampers+-+Bebé', 66),
-- Producto 67: Set de Maquillaje Esencial Maybelline
('https://placehold.co/600x400/000000/FFFFFF?text=Set+Maquillaje+Maybelline+-+Productos', 67),
('https://placehold.co/600x400/000000/FFFFFF?text=Set+Maquillaje+Maybelline+-+Brochas', 67),
('https://placehold.co/600x400/000000/FFFFFF?text=Set+Maquillaje+Maybelline+-+Aplicando', 67),
-- Producto 68: Cepillo de Dientes Eléctrico Oral-B Pro 2000
('https://placehold.co/600x400/000000/FFFFFF?text=Cepillo+Electrico+Oral-B+-+Cepillo', 68),
('https://placehold.co/600x400/000000/FFFFFF?text=Cepillo+Electrico+Oral-B+-+Cabezales', 68),
('https://placehold.co/600x400/000000/FFFFFF?text=Cepillo+Electrico+Oral-B+-+Cargador', 68),
-- Producto 69: Aceite Motor Syntium 800 SN 10W-40 (4L)
('https://placehold.co/600x400/000000/FFFFFF?text=Aceite+Motor+Syntium+-+Envase', 69),
('https://placehold.co/600x400/000000/FFFFFF?text=Aceite+Motor+Syntium+-+Motor', 69),
('https://placehold.co/600x400/000000/FFFFFF?text=Aceite+Motor+Syntium+-+Vertiendo', 69),
-- Producto 70: Batería Automotriz Willard Plata 12x75
('https://placehold.co/600x400/000000/FFFFFF?text=Batería+Willard+-+Batería', 70),
('https://placehold.co/600x400/000000/FFFFFF?text=Batería+Willard+-+Motor+Auto', 70),
('https://placehold.co/600x400/000000/FFFFFF?text=Batería+Willard+-+Terminales', 70),
-- Producto 71: Limpiaparabrisas Bosch Aerotwin (par)
('https://placehold.co/600x400/000000/FFFFFF?text=Limpiaparabrisas+Bosch+-+Set', 71),
('https://placehold.co/600x400/000000/FFFFFF?text=Limpiaparabrisas+Bosch+-+En+Auto', 71),
('https://placehold.co/600x400/000000/FFFFFF?text=Limpiaparabrisas+Bosch+-+Detalle', 71),
-- Producto 72: Fundas Asiento Auto Universales
('https://placehold.co/600x400/000000/FFFFFF?text=Fundas+Asiento+Auto+-+Instaladas', 72),
('https://placehold.co/600x400/000000/FFFFFF?text=Fundas+Asiento+Auto+-+Textura', 72),
('https://placehold.co/600x400/000000/FFFFFF?text=Fundas+Asiento+Auto+-+Set', 72),
-- Producto 73: Cargador de Batería de Auto Inteligente
('https://placehold.co/600x400/000000/FFFFFF?text=Cargador+Batería+Auto+-+Conectado', 73),
('https://placehold.co/600x400/000000/FFFFFF?text=Cargador+Batería+Auto+-+Pantalla', 73),
('https://placehold.co/600x400/000000/FFFFFF?text=Cargador+Batería+Auto+-+Cables', 73),
-- Producto 74: Neumático Goodyear EfficientGrip Performance 2
('https://placehold.co/600x400/000000/FFFFFF?text=Neumático+Goodyear+-+Lateral', 74),
('https://placehold.co/600x400/000000/FFFFFF?text=Neumático+Goodyear+-+Banda+Rodadura', 74),
('https://placehold.co/600x400/000000/FFFFFF?text=Neumático+Goodyear+-+En+Rueda', 74),
-- Producto 75: Alimento Balanceado Purina Pro Plan Perro Adulto (15kg)
('https://placehold.co/600x400/000000/FFFFFF?text=Alimento+Purina+-+Bolsa', 75),
('https://placehold.co/600x400/000000/FFFFFF?text=Alimento+Purina+-+En+Plato', 75),
('https://placehold.co/600x400/000000/FFFFFF?text=Alimento+Purina+-+Perro', 75),
-- Producto 76: Rascador para Gatos con Juguetes
('https://placehold.co/600x400/000000/FFFFFF?text=Rascador+Gatos+-+Completo', 76),
('https://placehold.co/600x400/000000/FFFFFF?text=Rascador+Gatos+-+Gato+Usando', 76),
('https://placehold.co/600x400/000000/FFFFFF?text=Rascador+Gatos+-+Detalle+Juguete', 76),
-- Producto 77: Cama Ortopédica para Perros Grandes
('https://placehold.co/600x400/000000/FFFFFF?text=Cama+Perro+Ortopédica+-+Cama', 77),
('https://placehold.co/600x400/000000/FFFFFF?text=Cama+Perro+Ortopédica+-+Perro+Durmiendo', 77),
('https://placehold.co/600x400/000000/FFFFFF?text=Cama+Perro+Ortopédica+-+Textura', 77),
-- Producto 78: Arena Sanitaria para Gatos (10kg)
('https://placehold.co/600x400/000000/FFFFFF?text=Arena+Sanitaria+Gatos+-+Bolsa', 78),
('https://placehold.co/600x400/000000/FFFFFF?text=Arena+Sanitaria+Gatos+-+Arenero', 78),
('https://placehold.co/600x400/000000/FFFFFF?text=Arena+Sanitaria+Gatos+-+Gato', 78),
-- Producto 79: Juguete Interactivo para Perros Kong Classic
('https://placehold.co/600x400/000000/FFFFFF?text=Kong+Classic+-+Juguete', 79),
('https://placehold.co/600x400/000000/FFFFFF?text=Kong+Classic+-+Perro+Jugando', 79),
('https://placehold.co/600x400/000000/FFFFFF?text=Kong+Classic+-+Con+Comida', 79),
-- Producto 80: Bebedero Fuente Automática para Mascotas
('https://placehold.co/600x400/000000/FFFFFF?text=Bebedero+Fuente+Mascotas+-+Fuente', 80),
('https://placehold.co/600x400/000000/FFFFFF?text=Bebedero+Fuente+Mascotas+-+Mascota+Bebiendo', 80),
('https://placehold.co/600x400/000000/FFFFFF?text=Bebedero+Fuente+Mascotas+-+Filtro', 80);
GO
