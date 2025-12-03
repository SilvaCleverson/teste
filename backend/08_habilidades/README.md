# Habilidades

Las habilidades son una característica de tipado en Move que controla qué acciones están permitidas para los valores de un determinado tipo. Este sistema garantiza un control detallado sobre el comportamiento de tipado "lineal" de los valores, así como si los valores se usan en el almacenamiento persistente de la cadena (también conocido como **Object Store** en Sui) y cómo. Esto se implementa bloqueando el acceso a ciertas instrucciones de bytecode, de modo que, para que un valor pueda ser usado con la instrucción de bytecode, debe tener la habilidad necesaria, si alguna es necesaria. No todas las instrucciones están bloqueadas por una habilidad.

Las habilidades forman parte de la declaración de un `struct` y definen los comportamientos permitidos para las instancias de esta estructura.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/08_habilidades
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
BUILDING Habilidades
Running Move unit tests
[ PASS    ] suiz3::habilidades::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/habilidades.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

### Sintaxis

|Habilidad|Descripción|
|---|---|
|`copy`|Permite que valores con esta habilidad sean copiados.|
|`drop`|Permite que valores con esta habilidad sean descartados.|
|`store`|Permite que valores con esta habilidad puedan ser almacenados dentro de otros objetos.|
|`key`|Permite que el tipo sea gestionado como un objeto independiente en la blockchain, con su propio ID y propietario.|

Las habilidades se establecen en la definición del `struct` usando la palabra clave `has` seguida por una lista de habilidades. Las habilidades están separadas por comas. Move soporta 4 habilidades: `copy`, `drop`, `key`, y `store`, cada una de ellas se usa para definir un comportamiento específico para las instancias de la estructura.

```move
/// Este `struct` tiene las habilidades `copy` y `drop`.
struct Estrutura has copy, drop {
    // campo1: Tipo1,
    // campo2: Tipo2,
    // ...
}
```

### `copy`

La habilidad `copy` permite copiar valores de tipos con esta habilidad. Permite copiar valores de variables locales con el operador `copy` y copiar valores por desreferenciación `*e`.

Si un valor tiene `copy`, todos los valores contenidos dentro de ese valor tienen `copy`.

### `drop`

La habilidad `drop` permite descartar valores de tipos con esta habilidad. Por descartar, queremos decir que el valor no es transferido y es efectivamente destruido mientras el programa Move se ejecuta. Como tal, esta habilidad da la posibilidad de **ignorar** valores en una infinidad de lugares, incluyendo:
* no usar el valor en una variable local o parámetro
* no usar el valor en un bloque por medio de ;
* sobrescribir valores en variables
* sobrescribir valores por medio de referencias al escribir `*e1` = `e2`.

Si un valor tiene `drop`, todos los valores contenidos dentro de ese valor tienen `drop`.

### `store`

La habilidad `store` permite que los valores de los tipos con esta habilidad existan dentro de una estructura (objeto), pero no necesariamente como un objeto independiente en el **almacenamiento persistente**. Esta es la única habilidad que no bloquea directamente una operación. En lugar de eso, bloquea el almacenamiento en la cadena cuando se usa en conjunto con `key`.

Si un valor tiene `store`, todos los valores contenidos dentro de ese valor también deben tener `store`.

### `key`

La habilidad `key` permite que el tipo sirva como un **objeto independiente** en el almacenamiento persistente de la cadena. Permite todas las operaciones relacionadas con la gestión de objetos en la cadena, por lo tanto, para que un tipo pueda ser usado como un objeto gestionado por Sui, debe tener la habilidad `key`. Observa que las operaciones deben ser usadas en el módulo en que el tipo `key` es definido (las operaciones son privadas para el módulo que las define).

Si un valor tiene `key`, todos los valores contenidos dentro de ese valor deben tener `store`. Esta es la única habilidad con este tipo de asimetría.

### Tipos primitivos

La mayoría de los tipos primitivos tienen `copy`, `drop` y `store`, con excepción de `signer`, que solo tiene `drop`.

* `bool`, `u8`, `u16`, `u32`, `u64`, `u128`, `u256`, y `address` tienen `copy`, `drop`, y `store`.
* `signer` tiene `drop`.
    * No puede ser copiado y no puede ser guardado en el almacenamiento persistente.
* `vector<T>` puede tener `copy`, `drop` y `store` dependiendo de las capacidades de `T`.
* Las referencias inmutables `&` y las referencias mutables `&mut` tienen ambas `copy` y `drop`.
    * Esto se refiere a copiar y descartar la propia referencia, no a lo que están referenciando.
    * Las referencias no pueden aparecer en el almacenamiento persistente, pues no tienen `store`.
* **Ninguno** de los tipos primitivos tiene `key`, lo que significa que ninguno de ellos puede ser usado directamente como objetos almacenables en la cadena.

> :information_source: Recuerda que puedes encontrar más información sobre las habilidades en la [documentación](https://move-language.github.io/move/abilities.html) oficial del lenguaje Move.

## Desafío

Simplemente lee la documentación y asegúrate de entenderla. A partir de aquí, la mayoría de los ejercicios tendrá tipos con habilidades, por eso es importante que al menos identifiques cada una y su función.
