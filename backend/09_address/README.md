# Address

`address` es un identificador único de una ubicación en la blockchain. Se usa para identificar paquetes, cuentas y objetos. Un `address` tiene un tamaño fijo de 32 bytes y generalmente se representa como una cadena hexadecimal con el prefijo `0x`. Las direcciones no distinguen mayúsculas de minúsculas.

```
0xe51ff5cd221a81c3d6e22b9e670ddf99004d71de4f769b0312b68c7c4872e2f1
```

La dirección anterior es un ejemplo de un `address` válido. Tiene 64 caracteres (32 bytes) y el prefijo `0x`.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/09_address
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
BUILDING Address
Running Move unit tests
[debug] @0x1
[debug] @0xbebe
[debug] @0x42
[debug] @0x0
[debug] "0000000000000000000000000000000000000000000000000000000000000000"
[debug] @0xbebe
[ PASS    ] 0x5a6f6e612054726573::address::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/address.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

### Sintaxis

Las direcciones pueden ser numéricas o nombradas. La sintaxis de un `address` nombrado sigue las mismas reglas de cualquier identificador nombrado en **Move**. La sintaxis de una dirección numérica no está restringida a valores codificados en hexadecimal, y cualquier valor numérico `u256` válido puede ser usado como valor de dirección, por ejemplo, `42`, `0xBEBE` y `2024` son todos literales de dirección numérica válidos.

Para distinguir cuando una dirección se usa en un contexto de expresión o no, la sintaxis al usar una dirección difiere dependiendo del contexto en que se usa:

* Cuando una dirección se usa como expresión, debe ser precedida por el carácter `@`, es decir, `@<valor_numerico>` o `@<identificador_endereco_nomeado>`.
* Fuera de los contextos de expresión, la dirección puede ser escrita sin el carácter `@` inicial, es decir, `<valor_numerico>` o `<identificador_endereco_nomeado>`.

### Direcciones nombradas

Las direcciones nombradas son un recurso que permite el uso de identificadores en lugar de valores numéricos en cualquier lugar donde las direcciones se usan, y no solo a nivel del valor. Las direcciones nombradas se declaran y vinculan como elementos de nivel superior (fuera de módulos y paquetes) en los paquetes Move, o se pasan como argumentos para el compilador Move.

Las direcciones nombradas existen solo a nivel del lenguaje de origen y serán completamente sustituidas por su valor a nivel del bytecode. Por causa de esto, los módulos y los miembros de los módulos deben ser accedidos __a través de la dirección nombrada del módulo y no a través del valor numérico__ asignado a la dirección nombrada durante la compilación, por ejemplo, usar `meu_endereco::foo` no es equivalente a usar `0x2::foo` incluso si el programa Move se compila con `meu_endereco` definido como `0x2`.

### Operaciones de Almacenamiento Global

El principal propósito del `address` es interactuar con las operaciones del **almacenamiento de objetos**. Los `address` se usan con las operaciones `take`, `borrow`, `borrow_mut` y `transfer`.

### Sender

`sender` es un tipo de recurso en Move. Un `sender` permite que el titular **actúe** en nombre de una determinada dirección. Move puede crear cualquier valor de dirección sin ninguna permisión especial usando literales de `address`:

```move
let a1 = 0x1;
let a2 = 0x2;
// ...
```

Sin embargo, `sender` es especial porque no puedes crearlo usando literales o instrucciones, pero accedemos a este valor a través del contexto de una transacción.

## Desafío

Simplemente lee la documentación y asegúrate de entenderla.
