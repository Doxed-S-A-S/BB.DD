drop database LinguaLinkBackOffice;

create database LinguaLinkBackOffice CHARSET utf8mb4;

ALTER DATABASE LinguaLinkBackOffice CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE LinguaLinkBackOffice;

CREATE TABLE
    moderadores(
        id_moderador int unsigned PRIMARY KEY AUTO_INCREMENT,
        user varchar (30) not null,
        pass varchar (50) not null,
        active boolean default true NOT NULL
    )

Create table
    tickets(
        id_ticket int unsigned PRIMARY KEY AUTO_INCREMENT,
        id_moderador int unsigned UNIQUE,
        id_objetivo int unsigned not null,
        tipo enum ('post','evento','grupo','cuenta'),
        resuelto boolean default false not null,
        fecha_resuelto DATETIME,
        FOREIGN KEY (id_moderador) references moderadores(id_moderador)
    )


-- usuarios no testeados

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