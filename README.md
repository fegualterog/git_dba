# git_dba
Prueba DBA: modelo de datos.

Una prestigiosa universidad requiere de un sistema que permita realizar el pago de
matrículas a los estudiantes. Los pagos son realizados mediante la generación de un recibo
de pago y debe permitir pagos en línea (pagos online) o por ventanilla para el semestre que
inicia.


Adicionalmente el sistema debe permitir:

• Generar recibo de pago de matrícula con los siguientes conceptos a pagar: Carné,
Matrícula, descuento de pronto pago.

• Configurar el periodo de apertura y de cierre de pago de matrículas y el periodo de
vigencia del descuento de pronto pago.

• Cada carrera presenta un valor diferente de matrícula para el semestre.
• El estudiante debe poder cursar dos carreras al mismo tiempo.


El modelo de datos que se implemento cuenta con 8 tablas:

- ESTUDIANTE
- TIPODOCUMENTO
- CARRERAS
- TIPOPROGRAMA
- MATRICULAS
- ESTADOMATRICULA
- TIPOPAGO
- SEMESTRE


A continuación una breve descripción de cada tabla:

ESTUDIANTE: Tiene almacenada la información básica de cada estudiante como lo es nombre, apellido, tipo de documento, número documento, fecha de nacimiento y fecha del registro del estudiante.

TIPODOCUMENTO: Tiene almacenada la información de los tipos de documento, su alias, y la fecha en que se registró la información.

CARRERAS: Tiene almacenada la información de la facultad, programa, tipo de programa, valor del semestre y fecha en que se registró la información.

TIPOPROGRAMA: Tiene almacenada la información de los tipos de programa como lo son pregrado, postgrado, maestría, doctorado, diplomado, y la fecha en que se registro la información.

MATRICULAS: Tiene almacenada la información de todos los recibos de pago generados y su estado. Por medio de las relaciones a otras tablas desde la tabla matricula es posible determinar la información de:
- Estudiante
- Carrera del estudiante.
- Estado de la matrícula (pendiente, pago, anulado).
- Semestre (periodo cursado).
- Indicador de cobro de carnet (1 para hacer cobro del carnet en el recibo) y valor del carnet.
- Valor de la matrícula.
- Descuento del valor de la matrícula por pronto pago.
- Link de pago online.
- Tipo de pago del recibo (ventanilla o pago online).
- Referencia y valor del pago.
- fecha límite de pago y de pronto pago
- Fecha de generación del recibo.


ESTADOMATRICULA: Tiene almacenada la información de los estados de las matrículas (pendiente, pago, anulado).

TIPOPAGO: Tiene almacenada la información del modo de pago (pago online o ventanilla).

SEMESTRE: Es la tabla de configuración de los periodos, en los cuales es posible especificar el periodo, fecha de límite de pago, fecha de pronto pago, porcentaje de descuento por pronto pago y valor del carnet para el periodo.



NOTA: Se implementó un trigger en la tabla MATRICULAS que actualiza el valor del carnet (si aplica), valor de descuento por pronto pago (según porcentaje configurado en el periodo), fecha límite de pago y fecha límite de pronto pago.





La Query que permite determinar cuantos estudiantes por periodo estan cursando semestre (matricula paga).

select 
date_format(M.MATR_FECHAREGISTRO, '%Y') as 'AÑO',
M.SEM_ID AS 'SEMESTRE', 
C.CARR_PROGRAMA AS 'PROGRAMA', 
count(*) as 'TOTAL' 

from MATRICULAS M
inner join CARRERAS C on (M.CARR_ID=C.CARR_ID)
inner join ESTADOMATRICULA EM on (EM.ESTMATR_ID=M.ESTMATR_ID)
where 

EM.ESTMATR_DESCRIPCION = 'PAGO'

group by date_format(M.MATR_FECHAREGISTRO, '%Y'), M.SEM_ID, M.CARR_ID;



select 
date_format(M.MATR_FECHAREGISTRO, '%Y') as 'AÑO',
M.SEM_ID AS 'SEMESTRE',
C.CARR_PROGRAMA AS 'PROGRAMA',
count(*) as 'TOTAL' 
from MATRICULAS M
inner join CARRERAS C on (M.CARR_ID=C.CARR_ID)
where 
M.ESTMATR_ID = 2 -- id 2 es PAGO
group by date_format(M.MATR_FECHAREGISTRO, '%Y'), M.SEM_ID, M.CARR_ID;

Respuesta de la consulta:

# AÑO, SEMESTRE, PROGRAMA, TOTAL
'2019', '1', 'FISICA', '1'
'2020', '1', 'SISTEMAS', '1'
'2021', '1', 'SISTEMAS', '1'
'2021', '1', 'FISICA', '1'
'2021', '2', 'SISTEMAS', '1'
'2021', '2', 'ESTADISTICA', '2'
