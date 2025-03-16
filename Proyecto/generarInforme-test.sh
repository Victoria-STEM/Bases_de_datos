#!/bin/bash

## Configuración de la base de datos
DB_USER="root"
DB_PASSWORD="1234"
DB_HOST="localhost"
DB_NAME="employees"

## Validación de argumentos
if [ $# -ne 2 ]; then
  echo "Uso: $0 <AÑO> <MES>"
  exit 1
fi

YEAR=$1
MONTH=$2
FILE_NAME="informe_${YEAR}_${MONTH}.md"


## Generar archivo Markdown
printf "# Informe generado para ${YEAR}-${MONTH}

" > $FILE_NAME

## CONSULTA 5. Gasto total en el pago de salarios (con cotizaciones). ----------------------------------------
printf "## Gasto total en salarios (con cotizaciones)

" >> $FILE_NAME
printf "| Mes | Gasto Total |
" >> $FILE_NAME
printf "| --- | ----------- |
" >> $FILE_NAME

LASTYEAR=$((YEAR - 1))
QUERY="SELECT 
        DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
        COUNT(*) as numero_empleados
    FROM salaries s
    JOIN employees e ON s.emp_no = e.emp_no
    WHERE s.from_date <= '${LASTYEAR}-${MONTH}-01' AND s.to_date >= '${YEAR}-${MONTH}-01'
    GROUP BY mes
    ORDER BY mes;"
mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME -N -e "$QUERY" | sed 's/	/|/g; s/^/|/; s/$/|/' >> $FILE_NAME


## Confirmación de generación
echo "Informe generado con éxito en $FILE_NAME"