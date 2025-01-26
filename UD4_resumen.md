# Resumen Unidad 4

Seleccionar con SELECT:
```bash
SELECT * FROM nombre_tabla;
```

Resultados únicos DISTINCT:
```bash
SELECT DISTINCT departamento FROM empleados WHERE salario > 3000;

# Es posible combinar DISTINCT con condiciones complejas usando operadores lógicos como AND, OR y NOT.
SELECT DISTINCT departamento FROM empleados WHERE salario > 3000 AND ciudad = 'Madrid';
```

### Operadores de comparacion:
- `=` Igual a: Devuelve los registros donde el valor de la columna es exactamente igual al valor especificado.
- `!=` o `<>`  Diferente de: Devuelve los registros donde el valor de la columna es distinto al valor especificado.
- `>`  Mayor que: Devuelve los registros donde el valor de la columna es mayor que el valor indicado.
- `<`  Menor que: Devuelve los registros donde el valor de la columna es menor que el valor especificado.
- `>=`  Mayor o igual que: Devuelve los registros donde el valor de la columna es mayor o igual al valor indicado.
- `<=`  Menor o igual que: Devuelve los registros donde el valor de la columna es menor o igual al valor especificado.

### AND, OR y NOT
AND – Ambas condiciones deben cumplirse para que el registro sea devuelto.
OR – Al menos una de las condiciones debe cumplirse.
NOT – Niega la condición especificada, devolviendo los registros donde la condición no se cumple.
```bash
SELECT * FROM empleados WHERE salario > 3000 AND edad < 40;
SELECT * FROM empleados WHERE departamento = 'Ventas' OR departamento = 'Marketing';
SELECT * FROM empleados WHERE NOT departamento = 'Recursos Humanos';
```

### Operadores de Patrón y Rango
El operador LIKE permite buscar valores que cumplan con patrones específicos. Es útil cuando no se conoce exactamente el valor a buscar o cuando se desea encontrar registros con una coincidencia parcial.

- `%` Representa cualquier número de caracteres (incluyendo cero caracteres).
- `_` Representa un solo carácter.

```bash
SELECT * FROM empleados WHERE nombre LIKE 'M%'; # Selecciona todos los empleados cuyos nombres comienzan con la letra 'M'.
SELECT * FROM clientes WHERE apellido LIKE '%ez'; # Devuelve clientes con apellidos que terminan en 'ez', como 'López' o 'Gómez'.
SELECT * FROM empleados WHERE nombre LIKE '%an%'; # Nombres que contienen 'an' en cualquier posición.
SELECT * FROM empleados WHERE nombre LIKE '___o'; # Nombres con cuatro letras y que terminan en 'o'.
```

## Prioridad de los operadores
Orden de Evaluación
- `Paréntesis`: Siempre primero.
- `NOT`: Se aplica antes que cualquier otro operador lógico.
- `AND`: Se evalúa después de NOT.
- `OR`: Se evalúa al final.

1. Usa paréntesis para controlar la prioridad: Esto mejora la claridad y reduce errores.
2. Recuerda la prioridad natural: `NOT` > `AND` > `OR`.
3. Prueba tus consultas: Ejecuta ejemplos simples para confirmar el comportamiento.