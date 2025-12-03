# Strings

Move no tiene un tipo embutido para representar strings, pero tiene dos implementaciones estándar para strings en la Biblioteca Estándar. El módulo `std::string` define un tipo `String` y métodos para strings codificadas en `UTF-8`, y el segundo módulo, `std::ascii`, proporciona un tipo `String ASCII` y sus métodos.

Puedes encontrar más información sobre strings y sus métodos en la [documentación oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/string.md) de Sui Core.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/06_strings
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
BUILDING Strings
Running Move unit tests
[debug] 0x48656c6c6f20576f726c6421
[debug] "Hello World!"
[debug] 0x48656c6c6f20576f726c6421
[debug] "Hello World!"
[debug] true
[debug] "Hola"
[debug] "HolaAdios"
[debug] "HolaAdiosHello World!"
[debug] "HolINSERTAR-MEAdiosHello World!"
[debug] "HolINSERTAR-MEAdiosHello World!
Esto sera impreso en una nueva linea."
[ PASS    ] suiz3::strings::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### Las strings son bytes

Independientemente del tipo de string que utilices, es importante saber que las strings son solo bytes. Los *wrappers* proporcionados por los módulos `string` y `ascii` son solo eso: envoltorios. Proporcionan verificaciones de seguridad y métodos para trabajar con strings, pero, al final de cuentas, no son más que vectores de bytes.

### Strings UTF-8

Aunque existen dos tipos de strings en la biblioteca estándar, el módulo `string` debe ser considerado el estándar. Tiene implementaciones nativas de muchas operaciones comunes y, por lo tanto, es más eficiente que el módulo `ascii`, que está totalmente implementado en Move.

Las strings de bytes son literales de string entre comillas precedidos por un `b`, por ejemplo `b"¡Hola!\n"`.

```rust
let hello: String = string::utf8(b"¡Hola!");
```

Se trata de strings codificadas en ASCII que soportan secuencias de escape. Actualmente, las secuencias de escape soportadas son:

|Secuencia|Descripción|
|---|---|
|\n|Nueva línea|
|\r|Retorno de carro|
|\t|Tabulación|
|\\ |Barra invertida|
|\0|Valor `null`|
|\"|Comillas|
|\xHH|Escape hexadecimal. Agrega la secuencia hexadecimal `HH`|

### Strings hexadecimales

Las strings hexadecimales son literales de string entre comillas precedidos por un `x`, por ejemplo `x"48656C6C6F210A"`.

Cada par de bytes, de `00` a `FF`, se interpreta como un valor `u8` codificado en hexadecimal. Así, cada par de bytes corresponde a una sola entrada en el `vector<u8>` resultante.

> :information_source: Recuerda que puedes encontrar más información sobre las strings y sus métodos en la [documentación oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/string.md) de Sui Core.

## Leyendo los recursos del tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/strings.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

## Desafío

* Crea una string con un poema de 4 líneas **en una sola variable**. Puedes usar el siguiente como ejemplo:
    ```
    Te vi un punto y, flotando ante mis ojos,
    la imagen de tus ojos se quedó,
    como la mancha oscura orlada en fuego
    que flota y ciega si se mira al sol.
    ```
    > :warning: Recuerda que el código Move **no** puede tener acentos o caracteres especiales.
* Ahora crea 4 variables, una para cada línea, y concaténalas en una sola variable final.
* Imprime ambas variables.
* Responde: ¿Cuál de los dos métodos crees que es mejor y por qué?

> :information_source: Recuerda guardar tus cambios en el archivo para posteriormente hacer el `push` a tu repositorio de **Github**.
