-- Datos para la tabla 'muro'
INSERT INTO muro (detalles, pub_destacada, biografia) 
VALUES 
('Detalles del muro 1', 1, 'Biografía del usuario 1'),
('Detalles del muro 2', 0, 'Biografía del usuario 2'),
('Detalles del muro 3', 1, 'Biografía del usuario 3'),
('Detalles del muro 4', 0, 'Biografía del usuario 4'),
('Detalles del muro 5', 1, 'Biografía del usuario 5');

-- Datos para la tabla 'usuario'
INSERT INTO usuario (nombre, apellido1, apellido2, pais, idiomas_hablados) 
VALUES 
('Juan', 'Pérez', 'Gómez', 'ES', 'spa'),
('Maria', 'Lopez', NULL, 'US', 'eng'),
('Carlos', 'Martinez', 'Hernandez', 'MX', 'spa'),
('Ana', 'Garcia', 'Sanchez', 'FR', 'fra'),
('Luis', 'Rodriguez', NULL, 'IT', 'ita');

-- Datos para la tabla 'grupos'
INSERT INTO grupos (nombre_grupo, descripcion, privacidad, banner) 
VALUES 
('Grupo Cultural', 'Grupo de intercambio cultural', 1, 'banner1.jpg'),
('Aprendiendo Español', 'Grupo para aprender español', 0, 'banner2.jpg'),
('Tecnología Avanzada', 'Discusión sobre nuevas tecnologías', 0, 'banner3.jpg'),
('Grupo de Viajes', 'Compartir experiencias de viaje', 1, 'banner4.jpg'),
('Club de Lectura', 'Grupo para compartir libros y opiniones', 0, 'banner5.jpg');

-- Datos para la tabla 'mensajes'
INSERT INTO mensajes (contenido) 
VALUES 
('Hola, ¿cómo estás?'),
('¿Qué tal el evento?'),
('¡Nos vemos mañana!'),
('¿Dónde está el lugar de reunión?'),
('Confirmo asistencia al evento.');

-- Datos para la tabla 'chats'
INSERT INTO chats (nombre) 
VALUES 
('Chat General'), 
('Chat de Estudio'),
('Chat de Viajeros'),
('Chat de Lectura'),
('Chat de Tecnología');

-- Datos para la tabla 'notificaciones'
INSERT INTO notificaciones (contenido) 
VALUES 
('Tienes una nueva solicitud de amistad.'),
('Tu publicación ha recibido un comentario.'),
('Te han mencionado en una conversación.'),
('Nueva actualización en tu grupo favorito.'),
('Tu cuenta ha sido verificada.');

-- Datos para la tabla 'set_preferencias'
INSERT INTO set_preferencias (preferencias_contenido, tema_de_apariencia) 
VALUES 
('Intereses en tecnología', 'claro'), 
('Intereses en arte', 'oscuro'),
('Intereses en música', 'claro'),
('Intereses en viajes', 'oscuro'),
('Intereses en deportes', 'claro');

-- Datos para la tabla 'cuenta'
INSERT INTO cuenta (nombre_usuario, imagen_perfil, rol_cuenta, id_usuario, id_muro, id_preferencia) 
VALUES 
('juan123', 'perfil1.jpg', 'usuario', 1, 1, 1),
('maria_l', 'perfil2.jpg', 'profesor', 2, 2, 2),
('carlos_mx', 'perfil3.jpg', 'usuario', 3, 3, 3),
('ana_fr', 'perfil4.jpg', 'escuela', 4, 4, 4),
('luis_it', 'perfil5.jpg', 'usuario', 5, 5, 5);

-- Datos para la tabla 'registro'
INSERT INTO registro (nombre_usuario, email, contrasena, id_cuenta) 
VALUES 
('juan123', 'juan@mail.com', 'pass123', 1),
('maria_l', 'maria@mail.com', 'pass456', 2),
('carlos_mx', 'carlos@mail.com', 'pass789', 3),
('ana_fr', 'ana@mail.com', 'pass101', 4),
('luis_it', 'luis@mail.com', 'pass112', 5);

-- Datos para la tabla 'posts'
INSERT INTO posts (url_contenido, tipo_contenido, contenido, id_cuenta) 
VALUES 
('post1.jpg', 'imagen', 'Primer post de Juan', 1),
('post2.mp4', 'video', 'Video de Maria sobre arte', 2),
('post3.png', 'imagen', 'Foto de Carlos sobre tecnología', 3),
('post4.pdf', 'documento', 'Guía de Ana sobre enseñanza', 4),
('post5.jpg', 'imagen', 'Luis compartiendo sus viajes', 5);

-- Datos para la tabla 'upvote'
INSERT INTO upvote (id_post) 
VALUES 
(1),
(2),
(3),
(4),
(5);

-- Datos para la tabla 'comentarios'
INSERT INTO comentarios (id_post, contenido) 
VALUES 
(1, 'Excelente post!'),
(2, 'Muy interesante video.'),
(3, 'Increíble foto.'),
(4, 'Gracias por compartir la guía.'),
(5, 'Qué buen viaje, ¡me encantó!');

-- Datos para la tabla 'envia'
INSERT INTO envia (id_mensaje, id_cuenta) 
VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'contiene'
INSERT INTO contiene (id_mensaje, id_chat) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'participa'
INSERT INTO participa (id_chat, id_cuenta) 
VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'recibe'
INSERT INTO recibe (id_cuenta, id_notificacion) 
VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'conforma'
INSERT INTO conforma (id_grupo, id_cuenta, rol) 
VALUES 
(1, 1, 'owner'),
(2, 2, 'administrador'),
(3, 3, 'participante'),
(4, 4, 'participante'),
(5, 5, 'participante');

-- Datos para la tabla 'postea_grupos'
INSERT INTO postea_grupos (id_grupo, id_post) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'comparte'
INSERT INTO comparte (id_post, id_cuenta) 
VALUES 
(1, 2), 
(2, 1),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'da_upvote'
INSERT INTO da_upvote (id_cuenta, id_upvote) 
VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'like_coment'
INSERT INTO like_coment (id_upvote, id_comentario) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'hace'
INSERT INTO hace (id_comentario, id_cuenta) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'vinculados'
INSERT INTO vinculados (id_cuenta1, id_cuenta2, tipo_vinculo) 
VALUES 
(1, 2, 'amigo'), 
(2, 1, 'amigo'),
(3, 4, 'seguido'),
(4, 5, 'amigo'),
(5, 3, 'bloqueado');

-- Datos para la tabla 'postea_muro'
INSERT INTO postea_muro (id_muro, id_post) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Datos para la tabla 'evento'
INSERT INTO evento (id_post, nombre_evento, imagen, fecha_evento, descripcion_evento) 
VALUES 
(1, 'Evento Cultural', 'evento1.jpg', '2024-10-10 18:00:00', 'Un evento para conocer nuevas culturas.'),
(2, 'Charla sobre tecnología', 'evento2.jpg', '2024-10-20 15:00:00', 'Discusión sobre IA y el futuro de la tecnología.'),
(3, 'Festival de Cine', 'evento3.jpg', '2024-09-25 20:00:00', 'Un festival de cine independiente.'),
(4, 'Exposición de Arte', 'evento4.jpg', '2024-11-05 10:00:00', 'Exposición de arte contemporáneo.'),
(5, 'Torneo de Ajedrez', 'evento5.jpg', '2024-12-01 09:00:00', 'Torneo de ajedrez abierto.');

-- Datos para la tabla 'organiza'
INSERT INTO organiza (id_grupo, id_evento) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
