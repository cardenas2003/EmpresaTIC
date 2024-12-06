create database EmpresaTic;
use EmpresaTic;
#cristian david cardenas caballero
create table Cargo(
ID_cargo int auto_increment primary key,
Nombre varchar(60),
Descripcion varchar(150) not null,
salario float not null
);

create table Empleados (
ID_empleado int auto_increment primary key,
Nombre varchar(100) not null,
Apellido varchar(100) not null,
id_Cargo int not null,
Salario float not null,
foreign key (id_cargo) references Cargo(ID_cargo)
);

insert into Cargo (Nombre, Descripcion, Salario) VALUES 
('Gerente de Proyecto', 'Responsable de la gestión y ejecución del proyecto.', 4500.00),
('Analista de Sistemas', 'Encargado del análisis y diseño de sistemas informáticos.', 3000.00),
('Técnico en Soporte', 'Brinda soporte técnico y mantenimiento a los equipos.', 2000.00);

insert into Empleados (Nombre, Apellido, id_Cargo, Salario) VALUES 
('Carlos', 'Pérez', 1, 4500.00), 
('Ana', 'Gómez', 2, 3000.00),
('Luis', 'Martínez', 3, 2000.00),
('Cristian', 'Cardenas', '3', '7500000');

SELECT 
    Empleados.ID_empleado,
    Empleados.Nombre AS Nombre_Empleado,
    Empleados.Apellido AS Apellido_Empleado,
    Cargo.Nombre AS Nombre_Cargo,
    Empleados.Salario
FROM 
    Empleados
INNER JOIN 
    Cargo ON Empleados.id_Cargo = Cargo.ID_cargo;

SELECT * 
FROM Cargo;

SELECT * 
FROM Empleados
WHERE Salario > 7000000;

UPDATE Empleados
SET Salario = 6500000
WHERE Nombre = 'Ana' AND Apellido = 'Gómez';

DELETE FROM Empleados
WHERE Nombre = 'Luis' AND Apellido = 'Martínez';

SELECT 
    Empleados.ID_empleado,
    Empleados.Nombre AS Nombre_Empleado,
    Empleados.Apellido AS Apellido_Empleado,
    Cargo.Nombre AS Nombre_Cargo,
    Empleados.Salario
FROM 
    Empleados
INNER JOIN 
    Cargo ON Empleados.id_Cargo = Cargo.ID_cargo
WHERE 
    Cargo.Nombre = 'Desarrollador';
    
INSERT INTO Cargo (Nombre, Descripcion, Salario)
VALUES ('Asistente', 'Brinda apoyo en diversas actividades administrativas.', 3000000);

INSERT INTO Empleados (Nombre, Apellido, id_Cargo, Salario)
VALUES ('Marta', 'López', (SELECT ID_cargo FROM Cargo WHERE Nombre = 'Asistente'), 3010000);
