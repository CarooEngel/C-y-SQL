use master
go

create database BDGrupo6
go

use BDGrupo6
go

--CREACION DE TABLAS-- 10 TABLAS

create table Provincias
 (
 IdProvincias_Pr char(2) not null,
 descripcionProvincia_Pr varchar(50) not null,
 constraint Pk_Provincias  PRIMARY KEY (IdProvincias_Pr)
 )
 go

create table Localidades
(
IdLocalidad_Loc char(2) not null,
IdProvincia_Loc   char(2) not null,
descripcionLocalidad_Loc varchar(50) not null,
constraint Pk_Localidades PRIMARY KEY (IdLocalidad_Loc),
constraint FK_Localidades_Provincias FOREIGN KEY (IdProvincia_Loc) references Provincias (IdProvincias_Pr)
)
go

--INSERT  Localidades(IdLocalidad_Loc,IdProvincia_Loc,descripcionLocalidad_Loc ) 
--SELECT 'Tr','BS','Tigre'

create table Especialidades
(
IdEspecialidad_Esp char(2) not null,
descripcion_Esp varchar(50) not null,
constraint Pk_Especialidades  PRIMARY KEY (IdEspecialidad_Esp)
)
go

CREATE TABLE Medicos 
(
Legajo_Me char(5) NOT NULL,
IdEspecialidad_Me char(2) NOT NULL,
IdLocalidad_Me char(2) NOT NULL,
IdProvincia_Me char(2) NOT NULL,
Dni_Me varchar(8) NOT NULL,
Nombre_Me varchar(50) NOT NULL,
Apellido_Me varchar(50) NOT NULL,
Sexo_Me CHAR(1) CHECK (Sexo_Me IN ('M', 'F')) NOT NULL, --
Nacionalidad_Me varchar(50) NOT NULL,
FechaNacimiento_Me DATE NOT NULL,
Direccion_Me varchar(100) NOT NULL,
CorreoElectronico_Me varchar(100) NOT NULL,
Telefono_Me varchar(20) NOT NULL,
Estado_Me bit DEFAULT 1,
CONSTRAINT PK_Legajo_Me  PRIMARY KEY (Legajo_Me),
CONSTRAINT FK_MedicoEspecialidad FOREIGN KEY (IdEspecialidad_Me) REFERENCES Especialidades(IdEspecialidad_Esp),
CONSTRAINT FK_MedicoLocalidad FOREIGN KEY (IdLocalidad_Me) REFERENCES Localidades(IdLocalidad_Loc),
)
Go

CREATE TABLE Meses
(
IdMes_Mes int not null,
DescripcionMes_Mes varchar(9)not null,
cantidadDias_Mes int not null,
CONSTRAINT PK_Meses PRIMARY KEY (IdMes_Mes)
)
GO

CREATE TABLE Semana 
(
IdSemana_Sem int not null,
Descripcion_Sem varchar(9)not null,
CONSTRAINT PK_Dia PRIMARY KEY (IdSemana_Sem)
)
GO

CREATE TABLE DiasLaborales
(
IdDiaLaborable_DL INT IDENTITY (1,1) NOT NULL,
LegajoMedico_DL CHAR (5) NOT NULL,
Seman_DL CHAR(9) not null,
Dia_DL DATE NOT NULL,
IdMes_DL  int not null,
HoraInicio_DL TIME(0) NOT NULL,
HoraFinal_DL TIME(0) NOT NULL,
DiaActivo_DL bit DEFAULT 1 ,
CONSTRAINT PK_DiasLaborales_DL PRIMARY KEY (IdDiaLaborable_DL),
CONSTRAINT FK_LegajoMedico_DL FOREIGN KEY (LegajoMedico_DL) REFERENCES Medicos(Legajo_Me),
CONSTRAINT FK_DiasLaboralesMeses FOREIGN KEY (IdMes_DL) REFERENCES Meses(IdMes_Mes)
)
GO

CREATE TABLE Usuarios (
CodUsuario_Usu INT IDENTITY (1,1) NOT NULL,
Legajo_Usu CHAR(5), 

Nombre_Usu VARCHAR(8),
Contrasenia_Usu VARCHAR(8),
Rol_Usu CHAR(1) CHECK (Rol_Usu IN ('A', 'M')), 
CONSTRAINT PK_Usuario_Usu PRIMARY KEY (CodUsuario_Usu)
)
Go

CREATE TABLE Pacientes(
Nombre_Pa VARCHAR(50) NOT NULL,
Apellido_Pa VARCHAR(50) NOT NULL,
DniPaciente_Pa VARCHAR(8) NOT NULL,
Sexo_Pa CHAR(1) CHECK (Sexo_Pa IN ('M', 'F')) NOT NULL,
Edad_Pa TINYINT NOT NULL,
IdLocalidad_Pa CHAR(2) NOT NULL,
IdProvincia_Pa CHAR(2) NOT NULL,
Nacionalidad_Pa varchar(50) NULL,
FechaNacimiento_Pa DATE NOT NULL,
Direccion_Pa varchar(100) NULL,
CorreoElectronico_Me varchar(100) NOT NULL,
Telefono_Pa varchar(20) NOT NULL,
Asistencia_Pa BIT DEFAULT 1 NOT NULL,
Observacion_Pa VARCHAR(300) NULL,
Estado_Pa BIT DEFAULT 1 ,
CONSTRAINT Pk_Pacientes_Pa PRIMARY KEY (DniPaciente_Pa),
CONSTRAINT Fk_idLocalidades_Pa FOREIGN KEY(IdLocalidad_Pa) REFERENCES Localidades(IdLocalidad_Loc)

)
Go

CREATE TABLE Turnos
(
IdTurno_Tr INT IDENTITY (1,1),
idDiasLaborales int ,
LegajoMedico_Tr CHAR (5),
IdEspecialidad_Tr varchar (30),
nombreMedico varchar(50),
DniPaciente_Tr VARCHAR (8),
FechaTurno_Tr VARCHAR (10),
Horario_Tr VARCHAR (5),
Asistencia_Tr  char(1) DEFAULT 'A',
Observacion_Tr text  DEFAULT 'SIN OBSERVACION' ,
Estado_Tr bit default 1,
CONSTRAINT Pk_IdTurno_Tr PRIMARY KEY (IdTurno_Tr),
CONSTRAINT Fk_LegajoMedico_Tr FOREIGN KEY (LegajoMedico_Tr) REFERENCES Medicos (Legajo_Me),
CONSTRAINT Fk_DNIPaciente_Tr FOREIGN KEY (DniPaciente_Tr) REFERENCES Pacientes (DniPaciente_Pa)
)
GO

--BORRAR TABLA--

--DROP TABLE Turnos
--go

--BORRAR BASE DE DATOS--

--drop database BDGrupo6
--go

--MODIFICAR TABLA--

--ALTER TABLE Pacientes
--Go

--MOSTRAR--

select* from  Provincias
select* from  Localidades 
select* from  Especialidades



select* from  Meses
select* from  Semana
select* from  Especialidades
select* from  Pacientes  
select* from  Medicos
select* from  Usuarios

select* from  DiasLaborales  where LegajoMedico_DL='M0001' and Dia_DL>= '2024-12-07'

select* from  Turnos


--INSERTAR DATOS--

INSERT INTO Provincias (IdProvincias_Pr, descripcionProvincia_Pr)
SELECT 'BA', 'Buenos Aires' UNION
SELECT 'CB', 'Córdoba' UNION
SELECT 'SF', 'Santa Fe' UNION
SELECT 'ER', 'Entre Ríos' UNION
SELECT 'MD', 'Mendoza' UNION
SELECT 'SJ', 'San Juan' UNION
SELECT 'SL', 'San Luis' UNION
SELECT 'LP', 'La Pampa' UNION
SELECT 'CT', 'Catamarca' UNION
SELECT 'TM', 'Tucumán' UNION
SELECT 'JU', 'Jujuy' UNION
SELECT 'SA', 'Salta' UNION
SELECT 'NE', 'Neuquén' UNION
SELECT 'RN', 'Río Negro' UNION
SELECT 'SC', 'Santa Cruz'
Go

INSERT INTO Localidades (IdLocalidad_Loc, IdProvincia_Loc, descripcionLocalidad_Loc)
SELECT '01', 'BA', 'La Plata' UNION
SELECT '02', 'BA', 'Mar del Plata' UNION
SELECT '03', 'BA', 'Bahia Blanca' UNION
SELECT '04', 'BA', 'San Nicolas' UNION
SELECT '05', 'BA', 'Tandil' UNION
SELECT '06', 'CB', 'Córdoba Capital' UNION 
SELECT '07', 'CB', 'Villa Carlos Paz' UNION 
SELECT '08', 'CB', 'Río Cuarto' UNION 
SELECT '09', 'CB', 'Villa María' UNION
SELECT '10', 'CB', 'San Francisco'UNION
SELECT '11', 'SF', 'Santa Fe' UNION
SELECT '12', 'SF', 'Rosario' UNION 
SELECT '13', 'SF', 'Rafaela' UNION
SELECT '14', 'SF', 'Venado Tuerto' UNION
SELECT '15', 'SF', 'Reconquista'UNION
SELECT '16', 'ER', 'Paraná' UNION 
SELECT '17', 'ER', 'Concordia' UNION
SELECT '18', 'ER', 'Gualeguaychú' UNION 
SELECT '19', 'ER', 'Gualeguay' UNION 
SELECT '20', 'ER', 'Victoria'UNION
SELECT '21', 'MD', 'Mendoza' UNION 
SELECT '22', 'MD', 'San Rafael' UNION 
SELECT '23', 'MD', 'Godoy Cruz' UNION 
SELECT '24', 'MD', 'Luján de Cuyo' UNION 
SELECT '25', 'MD', 'Maipú'UNION
SELECT '26', 'SJ', 'San Juan' UNION
SELECT '27', 'SJ', 'Rawson' UNION
SELECT '28', 'SJ', 'Rivadavia' UNION
SELECT '29', 'SJ', 'Chimbas' UNION 
SELECT '30', 'SJ', 'Pocito'UNION
SELECT '31', 'SL', 'San Luis' UNION 
SELECT '32', 'SL', 'Villa Mercedes' UNION 
SELECT '33', 'SL', 'Merlo' UNION 
SELECT '34', 'SL', 'La Punta' UNION 
SELECT '35', 'SL', 'Juana Koslay'UNION
SELECT '36', 'LP', 'Santa Rosa' UNION 
SELECT '37', 'LP', 'General Pico' UNION 
SELECT '38', 'LP', 'Toay' UNION 
SELECT '39', 'LP', 'General Acha' UNION 
SELECT '40', 'LP', 'Victorica'UNION
SELECT '41', 'CT', 'San Fernando del Valle de Catamarca' UNION 
SELECT '42', 'CT', 'Valle Viejo' UNION 
SELECT '43', 'CT', 'Belén' UNION 
SELECT '44', 'CT', 'Tinogasta' UNION 
SELECT '45', 'CT', 'Andalgalá'UNION
SELECT '46', 'TM', 'San Miguel de Tucumán' UNION 
SELECT '47', 'TM', 'Tafí Viejo' UNION 
SELECT '48', 'TM', 'Yerba Buena' UNION 
SELECT '49', 'TM', 'Concepción' UNION
SELECT '50', 'TM', 'Monteros'UNION
SELECT '51', 'JU', 'San Salvador de Jujuy' UNION 
SELECT '52', 'JU', 'Palpalá' UNION 
SELECT '53', 'JU', 'Perico' UNION 
SELECT '54', 'JU', 'San Pedro de Jujuy' UNION
SELECT '55', 'JU', 'La Quiaca'UNION
SELECT '56', 'SA', 'Salta' UNION
SELECT '57', 'SA', 'Tartagal' UNION
SELECT '58', 'SA', 'Orán' UNION
SELECT '59', 'SA', 'Cafayate' UNION 
SELECT '60', 'SA', 'Metán'UNION
SELECT '61', 'NE', 'Neuquén' UNION 
SELECT '62', 'NE', 'San Martín de los Andes' UNION
SELECT '63', 'NE', 'Zapala' UNION 
SELECT '64', 'NE', 'Plottier' UNION 
SELECT '65', 'NE', 'Centenario'UNION
SELECT '66', 'RN', 'Viedma' UNION 
SELECT '67', 'RN', 'San Carlos de Bariloche' UNION 
SELECT '68', 'RN', 'General Roca' UNION 
SELECT '69', 'RN', 'Cipolletti' UNION 
SELECT '70', 'RN', 'Villa Regina'UNION
SELECT '71', 'SC', 'Río Gallegos' UNION 
SELECT '72', 'SC', 'Caleta Olivia' UNION 
SELECT '73', 'SC', 'El Calafate' UNION 
SELECT '74', 'SC', 'Pico Truncado' UNION 
SELECT '75', 'SC', 'Las Heras';
Go

INSERT INTO Especialidades (IdEspecialidad_Esp, descripcion_Esp)
SELECT '01', 'Cardiologia' UNION
SELECT '02', 'Odontologia' UNION
SELECT '03', 'Traumatologia' UNION
SELECT '04', 'Ginecologia' UNION
SELECT '05', 'Neurologia' UNION
SELECT '06', 'Oftalmologia' UNION
SELECT '07', 'Clinico Medico'UNION
SELECT '08', 'Oncologia' UNION
SELECT '09', 'Pediatria' UNION
SELECT '10', 'Podologia' UNION
SELECT '11', 'Dermatologia' UNION
SELECT '12', 'Cirugia' UNION
SELECT '13', 'Gastroenterologia' UNION
SELECT '14', 'Endocrinologia' UNION
SELECT '15', 'hematologia' ;
Go

INSERT INTO Meses (IdMes_Mes, DescripcionMes_Mes, cantidadDias_Mes)
SELECT 1, 'Enero',31 UNION 
SELECT 2, 'Febrero',29 UNION 
SELECT 3, 'Marzo' ,31UNION 
SELECT 4, 'Abril' ,30UNION 
SELECT 5, 'Mayo',31 UNION 
SELECT 6, 'Junio',30 UNION 
SELECT 7, 'Julio',31 UNION 
SELECT 8, 'Agosto',31 UNION 
SELECT 9, 'Septiembr' ,30UNION 
SELECT 10, 'Octubre',31 UNION 
SELECT 11, 'Noviembre',30 UNION 
SELECT 12, 'Diciembre',31;
Go

INSERT INTO Semana(IdSemana_Sem, Descripcion_Sem)
SELECT 1, 'Lunes'
UNION
SELECT 2, 'Martes'
UNION
SELECT 3, 'Miércoles'
UNION
SELECT 4, 'Jueves'
UNION
SELECT 5, 'Viernes'
UNION
SELECT 6, 'Sábado'
UNION
SELECT 7, 'Domingo';
Go

INSERT INTO Usuarios (Legajo_Usu, Nombre_Usu, Contrasenia_Usu, Rol_Usu)
VALUES
('A0001', 'Gimena', 'pass123', 'A'), 
('A0002', 'Anabel', 'pass456', 'A'), 
('M0001', 'Juan', 'pass789', 'M'), 
('M0002', 'Maria', 'pass101', 'M'), 
('M0003', 'Taylor', 'pass202', 'M'); 

INSERT INTO Medicos 
(Legajo_Me, IdEspecialidad_Me, IdLocalidad_Me, IdProvincia_Me, Dni_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me, Direccion_Me, CorreoElectronico_Me, Telefono_Me, Estado_Me)
VALUES 
('M0001', '01', '01', '01', '12345678', 'Juan', 'Pérez', 'M', 'Argentino', '1980-05-15', 'Calle Falsa 123', 'juan.perez@example.com', '1234567890', 1),
('M0002', '01', '02', '01', '87654321', 'María', 'Gómez', 'F', 'Argentina', '1985-07-20', 'Avenida Siempre Viva 456', 'maria.gomez@example.com', '0987654321', 1),
('M0003', '03', '03', '01', '29389266', 'Taylor', 'Swift', 'F', 'Argentina', '1989-12-13', 'Hollywood 13', 'taylor.swift@example.com', '1113333313', 1),
('M0004', '04', '04', '01', '33928712', 'Sherlock', 'Holmes', 'F', 'Argentina', '1987-12-3', 'Baker Street 221', 'sherlock@example.com', '2839908465', 1),
('M0005', '05', '05', '01', '17392883', 'Naruto', 'Uzumaki', 'M', 'Argentino', '1998-3-29', 'Konoha 77', 'rasengan@example.com', '9025784936', 1),
('M0007', '05', '05', '01', '17392883', 'coso', 'coso', 'M', 'Argentino', '1998-3-29', 'Konoha 77', 'rasengan@example.com', '223154', 1),
('M0006', '01', '05', '01', '34955063', 'Sakura', 'huruno', 'F', 'Argentino', '1996-06-21', 'Konoha 77', 'coso@example.com', '2235784936', 1),
('M0008', '01', '05', '01', '3500000', 'iruka', 'nose', 'F', 'Argentino', '1996-05-22', 'Konoha 77', 'coso@example.com', '2235784936', 0),
('M0009', '02', '02', '01', '31789012', 'Hinata', 'Hyuga', 'F', 'Argentina', '1997-12-27', 'Aldea de la Hoja 99', 'hinata.hyuga@example.com', '2235987654', 1),
('M0010', '03', '03', '01', '30012345', 'Minato', 'Namikaze', 'M', 'Argentino', '1980-01-25', 'Konoha 100', 'minato@example.com', '2235000000', 1),
('M0011', '04', '04', '01', '28546789', 'Kushina', 'Uzumaki', 'F', 'Argentino', '1982-07-01', 'Calle Ninja 101', 'kushina@example.com', '2235111111', 1),
('M0012', '02', '02', '01', '29567890', 'Itachi', 'Uchiha', 'M', 'Argentino', '1987-06-09', 'Aldea Oculta 202', 'itachi@example.com', '2235222222', 1),
('M0013', '01', '01', '01', '27894561', 'Obito', 'Uchiha', 'M', 'Argentino', '1988-02-10', 'Aldea Oculta 303', 'obito@example.com', '2235333333', 1),
('M0014', '05', '05', '01', '26543210', 'Madara', 'Uchiha', 'M', 'Argentino', '1975-12-24', 'Aldea Secreta 404', 'madara@example.com', '2235444444', 1),
('M0015', '01', '01', '01', '31098765', 'Jiraiya', 'Sannin', 'M', 'Argentino', '1952-11-11', 'Monte Myoboku 505', 'jiraiya@example.com', '2235555555', 1)
 
 update Medicos set Estado_Me = 1 where Medicos.Estado_Me = 0

INSERT INTO Pacientes (Nombre_Pa, Apellido_Pa, DniPaciente_Pa, Sexo_Pa, Edad_Pa, IdLocalidad_Pa, IdProvincia_Pa, Nacionalidad_Pa, FechaNacimiento_Pa, Direccion_Pa, CorreoElectronico_Me, Telefono_Pa, Asistencia_Pa, Observacion_Pa, Estado_Pa)
VALUES 
('María', 'López', '10101010', 'F', 30, '01', '01', 'Argentina', '1994-03-12', 'Calle 1', 'maria.lopez@gmail.com', '1111111111', 1, 'Ninguna', 1),
('Jorge', 'Gomez', '20202020', 'M', 40, '02', '02', 'Argentina', '1983-08-24', 'Calle 2', 'jorge.gomez@gmail.com', '2222222222', 1, 'Hipertensión', 1),
('Luciana', 'Perez', '30303030', 'F', 25, '03', '03', 'Argentina', '1998-11-05', 'Calle 3', 'luciana.perez@gmail.com', '3333333333', 1, 'Diabetes', 1),
('Raul', 'Martinez', '40404040', 'M', 50, '04', '04', 'Argentina', '1973-02-15', 'Calle 4', 'raul.martinez@gmail.com', '4444444444', 1, 'Asma', 1),
('Ana', 'Sanchez', '50505050', 'F', 60, '05', '05', 'Argentina', '1963-07-20', 'Calle 5', 'ana.sanchez@gmail.com', '5555555555', 1, 'Alergia', 1),
('Carlos', 'Fernández', '60606060', 'M', 35, '06', '06', 'Argentina', '1988-05-18', 'Calle 6', 'carlos.fernandez@gmail.com', '6666666666', 1, 'Sin observaciones', 1),
('Sofía', 'Ramírez', '70707070', 'F', 28, '07', '07', 'Argentina', '1995-09-23', 'Calle 7', 'sofia.ramirez@gmail.com', '7777777777', 1, 'Migraña', 1),
('Diego', 'Torres', '80808080', 'M', 45, '08', '08', 'Argentina', '1978-03-14', 'Calle 8', 'diego.torres@gmail.com', '8888888888', 1, 'Hipertensión', 1),
('Valeria', 'Morales', '90909090', 'F', 32, '09', '09', 'Argentina', '1991-01-30', 'Calle 9', 'valeria.morales@gmail.com', '9999999999', 1, 'Sin observaciones', 1),
('Luis', 'Castro', '10111213', 'M', 55, '10', '10', 'Argentina', '1968-06-11', 'Calle 10', 'luis.castro@gmail.com', '1010101010', 1, 'Problemas cardíacos', 1),
('Martín', 'Suárez', '11121314', 'M', 42, '11', '11', 'Argentina', '1981-02-28', 'Calle 11', 'martin.suarez@gmail.com', '1112131415', 1, 'Colesterol alto', 1),
('Laura', 'Gutiérrez', '12131415', 'F', 38, '12', '12', 'Argentina', '1985-04-12', 'Calle 12', 'laura.gutierrez@gmail.com', '1213141516', 1, 'Asma leve', 1),
('Javier', 'Ortiz', '13141516', 'M', 29, '13', '13', 'Argentina', '1994-11-09', 'Calle 13', 'javier.ortiz@gmail.com', '1314151617', 1, 'Sin observaciones', 1),
('Camila', 'Blanco', '14151617', 'F', 34, '14', '14', 'Argentina', '1989-07-25', 'Calle 14', 'camila.blanco@gmail.com', '1415161718', 1, 'Migraña crónica', 1),
('Fernando', 'Medina', '15161718', 'M', 47, '15', '15', 'Argentina', '1976-05-19', 'Calle 15', 'fernando.medina@gmail.com', '1516171819', 1, 'Diabetes tipo 2', 1);
Go



								--PROCEDIMIENTOS ALMACENADOS--

--INSERTAR DIAS LABORABLES--
CREATE OR ALTER PROCEDURE sp_InsertarDiasLaborales
    @LegajoMedico CHAR(5),
    @Mes INT,
    @Semana INT, -- Número del día (lunes = 1, martes = 2, etc.)
    @HoraInicio TIME(0),
    @HoraFin TIME(0)
AS
BEGIN
    DECLARE @Fecha DATE;
    DECLARE @FechaInicioMes DATE;
    DECLARE @FechaFinalMes DATE;
    DECLARE @DiaSemanaFecha INT;
    DECLARE @HoraActual TIME(0);
    DECLARE @SiguienteHora TIME(0);
    DECLARE @Anio INT;

    -- Determinar el año según el mes
    IF @Mes BETWEEN 1 AND 10 -- Enero a octubre
        SET @Anio = 2025;
    ELSE -- Noviembre y diciembre
        SET @Anio = 2024;

    -- Obtener el primer y último día del mes
    SET @FechaInicioMes = DATEFROMPARTS(@Anio, @Mes, 1);
    SET @FechaFinalMes = EOMONTH(@FechaInicioMes);

    -- Iterar por cada día del mes
    SET @Fecha = @FechaInicioMes;
    WHILE @Fecha <= @FechaFinalMes
    BEGIN
        -- Obtener el número del día de la semana (lunes = 1)
        SET @DiaSemanaFecha = DATEPART(WEEKDAY, @Fecha);

        -- Insertar datos si el día coincide
        IF @DiaSemanaFecha = @Semana
        BEGIN
            -- Inicializar la hora actual
            SET @HoraActual = @HoraInicio;

            -- Bucle para insertar los intervalos horarios
            WHILE @HoraActual < @HoraFin
            BEGIN
                -- Calcular la siguiente hora
                SET @SiguienteHora = DATEADD(HOUR, 1, @HoraActual);

                -- Insertar un intervalo de tiempo
                INSERT INTO DiasLaborales (LegajoMedico_DL, Seman_DL, Dia_DL, IdMes_DL, HoraInicio_DL, HoraFinal_DL)
                VALUES
                (@LegajoMedico, DATENAME(WEEKDAY, @Fecha), @Fecha, @Mes, @HoraActual, @SiguienteHora);

                -- Avanzar al siguiente intervalo
                SET @HoraActual = @SiguienteHora;
            END;
        END;

        -- Incrementar el día
        SET @Fecha = DATEADD(DAY, 1, @Fecha);
    END;
END;
GO




/*EXEC sp_InsertarDiasLaborales 
    @LegajoMedico = 'M0004',
    @Mes = 12, 
    @Semana = 'Lunes',
    @HoraInicio = '08:00:00',
    @HoraFin = '17:00:00';
	select *from DiasLaborales
	delete  from DiasLaborales*/
	EXEC sp_InsertarDiasLaborales 
    @LegajoMedico = 'M0005',
    @Mes = 12,
    @Semana = 1, -- Lunes
    @HoraInicio = '09:00:00',
    @HoraFin = '17:00:00';
	go
--ALTA MEDICO--

CREATE OR ALTER PROCEDURE sp_InsertarMedico
    @Legajo char(5),
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Dni varchar(8),
    @Sexo CHAR(1),
    @Telefono varchar(20),
    @CorreoElectronico varchar(100),
    @Direccion varchar(100),
    @Nacionalidad varchar(50),
    @Provincia char(2),
    @Localidad char(2),
    @Especialidad char(2),
    @FechaNacimiento DATE
AS
BEGIN
    INSERT INTO Medicos (
        Legajo_Me, Nombre_Me, Apellido_Me, Dni_Me, Sexo_Me, Telefono_Me, 
        CorreoElectronico_Me, Direccion_Me, Nacionalidad_Me, IdProvincia_Me, 
        IdLocalidad_Me, IdEspecialidad_Me, FechaNacimiento_Me)
    VALUES (
        @Legajo, @Nombre, @Apellido, @Dni, @Sexo, @Telefono, 
        @CorreoElectronico, @Direccion, @Nacionalidad, @Provincia, 
        @Localidad, @Especialidad, @FechaNacimiento);
END;
Go

--MODIFICAR Y BAJA LOGICA DE PACIENTE --


CREATE OR ALTER  PROCEDURE sp_ModificarEstadoPaciente
    @DNI varchar(8)

AS
BEGIN
    UPDATE Pacientes
    SET Estado_Pa = 0
       
    WHERE DniPaciente_Pa = @DNI
END;
Go

--BAJA LOGICA TURNO--

CREATE PROCEDURE sp_bajaLogicaTurno
(
@IDTURNO INT
)
AS
BEGIN
UPDATE Turnos
SET Estado_Tr =  0
WHERE  IdTurno_Tr = @IDTURNO
END
RETURN
GO


-----Despues de dar la baja a un turno ese turno en dias laborables vulve  a estar disponible  pasa usarlo

CREATE TRIGGER trg_UpdateDiasLaboralesEstadoDespuesDeBajaTurno
ON Turnos
AFTER UPDATE
AS
BEGIN
  
    UPDATE DiasLaborales     set  DiaActivo_DL = 1     FROM DiasLaborales    INNER JOIN Inserted 
	ON DiasLaborales.IdDiaLaborable_DL = Inserted.idDiasLaborales
END;
GO
--BAJA LOGICA MEDICO--

CREATE PROCEDURE sp_BajaLogicaMedico
(
@LEGAJOMEDICO CHAR(5)
)
AS
BEGIN
UPDATE Medicos
SET Estado_Me =  0
WHERE Legajo_Me = @LEGAJOMEDICO
END
RETURN
Go

--ALTA PACIENTE--

CREATE OR ALTER PROC sp_CargaPaciente
    @Nombre_Pa VARCHAR(50),
    @Apellido_Pa VARCHAR(50),
    @DniPaciente_Pa VARCHAR(8),
    @Sexo_Pa CHAR(1),
    @Edad_Pa TINYINT,
    @IdLocalidad_Pa CHAR(2),
    @IdProvincia_Pa CHAR(2),
    @Nacionalidad_Pa VARCHAR(50),
    @FechaNacimiento_Pa DATE,
    @Direccion_Pa VARCHAR(100),
    @CorreoElectronico_Me VARCHAR(100),
    @Telefono_Pa VARCHAR(20)    
AS
BEGIN
    INSERT INTO Pacientes (
        Nombre_Pa,
        Apellido_Pa,
        DniPaciente_Pa,
        Sexo_Pa,
        Edad_Pa,
        IdLocalidad_Pa,
        IdProvincia_Pa,
        Nacionalidad_Pa,
        FechaNacimiento_Pa,
        Direccion_Pa,
        CorreoElectronico_Me,
        Telefono_Pa        
    )
    VALUES (
        @Nombre_Pa,
        @Apellido_Pa,
        @DniPaciente_Pa,
        @Sexo_Pa,
        @Edad_Pa,
        @IdLocalidad_Pa,
        @IdProvincia_Pa,
        @Nacionalidad_Pa,
        @FechaNacimiento_Pa,
        @Direccion_Pa,
        @CorreoElectronico_Me,
        @Telefono_Pa
    );
END;
Go

-- MODIFICAR PACIENTE

CREATE  PROCEDURE sp_ModificarPaciente

     @DniPaciente_Pa VARCHAR(8),
     @Apellido_Pa VARCHAR(50),
     @Nombre_Pa VARCHAR(50),
     @Sexo_Pa CHAR(1),
	 @Edad_Pa TINYINT,
     @Telefono_Pa VARCHAR(20),    
     @Direccion_Pa VARCHAR(100),
    @Nacionalidad_Pa VARCHAR(50),
	 @IdProvincia_Pa CHAR(2),
    @IdLocalidad_Pa CHAR(2),
	@CorreoElectronico_Me VARCHAR(100)
	AS
	BEGIN
	    UPDATE Pacientes  set
		 Nombre_Pa= @Nombre_Pa,
		Apellido_Pa=  @Apellido_Pa,
        Sexo_Pa=     @Sexo_Pa,
		 Edad_Pa= @Edad_Pa,
		 IdLocalidad_Pa=  @IdLocalidad_Pa,
        IdProvincia_Pa=   @IdProvincia_Pa,
		 Nacionalidad_Pa=   @Nacionalidad_Pa, 
		Direccion_Pa=     @Direccion_Pa,
        CorreoElectronico_Me=@CorreoElectronico_Me,
		Telefono_Pa =  @Telefono_Pa      
		where  DniPaciente_Pa=   @DniPaciente_Pa;
            return
			END;
			GO

--Modificar Medico
CREATE OR ALTER PROCEDURE sp_ModificarMedico
		@Legajo_Me char(5),
		@IdEspecialidad_Me char(2),
		@IdLocalidad_Me char(2),
		@IdProvincia_Me char(2),
		@Dni_Me varchar(8),
		@Nombre_Me varchar(50),
		@Apellido_Me varchar(50),
		@Sexo_Me CHAR(1), 
		@Nacionalidad_Me varchar(50),
		@FechaNacimiento_Me DATE,
		@Direccion_Me varchar(100),
		@CorreoElectronico_Me varchar(100),
		@Telefono_Me varchar(20)
AS
BEGIN
	UPDATE Medicos
	SET
		IdEspecialidad_Me=@IdEspecialidad_Me,
		IdLocalidad_Me=@IdLocalidad_Me,
		IdProvincia_Me=@IdProvincia_Me,
		Dni_Me=@Dni_Me,
		Nombre_Me=@Nombre_Me,
		Apellido_Me=@Apellido_Me,
		Sexo_Me=@Sexo_Me, 
		Nacionalidad_Me=@Nacionalidad_Me,
		FechaNacimiento_Me=@FechaNacimiento_Me,
		Direccion_Me=@Direccion_Me,
		CorreoElectronico_Me=@CorreoElectronico_Me,
		Telefono_Me=@Telefono_Me
	WHERE Legajo_Me = @Legajo_Me;
	RETURN
END;
go

--AlTA NUEVO USUARIO
CREATE OR ALTER PROCEDURE sp_InsertarNuevoUsuario
    
    @Legajo CHAR(5),   
    @Nombre VARCHAR(8),
    @Contrasenia VARCHAR(8),  
    @Rol CHAR(1)        
AS
BEGIN
   
    INSERT INTO Usuarios (
 
        Legajo_Usu,
        Nombre_Usu,
        Contrasenia_Usu,
        Rol_Usu
    )
    VALUES (
    
        @Legajo,
        @Nombre,
        @Contrasenia,
        @Rol
    );
END;
GO

--alta turnos 
CREATE  or alter PROCEDURE sp_InsertarTurnos
   @idDiasLaborales INT,
    @LegajoMedico CHAR(5),
    @IdEspecialidad VARCHAR(30),
    @NombreMedico VARCHAR(50),
    @DniPaciente VARCHAR(8),
    @FechaTurno VARCHAR(10),
    @Horario VARCHAR(5)
 AS
BEGIN
       INSERT INTO Turnos (
        idDiasLaborales,
        LegajoMedico_Tr,
        IdEspecialidad_Tr,
        nombreMedico,
        DniPaciente_Tr,
        FechaTurno_Tr,
        Horario_Tr
          
    )
    VALUES (
        @idDiasLaborales,
        @LegajoMedico,
        @IdEspecialidad,
        @NombreMedico,
        @DniPaciente,
        @FechaTurno,
        @Horario

    );
END;
GO

--turnos da de baja la disponibilidad del turno.

CREATE TRIGGER trg_UpdateDiasLaboralesEstado
ON Turnos
AFTER INSERT
AS
BEGIN
  
    UPDATE DiasLaborales     set  DiaActivo_DL = 0     FROM DiasLaborales    INNER JOIN Inserted 
	ON DiasLaborales.IdDiaLaborable_DL = Inserted.idDiasLaborales
END;
GO
--------------------------- SP INFORMES  --------------------------------
-------- ASISTENCIAS
CREATE OR ALTER PROCEDURE sp_InformeAsistencias
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @asistencia VARCHAR;
DECLARE @porcentajeAsistencia INT;
DECLARE @inasistencia INT;
DECLARE @porcentajeInasistencia FLOAT;
DECLARE @total INT;

set DATEFORMAT DMY
SET LANGUAGE English

SET @total = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @asistencia = (SELECT COUNT(Turnos.Asistencia_Tr) FROM Turnos
WHERE Turnos.Asistencia_Tr = 'P'
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @inasistencia = (SELECT COUNT(Turnos.Asistencia_Tr) FROM Turnos
WHERE Turnos.Asistencia_Tr = 'A' 
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

IF @total > 0
	BEGIN
		SET @porcentajeAsistencia = (@asistencia * 100) / @total;
		SET @porcentajeInasistencia = (@inasistencia * 100) / @total;
	END
ELSE
	BEGIN
		SET @porcentajeAsistencia = 0;
		SET @porcentajeInasistencia = 0;
	END
END
SELECT @porcentajeAsistencia AS ASISTENCIAS, @porcentajeInasistencia AS INASISTENCIAS
GO

EXEC sp_InformeAsistencias '2024-12-09', '2024-12-18'
EXEC sp_InformeEdades'2024-12-03', '2024-12-18'
EXEC sp_InformeSexo '2024-12-03', '2024-12-18'
EXEC sp_InformeHorarios '2024-12-03', '2024-12-18'
go
------------ SEXO
CREATE OR ALTER PROCEDURE sp_InformeSexo
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @fem INT;
DECLARE @porcentajeF FLOAT;
DECLARE @masc INT;
DECLARE @porcentajeM FLOAT;
DECLARE @total INT;

set DATEFORMAT DMY
SET @total = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @fem = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Sexo_Pa = 'F'
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @masc = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Sexo_Pa = 'M'
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

IF @total > 0
	BEGIN
		SET @porcentajeF = (@fem * 100) / @total
		SET @porcentajeM = (@masc * 100) / @total
	END
ELSE
	BEGIN
		SET @porcentajeF = 0
		SET @porcentajeM = 0
	END
END
SELECT @porcentajeF AS FEMENINO, @porcentajeM AS MASCULINO
GO

-------------- EDADES
CREATE OR ALTER PROCEDURE sp_InformeEdades
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @20 INT;
DECLARE @40 INT;
DECLARE @60 INT;
DECLARE @80 INT;
DECLARE @100 INT;
DECLARE @total INT;
set DATEFORMAT DMY

SET @total = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @20 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 0 AND 19
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @40 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 20 AND 39
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @60 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 40 AND 59
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @80 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 60 AND 79
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @100 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa >= 80
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SELECT @20 AS '0-19', @40 AS '20-39', @60 AS '40-59', @80 AS '60-79', @100 AS '80+'
END
GO

------------------ HORARIOS 
CREATE OR ALTER PROCEDURE sp_InformeHorarios
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @6 INT;
DECLARE @7 INT;
DECLARE @8 INT;
DECLARE @9 INT;
DECLARE @10 INT;
DECLARE @11 INT;
DECLARE @12 INT;
DECLARE @13 INT;
DECLARE @14 INT;
DECLARE @15 INT;
DECLARE @16 INT;
DECLARE @17 INT;
DECLARE @18 INT;
DECLARE @19 INT;
DECLARE @20 INT;
DECLARE @21 INT = 0;


SET @6 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '06:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '07:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @7 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '07:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '08:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @8 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '08:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '09:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @9 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '09:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '10:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @10 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '10:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '11:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @11 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '11:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '12:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @12 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '12:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '13:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @13 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '13:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '14:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @14 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '14:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '15:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @15 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '15:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '16:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @16 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '16:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '17:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @17 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '17:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '18:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @18 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '18:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '19:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @19 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '19:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '20:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @20 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '20:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '21:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SELECT @6 AS 'Hora_6', @7 AS 'Hora_7', @8 AS 'Hora_8', @9 AS 'Hora_9', @10 AS 'Hora_10', @11 AS 'Hora_11', 
@12 AS 'Hora_12', @13 AS 'Hora_13', @14 AS 'Hora_14', @15 AS 'Hora_15', @16 AS 'Hora_16', @17 AS 'Hora_17', @18 AS 'Hora_18', 
@19 AS 'Hora_19', @20 AS 'Hora_20', @21 AS 'Hora_21'
END
GO

EXEC sp_InformeAsistencias '2024-12-09', '2024-12-18'

EXEC sp_InformeSexo '2024-12-09', '2024-12-18'
go
-------------MEdico_Turno edicicon de campos asisitencia y observacion
CREATE or alter  PROCEDURE sp_ActualizarTurno
    @IdTurno INT,
    @Asistencia CHAR(1),
    @Observacion TEXT
AS
BEGIN
 
    UPDATE Turnos
    SET 
        Asistencia_Tr = @Asistencia, 
        Observacion_Tr = @Observacion
    WHERE 
        IdTurno_Tr = @IdTurno;     
END;
go


--select* from  Usuarios

--select Turnos.IdTurno_Tr , Turnos.IdEspecialidad_Tr, Pacientes.Nombre_Pa, Pacientes.Apellido_Pa, Turnos.FechaTurno_Tr, Turnos.Horario_Tr,Turnos.Asistencia_Tr,  Turnos.Observacion_Tr  from Turnos  inner join  Usuarios on Usuarios.Legajo_Usu= Turnos.LegajoMedico_Tr inner join Pacientes on Turnos.DniPaciente_Tr= Pacientes.DniPaciente_Pa where Usuarios.Contrasenia_Usu= 'pass202' and Usuarios.Nombre_Usu='Taylor'


