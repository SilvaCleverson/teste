# Condicionales

Las funciones condicionales se usan para tomar decisiones en un programa. Pueden ejecutar bloques de código dependiendo del resultado o evaluar condiciones para continuar o abortar la ejecución de un módulo.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/04_condicionales
>```

Accede a tu terminal y ejecuta el siguiente comando:

```sh
sui move test
```

Debes obtener el siguiente resultado:
```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Condicionais
Running Move unit tests
[debug] "a es mayor que 0"
[debug] "a no es mayor que 20"
[debug] 10
[debug] "Usuario tiene acceso."
[ PASS    ] suiz3::condicionais::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### If Else

La expresión `if` se usa para tomar decisiones en un programa. Evalúa una expresión booleana y ejecuta un bloque de código si la expresión es verdadera. Junto con `else`, puede ejecutar un bloque de código diferente si la expresión es falsa.

La sintaxis de la expresión if es:

```rust
if (<expressao_bool>) <expressao>;
```
```rust
if (<expressao_bool>) <expressao> else <expressao>;
```

o

```rust
if (<expressao_bool>) {
  <expressao>
};
```
```rust
if (<expressao_bool>) {
  <expressao>
} else {
  <expressao>
};
```

### Abort

La palabra clave `abort` se usa para abortar la ejecución de una función. Se usa junto con un código de aborto, que será retornado a quien llama la función. El código de aborto es un entero del tipo `u64`.

```rust
if (<expressao_bool>) {
  abort <codigo_de_erro>
};
```
o
```rust
if (<expressao_bool>) {
  abort(<codigo_de_erro>)
};
```

### Assert

`assert!` es una macro que puede ser usada para afirmar una condición. Si la condición es falsa, la ejecución de la función será cancelada con el código de aborto proporcionado. La macro `assert!` es una forma práctica de abortar una función si una condición no se cumple. La macro acorta el código que, de otra forma, sería escrito con una expresión `if` + `abort`. El argumento del código es obligatorio y debe ser un valor `u64`.

```rust
assert!(<expressao_bool>, <codigo_de_erro>);
```

### Códigos de error

Para hacer los códigos de error más descriptivos, es una buena práctica definir **constantes de error**. Se definen como declaraciones `const` y generalmente son prefijadas con `E` seguido por un nombre en `camel case`. Las **constantes de error** no son diferentes de otras constantes y no tienen tratamiento especial, sin embargo, se usan para aumentar la legibilidad del código y facilitar la comprensión de los escenarios de aborto.

```rust
const ECodigoDeErro: u64 = <codigo_de_erro>;
```
o
```rust
const ECodigoDeErro1: u64 = 1;
const ECODIGO_DE_ERRO_2: u64 = 2;
```

## Leyendo los recursos del tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/condicionales.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

## Desafío

* Crea una constante de error con el valor que desees para indicar que el usuario es menor de edad.
* Crea una variable que represente una edad.
* Evalúa esta variable en un bloque condicional usando `if` y `else`:
  * Si el usuario es mayor de edad, imprime un mensaje para informarle de que puede acceder al contenido de tu programa.
  * Si el usuario **no** es mayor de edad, aborta la ejecución enviando el código de error que creaste al inicio.
* Haz esa misma evaluación usando `assert`. Recuerda que `assert` no retorna ningún mensaje, pero retorna un número como código de error.

> :information_source: Recuerda guardar tus cambios en el archivo para posteriormente hacer el `push` a tu repositorio de **Github**.
