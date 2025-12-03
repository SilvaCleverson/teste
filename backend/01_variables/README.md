# Variables

### Locales
Las variables locales en Move tienen alcance léxico (estático). Las nuevas variables se introducen con la palabra clave `let`, que hará `shadow` (sombreado) de cualquier variable local anterior con el mismo nombre. Las variables locales son **mutables** y pueden ser actualizadas tanto directamente como a través de una referencia mutable.


### Constantes
Las constantes son una forma de dar un nombre a valores estáticos compartidos dentro de un `module`.

La constante debe ser conocida en tiempo de compilación. El valor de la constante se almacena en el `module` compilado. Y cada vez que la constante se usa, se hace una nueva copia de ese valor.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/01_variables
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
BUILDING Variables
Running Move unit tests
[debug] "¡Hola, Mundo!"
[debug] true
[debug] 1
[debug] 2
[debug] "Sui"
[debug] 0
[debug] 1
[debug] 100
[debug] 10
[debug] 15
[debug] false
[ PASS    ] suiz3::variables::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Leyendo los recursos del tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/variables.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

Los temas son:
* Constantes
* Declarando variables
* Nombreando variables
* Anotaciones de tipo
* Declaración múltiple
* Reasignación
* Alcance
* Sombreado (Shadowing)
