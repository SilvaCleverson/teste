# Vectores

Los vectores son una forma nativa de almacenar colecciones de elementos en Move. Son similares a arrays de otros lenguajes de programación, pero con algunas diferencias.

`vector<T>` es el único tipo de colección primitiva que Move proporciona. Un `vector<T>` es una colección homogénea de `T`s que puede crecer o disminuir haciendo `push`/`pop` de valores al final.

Un `vector<T>` puede ser instanciado con cualquier tipo `T`. Por ejemplo, `vector<u64>`, `vector<address>`, `vector<0x1337::meu_modulo::meu_recurso>`, y `vector<vector<u8>>` son todos tipos de vector válidos.

Puedes encontrar más información sobre vectores y sus métodos en la [documentación oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/vector.md) de Sui Core.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/05_vectores
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
BUILDING Vetores
Running Move unit tests
[debug] 1
[debug] 3
[debug] 55
[debug] 40
[ PASS    ] suiz3::vetores::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### Literales de un vector

|Sintaxis|Tipo|Descripción|
|---|---|---|
|`vector[]`|`vector[]: vector<T>` donde `T` es cualquier tipo, no referenciado.|Un vector vacío|
|`vector[e1, ..., en]`|`vector[e1, ..., en]: vector<T>` donde `e_i: T` tiene ` 0 < i <= n` y `n > 0`|Un vector con `n` elementos (de longitud `n`)|

En estos casos, el tipo del vector es inferido, sea a partir del tipo del elemento o del uso del vector. Si el tipo no puede ser deducido, o simplemente para mayor claridad, el tipo puede ser especificado explícitamente:

```rust
vector<T>[]: vector<T>
vector<T>[e1, ..., en]: vector<T>
```

### Operaciones

Estas son algunas de las operaciones más comunes usadas al trabajar con vectores:

|Función|Descripción|Aborta|
|---|---|---|
|`empty<T>(): vector<T>`|Crea un vector vacío que puede almacenar datos del tipo `T`|Nunca|
|`singleton<T>(t: T): vector<T>`|Crea un vector de longitud 1 que contiene `t`|Nunca
|`push_back<T>(v: &mut vector<T>, t: T)`|Agrega un elemento al final de `v`|Nunca|
|`pop_back<T>(v: &mut vector<T>): T`|Remove y retorna el último elemento de `v`|Si v está vacío|
|`borrow<T>(v: &vector<T>, i: u64): &T`|Retorna una referencia inmutable para el `T` en el índice `i`|Si `i` está fuera de los límites|
|`borrow_mut<T>(v: &mut vector<T>, i: u64): &mut T`|Retorna una referencia mutable para el `T` en el índice `i`|Si `i` está fuera de los límites|
|`destroy_empty<T>(v: vector<T>)`|Elimina v|Si `v` no está vacío|
|`append<T>(v1: &mut vector<T>, v2: vector<T>)`|Agrega los elementos en `v2` al final de `v1`|Nunca|
|`contains<T>(v: &vector<T>, e: &T): bool`|Retorna `true` si `e` está en el vector `v`. Caso contrario, retorna `false`|Nunca|
|`swap<T>(v: &mut vector<T>, i: u64, j: u64)`|Intercambia los elementos en los índices `i` y `j` en el vector `v`|Si `i` o `j` están fuera de los límites|
|`reverse<T>(v: &mut vector<T>)`|Invierte el orden de los elementos en el vector `v`|Nunca|
|`index_of<T>(v: &vector<T>, e: &T): (bool, u64)`|Retorna `(true, i)` si `e` está en el vector `v` en el índice `i`. Caso contrario, retorna `(false, 0)`|Nunca|
|`remove<T>(v: &mut vector<T>, i: u64): T`|Remove el elemento en el índice `i` del vector `v`, desplazando los demás elementos. Esta operación es `O(n)` y preserva el orden de los elementos.|Si `i` está fuera de los límites|
|`swap_remove<T>(v: &mut vector<T>, i: u64): T`|Intercambia el elemento en el índice `i` del vector v con el último elemento y después remove el último elemento. Esta operación es `O(n)` pero no preserva el orden de los elementos en el vector.|Si `i` está fuera de los límites|

> :information_source: Recuerda que puedes ver información sobre el resto de los métodos en la [documentación oficial](https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/vector.md) de Sui Core.

## Leyendo los recursos del tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/vectores.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

## Desafío

* Crea una matriz de 3x3 e inicialízala con los valores que desees.
* Imprime cada uno de esos elementos.

> :information_source: Recuerda guardar tus cambios en el archivo para posteriormente hacer el `push` a tu repositorio de **Github**.
