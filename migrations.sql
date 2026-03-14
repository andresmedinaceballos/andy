-- Database migrations for HRMS Application

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE registros_patronales (
    id SERIAL PRIMARY KEY,
    numero_registro VARCHAR(50) NOT NULL,
    departamento_id INT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE centros_trabajo (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE turnos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    departamento_id INT NOT NULL,
    registro_patronal_id INT NOT NULL,
    centro_trabajo_id INT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id),
    FOREIGN KEY (registro_patronal_id) REFERENCES registros_patronales(id),
    FOREIGN KEY (centro_trabajo_id) REFERENCES centros_trabajo(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE expediente_empleados (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    documentacion JSONB,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documentos_empleados (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    tipo_documento VARCHAR(100) NOT NULL,
    ruta_documento VARCHAR(255) NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bitacora_imss (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    evento VARCHAR(255) NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alertas_sbc (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    alerta VARCHAR(255) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

CREATE TABLE solicitudes_vacaciones (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE faltas (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dias_festivos (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE auditoria (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    accion VARCHAR(255) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

CREATE TABLE permisos (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    tipo_permiso VARCHAR(100) NOT NULL,
    fecha_otorgado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);
