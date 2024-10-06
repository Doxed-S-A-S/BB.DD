drop database LinguaLinkDB;

create database LinguaLinkDB CHARSET utf8mb4;

ALTER DATABASE LinguaLinkDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE LinguaLinkDB;

CREATE TABLE
    muro (
        id_muro int unsigned PRIMARY KEY AUTO_INCREMENT,
        detalles tinytext not null,
        pub_destacada int not null,
        biografia tinytext not null
    );

CREATE TABLE
    usuario (
        id_usuario int unsigned PRIMARY KEY AUTO_INCREMENT,
        nombre varchar(50) NOT NULL,
        apellido1 varchar(50) NOT NULL,
        apellido2 varchar(50),
        pais varchar(2) NOT NULL, -- usamos ( ICAO nationality codes ) por eso varchar 2
        idiomas_hablados varchar(3) NOT NULL -- usamos ( ISO 639-2 ) por eso varchar 3
    );

CREATE TABLE
    grupos (
        id_grupo int unsigned PRIMARY KEY AUTO_INCREMENT,
        nombre_grupo varchar(70) UNIQUE not null,
        fecha_creacion DATE not null DEFAULT (CURRENT_DATE),
        descripcion tinytext not null,
        privacidad boolean not null,
        banner varchar(100),
        reports tinyint NOT NULL default '0',
        eliminado tinyint(1) NOT NULL default '0'
    );

CREATE TABLE
    mensajes (
        id_mensaje int unsigned PRIMARY KEY AUTO_INCREMENT,
        contenido tinytext not null,
        fecha_envio DATETIME not null DEFAULT CURRENT_TIMESTAMP()
    );

CREATE TABLE
    chats (
        id_chat int unsigned PRIMARY KEY AUTO_INCREMENT,
        nombre varchar(50) not null
    );

CREATE TABLE
    notificaciones (
        id_notificacion int unsigned PRIMARY KEY AUTO_INCREMENT,
        contenido tinytext not null,
        fecha_envio DATE not null DEFAULT (CURRENT_DATE),
        leida tinyint (1) NOT NULL DEFAULT '0'
    );

CREATE TABLE 
    set_preferencias (
        id_preferencia int unsigned primary key AUTO_INCREMENT,
        idioma_app varchar(3) DEFAULT ("spa") NOT NULL, -- usamos ( ISO 639-2 ) por eso varchar 3
        recordar_contrasena boolean default false NOT NULL,
        preferencias_contenido varchar(50),
        notificaciones_push boolean default false NOT NULL,
        muro_privado boolean default false NOT NULL,
        tema_de_apariencia ENUM ('claro', 'oscuro') not null
    );

CREATE TABLE 
    cuenta (
        id_cuenta INT unsigned PRIMARY KEY AUTO_INCREMENT,
        nombre_usuario varchar (50) UNIQUE not null,
        fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
        imagen_perfil VARCHAR(100) NOT NULL,
        rol_cuenta ENUM ('usuario','profesor','escuela') not null,
        reports tinyint DEFAULT 0 not null,
        id_usuario int unsigned NOT NULL,
        id_muro INT unsigned NOT NULL,
        id_preferencia INT unsigned NOT NULL, 
        eliminado boolean NOT NULL default false,
        FOREIGN KEY (id_usuario) references usuario(id_usuario),
        FOREIGN KEY (id_muro) REFERENCES muro (id_muro),
        FOREIGN KEY (id_preferencia) references set_preferencias(id_preferencia)
    );

CREATE TABLE
    registro(
        id_registro int unsigned PRIMARY KEY AUTO_INCREMENT,
        nombre_usuario varchar (50) UNIQUE,
        email VARCHAR(100) NOT NULL UNIQUE,
        contrasena VARCHAR(255) NOT NULL,
        id_cuenta INT unsigned,
        FOREIGN KEY (id_cuenta) references cuenta(id_cuenta)
    );

CREATE TABLE
    posts (
        id_post int unsigned not null PRIMARY KEY AUTO_INCREMENT,
        fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        url_contenido varchar(100) not null,
        url_imagen varchar(100) not null,
        tipo_contenido varchar(50) not null,
        contenido TEXT not null,
        id_cuenta int unsigned not null,
        reports tinyint NOT NULL default '0',
        eliminado tinyint(1) NOT NULL default '0',
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta)
    );

CREATE TABLE
    upvote (
        id_post int unsigned not null,
        id_upvote int unsigned not null PRIMARY KEY AUTO_INCREMENT,
        FOREIGN KEY (id_post) REFERENCES posts (id_post)
    );

CREATE TABLE
    comentarios (
        id_comentario int unsigned not null PRIMARY KEY AUTO_INCREMENT,
        id_post int unsigned not null,
        fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),        
        contenido tinytext not null,
        eliminado tinyint(1) NOT NULL default '0',
        FOREIGN KEY (id_post) REFERENCES posts (id_post)
    );

CREATE TABLE
    envia (
        id_mensaje int unsigned PRIMARY KEY,
        id_cuenta int unsigned NOT NULL,
        FOREIGN KEY (id_mensaje) REFERENCES mensajes (id_mensaje),
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta)
    );

CREATE TABLE
    contiene (
        id_mensaje int unsigned PRIMARY KEY,
        id_chat int unsigned not null,
        FOREIGN KEY (id_mensaje) REFERENCES mensajes (id_mensaje),
        FOREIGN KEY (id_chat) REFERENCES chats (id_chat)
    );

CREATE TABLE
    participa (
        id_chat INT unsigned NOT NULL,
        id_cuenta INT unsigned NOT NULL,
        PRIMARY KEY (id_chat, id_cuenta),
        FOREIGN KEY (id_chat) REFERENCES chats (id_chat),
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta)
    );

CREATE TABLE
    recibe (
        id_cuenta int unsigned NOT NULL,
        id_notificacion int unsigned NOT NULL,
        PRIMARY KEY (id_cuenta, id_notificacion),
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta),
        FOREIGN KEY (id_notificacion) REFERENCES notificaciones (id_notificacion)
    );

CREATE TABLE
    conforma (
        id_grupo int unsigned not null,
        id_cuenta int unsigned NOT NULL,
        rol ENUM ('owner', 'administrador', 'participante') NOT NULL,
        PRIMARY KEY (id_grupo, id_cuenta),
        FOREIGN KEY (id_grupo) REFERENCES grupos (id_grupo),
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta)
    );

CREATE TABLE
    postea_grupos (
        id_grupo int unsigned not null,
        id_post int unsigned not null,
        primary key (id_grupo, id_post),
        FOREIGN KEY (id_post) REFERENCES posts (id_post),
        FOREIGN KEY (id_grupo) REFERENCES grupos (id_grupo)
    );

CREATE TABLE
    comparte (
        id_post int unsigned not null,
        id_cuenta int unsigned not null,
        fecha_compartido DATETIME DEFAULT CURRENT_TIMESTAMP(),
        primary key (id_cuenta, id_post),
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta),
        FOREIGN KEY (id_post) REFERENCES posts (id_post)
    );

CREATE TABLE
    da_upvote (
        id_cuenta int unsigned not null,
        id_upvote int unsigned not null PRIMARY KEY,
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta),
        FOREIGN KEY (id_upvote) REFERENCES upvote (id_upvote)
    );

CREATE TABLE
    like_coment (
        id_upvote int unsigned not null PRIMARY KEY,
        id_comentario int unsigned not null,
        FOREIGN KEY (id_upvote) REFERENCES upvote (id_upvote),
        FOREIGN KEY (id_comentario) REFERENCES comentarios (id_comentario)
    );

CREATE TABLE
    hace (
        id_comentario int unsigned not null PRIMARY KEY,
        id_cuenta int unsigned not null,
        FOREIGN KEY (id_comentario) REFERENCES comentarios (id_comentario),
        FOREIGN KEY (id_cuenta) REFERENCES cuenta (id_cuenta)
    );

CREATE TABLE
    vinculados (
        id_cuenta1 INT unsigned NOT NULL,
        id_cuenta2 INT unsigned NOT NULL,
        tipo_vinculo ENUM ('amigo', 'bloqueado', 'seguido', 'silenciado') NOT NULL,
        PRIMARY KEY (id_cuenta1, id_cuenta2),
        FOREIGN KEY (id_cuenta1) REFERENCES cuenta (id_cuenta),
        FOREIGN KEY (id_cuenta2) REFERENCES cuenta (id_cuenta)
    );

CREATE TABLE
    postea_muro (
        id_muro INT unsigned NOT NULL,
        id_post INT unsigned NOT NULL,
        PRIMARY KEY (id_muro, id_post),
        FOREIGN KEY (id_post) REFERENCES posts (id_post),
        FOREIGN KEY (id_muro) REFERENCES muro (id_muro)
    );

CREATE TABLE
    evento (
            id_post int unsigned not null PRIMARY KEY,
            id_evento int unsigned not null UNIQUE AUTO_INCREMENT,
            nombre_evento varchar (50) not null,
            fecha_evento datetime not null CHECK(fecha_evento >= sysdate()),
            descripcion_evento tinytext not null,
            eliminado tinyint(1) NOT NULL default '0',
            FOREIGN KEY (id_post) REFERENCES posts (id_post)
    );

CREATE TABLE
    organiza (
        id_grupo int unsigned not null,
        id_evento int unsigned not null,
        primary key (id_grupo,id_evento),
        FOREIGN KEY (id_evento) REFERENCES evento (id_evento),
        FOREIGN KEY (id_grupo) REFERENCES grupos (id_grupo)
    );


create user 'api_client'@'localhost' identified by 'api@llpassword';
create user 'moderador_bko'@'localhost' identified by 'backoffice@mod';
create user 'admin_bko'@'localhost' identified by 'backoffice@admin';
create user 'database_adm'@'localhost' identified by 'databaseallow';

create role 'api_role';
grant SELECT,INSERT,UPDATE on LinguaLinkDB.* to 'api_role';
grant 'api_role' to 'api_client'@'localhost';

create role 'backoffice_modders_role';
grant SELECT,INSERT,UPDATE on LinguaLinkDB.* to 'backoffice_modders_role';
grant 'backoffice_modders_role' to 'moderador_bko'@'localhost';

create role 'backoffice_admins_role';
grant SELECT,INSERT,UPDATE,DELETE on LinguaLinkDB.* to 'backoffice_admins_role';
grant 'backoffice_admins_role' to 'database_adm'@'localhost';

create role 'database_admin_role';
grant all PRIVILEGES on *.* to database_admin_role with grant option;
grant 'database_admin_role' to 'database_adm'@'localhost';