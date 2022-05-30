--SCRIPT DE HETELRA VERANUM

CREATE TABLE agencias (
    rut_agencia                 INTEGER NOT NULL,
    nombre                      VARCHAR2(30) NOT NULL,
    apellidos                   VARCHAR2(50) NOT NULL,
    fecha_nacimiento            DATE,
    "SISTEMA WEB_Id_sistema"    INTEGER NOT NULL,
    empresa_veranum_rut_empresa INTEGER NOT NULL,
    clientes_rut_cliente        INTEGER NOT NULL
);

ALTER TABLE agencias ADD CONSTRAINT agencias_pk PRIMARY KEY ( rut_agencia );

CREATE TABLE clientes (
    rut_cliente              INTEGER NOT NULL,
    nombre                   VARCHAR2(50) NOT NULL,
    apellidos                VARCHAR2(50) NOT NULL,
    fecha_nac                DATE NOT NULL,
    direccion                VARCHAR2(100) NOT NULL,
    telefono                 NUMBER(11) NOT NULL,
    correo                   VARCHAR2(30) NOT NULL,
    "SISTEMA WEB_Id_sistema" INTEGER
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( rut_cliente );

CREATE TABLE empresa_veranum (
    rut_empresa              INTEGER NOT NULL,
    nombre                   VARCHAR2(50),
    direccion                VARCHAR2(100) NOT NULL,
    telefono                 NUMBER(11) NOT NULL,
    correo                   VARCHAR2(30),
    razonsocial              VARCHAR2(50),
    "SISTEMA WEB_Id_sistema" INTEGER NOT NULL
);

ALTER TABLE empresa_veranum ADD CONSTRAINT empresa_veranum_pk PRIMARY KEY ( rut_empresa );

CREATE TABLE habitaciones (
    nro_habitacion   INTEGER NOT NULL,
    tipo             VARCHAR2(50) NOT NULL,
    precio           NUMBER(20) NOT NULL,
    fecha_reserva    DATE NOT NULL,
    hoteles_id_hotel INTEGER NOT NULL
);

ALTER TABLE habitaciones ADD CONSTRAINT habitaciones_pk PRIMARY KEY ( nro_habitacion );

CREATE TABLE hoteles (
    id_hotel     INTEGER NOT NULL,
    numero_de_habitacion INTEGER NOT NULL,
    nombre_hotel VARCHAR2(100) NOT NULL,
    direccion    VARCHAR2(150) NOT NULL,
    telefono     NUMBER(11) NOT NULL,
    correo       VARCHAR2(30)
);

ALTER TABLE hoteles ADD CONSTRAINT hoteles_pk PRIMARY KEY ( id_hotel );

CREATE TABLE proveedores (
    rut_proveedor INTEGER NOT NULL,
    nombre        VARCHAR2(100) NOT NULL,
    telefono      NUMBER(11) NOT NULL,
    direccion     VARCHAR2(100),
    correo        VARCHAR2(50) NOT NULL
);

ALTER TABLE proveedores ADD CONSTRAINT proveedores_pk PRIMARY KEY ( rut_proveedor );

CREATE TABLE reservas (
    id_reservas                 INTEGER NOT NULL,
    fecha_ingreso               DATE NOT NULL,
    fecha_salida                DATE NOT NULL,
    clientes_rut_cliente        INTEGER,
    hoteles_id_hotel            INTEGER NOT NULL,
    habitaciones_nro_habitacion INTEGER NOT NULL,
    agencias_rut_agencia        INTEGER NOT NULL
);

ALTER TABLE reservas ADD CONSTRAINT rservas_pk PRIMARY KEY ( id_reservas );

CREATE TABLE restaurantes (
    id_restaurante            INTEGER NOT NULL,
    nombre                    VARCHAR2(100) NOT NULL,
    ubicacion                 VARCHAR2(300) NOT NULL,
    telefono                  NUMBER(11) NOT NULL,
    correo                    VARCHAR2(50),
    hoteles_id_hotel          INTEGER NOT NULL,
    proveedores_rut_proveedor INTEGER NOT NULL,
    vendedores_rut_vendedor   INTEGER NOT NULL
);

ALTER TABLE restaurantes ADD CONSTRAINT restaurantes_pk PRIMARY KEY ( id_restaurante );

CREATE TABLE servicios (
    id_servicio      INTEGER NOT NULL,
    nombre           VARCHAR2(100) NOT NULL,
    tipo             VARCHAR2(100) NOT NULL,
    precio           NUMBER(20) NOT NULL,
    hoteles_id_hotel INTEGER NOT NULL
);

ALTER TABLE servicios ADD CONSTRAINT servicios_pk PRIMARY KEY ( id_servicio );

CREATE TABLE "SISTEMA WEB" (
    id_sistema INTEGER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    url_web    VARCHAR2(200) NOT NULL
);

ALTER TABLE "SISTEMA WEB" ADD CONSTRAINT "SISTEMA WEB_PK" PRIMARY KEY ( id_sistema );

CREATE TABLE vendedores (
    rut_vendedor INTEGER NOT NULL,
    nombres      VARCHAR2(50) NOT NULL,
    apellidos    VARCHAR2(50) NOT NULL,
    fecha_nac    DATE NOT NULL,
    direccion    VARCHAR2(100)
);

ALTER TABLE vendedores ADD CONSTRAINT vendedores_pk PRIMARY KEY ( rut_vendedor );

ALTER TABLE agencias
    ADD CONSTRAINT agencias_clientes_fk FOREIGN KEY ( clientes_rut_cliente )
        REFERENCES clientes ( rut_cliente );

ALTER TABLE agencias
    ADD CONSTRAINT agencias_empresa_veranum_fk FOREIGN KEY ( empresa_veranum_rut_empresa )
        REFERENCES empresa_veranum ( rut_empresa );

ALTER TABLE agencias
    ADD CONSTRAINT "Agencias_SISTEMA WEB_FK" FOREIGN KEY ( "SISTEMA WEB_Id_sistema" )
        REFERENCES "SISTEMA WEB" ( id_sistema );

ALTER TABLE clientes
    ADD CONSTRAINT "Clientes_SISTEMA WEB_FK" FOREIGN KEY ( "SISTEMA WEB_Id_sistema" )
        REFERENCES "SISTEMA WEB" ( id_sistema );

ALTER TABLE empresa_veranum
    ADD CONSTRAINT "EMPRESA_VERANUM_SISTEMA WEB_FK" FOREIGN KEY ( "SISTEMA WEB_Id_sistema" )
        REFERENCES "SISTEMA WEB" ( id_sistema );

ALTER TABLE habitaciones
    ADD CONSTRAINT habitaciones_hoteles_fk FOREIGN KEY ( hoteles_id_hotel )
        REFERENCES hoteles ( id_hotel );

ALTER TABLE restaurantes
    ADD CONSTRAINT restaurantes_hoteles_fk FOREIGN KEY ( hoteles_id_hotel )
        REFERENCES hoteles ( id_hotel );

ALTER TABLE restaurantes
    ADD CONSTRAINT restaurantes_proveedores_fk FOREIGN KEY ( proveedores_rut_proveedor )
        REFERENCES proveedores ( rut_proveedor );

ALTER TABLE restaurantes
    ADD CONSTRAINT restaurantes_vendedores_fk FOREIGN KEY ( vendedores_rut_vendedor )
        REFERENCES vendedores ( rut_vendedor );

ALTER TABLE reservas
    ADD CONSTRAINT rservas_agencias_fk FOREIGN KEY ( agencias_rut_agencia )
        REFERENCES agencias ( rut_agencia );

ALTER TABLE reservas
    ADD CONSTRAINT rservas_clientes_fk FOREIGN KEY ( clientes_rut_cliente )
        REFERENCES clientes ( rut_cliente );

ALTER TABLE reservas
    ADD CONSTRAINT rservas_habitaciones_fk FOREIGN KEY ( habitaciones_nro_habitacion )
        REFERENCES habitaciones ( nro_habitacion );

ALTER TABLE reservas
    ADD CONSTRAINT rservas_hoteles_fk FOREIGN KEY ( hoteles_id_hotel )
        REFERENCES hoteles ( id_hotel );

ALTER TABLE servicios
    ADD CONSTRAINT servicios_hoteles_fk FOREIGN KEY ( hoteles_id_hotel )
        REFERENCES hoteles ( id_hotel );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
