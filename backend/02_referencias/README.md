# Referencias

Move tiene dos tipos de referencias: inmutables `&` y mutables `&mut`. Las referencias inmutables son solo de lectura y no pueden modificar su valor (o cualquiera de sus campos). Las referencias mutables permiten modificaciones a través de una escritura por medio de esa referencia. El sistema de tipos de Move impone una disciplina de propiedad (`ownership`) que evita errores de referencia.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/02_referencias
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
BUILDING Referencias
Running Move unit tests
[debug] 1
[debug] 7
[debug] 1
[debug] 1
[debug] 1
[debug] 20
[debug] 20
[ PASS    ] suiz3::referencias::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### Operadores

Debes haber notado que en las lecciones anteriores, para usar un valor, como en las funciones para imprimir en la consola, un *ampersand* `&` se coloca antes de las variables. Esto es lo que llamamos referencia. Si removemos este símbolo, el compilador indicará un error, pues la variable no pertenece a ese alcance, es decir, necesitamos decirle al compilador que la función `print` va a "tomar prestado" ese valor para poder usarlo.

Move proporciona operadores para crear y extender referencias, así como para convertir una referencia mutable en una inmutable. Usaremos la notación `e: T` para "expresión" `e` tiene tipo `T`.

|Sintaxis|Tipo|Descripción|
|---|---|---|
|`&e` | `&T` donde `e: T` y `T` es un tipo no referenciado.| Crea una referencia **inmutable** de `e`.|
|`&mut e` | `&mut T` donde `e: T` y `T` es un tipo no referenciado.|	Crea una referencia **mutable** de `e`.|
|`&e.f` | `&T` donde `e.f: T` | Crea una referencia **inmutable** para el campo `f` de la `struct` `e`.|
|`&mut e.f` |	`&mut T` donde `e.f: T` |	Crea una referencia **mutable** para el campo `f` de la `struct` `e`.|
| `freeze(e)` |	`&T` donde `e: &mut T` | Convierte la referencia **mutable** `e` a una referencia **inmutable**.

### Leyendo y escribiendo a través de referencias

Tanto las referencias mutables como las inmutables pueden ser leídas para producir una copia del valor referenciado.

Solo las referencias mutables pueden ser escritas. Una escritura *x = v descarta el valor almacenado anteriormente en x y lo actualiza con v.

|Sintaxis|Tipo|Descripción|
|---|---|---|
| `*e` | `T` donde `e` es `&T` o `&mut T` | Lee el valor apuntado por `e` |
|`*e1 = e2` | `()` donde `e1: &mut T` y `e2: T` | Actualiza el valor de `e1` con el de `e2` |

## Leyendo los recursos del tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/referencias.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.
