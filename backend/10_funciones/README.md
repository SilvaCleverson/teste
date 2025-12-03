# Funciones

Las funciones son los bloques de construcción de los programas Move. Se llaman a partir de transacciones de usuario y de otras funciones y agrupan el código ejecutable en unidades reutilizables. Las funciones pueden recibir argumentos y retornar un valor. Se declaran con la palabra clave `fun` a nivel del módulo. Como cualquier otro miembro de un módulo, por defecto, son privadas y solo pueden ser accedidas desde dentro del propio módulo. Sin embargo, es posible alterar este comportamiento con modificadores de visibilidad.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/10_funciones
>```

Accede a tu terminal y ejecuta el siguiente comando:

```sh
sui move test
```

Debes obtener algo semejante a esto:
```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Funcoes
Running Move unit tests
[debug] false
[debug] 1
[debug] 2
[ PASS    ] suiz3::funcoes1::teste
[debug] "¡Hola de funciones1!"
[debug] "Sui"
[debug] 0
[debug] 100
[debug] "¡Hola de funciones1!"
[debug] "¡Hola de funciones1!"
[debug] "¡Hola de funciones1!"
[ PASS    ] suiz3::funcoes3::teste
[debug] 200
[ PASS    ] suiz3::funcoes2::teste
[ PASS    ] suiz3::funcoes4::teste
Test result: OK. Total tests: 4; passed: 4; failed: 0
```

## Tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/funciones.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

> :information_source: Recuerda que puedes encontrar más información sobre las funciones en la [documentación](https://move-book.com/move-basics/function) oficial del lenguaje Move.

## Desafío

Simplemente lee la documentación y asegúrate de entenderla. A partir de ahora, la mayoría de los tutoriales contará con múltiples funciones.
