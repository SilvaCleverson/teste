# Structs

Los tipos definidos por el usuario pueden ser adaptados a las necesidades específicas de la aplicación. No solo a nivel de datos, sino también en su comportamiento. En esta sección, presentamos la definición de `struct` y cómo usarla.

Un `struct` es una estructura de datos definida por el usuario que contiene campos tipados. Los `struct`s pueden almacenar cualquier tipo no referenciado, incluyendo otros structs.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/07_structs
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
BUILDING Structs
Running Move unit tests
[debug] 0x5a6f6e612054726573::structs::Autor {
  nome: "Paulo Coelho"
}
[debug] 0x5a6f6e612054726573::structs::Livro {
  titulo: "O Alquimista",
  autor: 0x5a6f6e612054726573::structs::Autor {
    nome: "Paulo Coelho"
  },
  publicado: 1988,
  tem_audiolivro: true,
  edicao: 0x1::option::Option<u16> {
    vec: [ 1 ]
  }
}
[debug] "O Alquimista"
[debug] "Paulo Coelho"
[debug] 1988
[debug] true
[debug] "J. K. Rowling"
[debug] "John Green"
[debug] "Octavio Paz"
[debug] "Carlos Fuentes"
[debug] "Edgar Allan Poe"
[debug] "George Orwell"
[debug] "Charles Dickens"
[debug] 0x5a6f6e612054726573::structs::Autor {
  nome: "Charles Dickens"
}
[ PASS    ] suiz3::structs::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

Puedes encontrar la documentación para este tutorial dentro del archivo `sources/structs.move`. Cada una de las declaraciones tiene un comentario para ayudarte a entender cada uno de los temas abordados.

> :information_source: Recuerda que puedes encontrar más información sobre los `struct`s y sus métodos en la [documentación](https://move-language.github.io/move/structs-and-resources.html) oficial del lenguaje Move.

## Desafío

* Crea un `struct` de una Persona con los campos que desees. Al menos 3.
    * Por ejemplo: `nome`,`idade`.
* Crea un `struct` de una Clase (una clase de una escuela) con los campos que desees.
    * Por ejemplo: `materia`, `horario`.
    * Debe incluir el `struct` Persona en alguno de los campos. Por ejemplo, en un campo llamado Profesor.
* Crea un `struct` de una Escuela con los campos que desees.
    * Por ejemplo `nome`, `endereco`.
    * Debe incluir un `vector` de Clases.
* Usa estos `struct`s de forma que tengas una Escuela con un `vector` de Clases, que incluya al menos 2 clases de 2 profesores diferentes.
* Imprime la variable que crees de la Escuela en la consola usando `debug_string`. Debe imprimir todos los campos.

> :information_source: Recuerda guardar tus cambios en el archivo para posteriormente hacer el `push` a tu repositorio de **Github**.
