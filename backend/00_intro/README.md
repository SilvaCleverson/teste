# Introducción

## Módulos y Paquetes

**Move** en Sui tiene dos tipos diferentes de programas: Módulos y Paquetes.

Move es un lenguaje para escribir contratos inteligentes, programas que se almacenan y ejecutan en la blockchain. Un programa se organiza en un paquete. Un paquete se publica en la blockchain e se identifica por una dirección. Es posible interactuar con un paquete publicado enviando transacciones que llaman sus funciones. También puede actuar como una dependencia para otros paquetes.

Un módulo es la unidad básica de organización de código en Move. Los módulos se usan para agrupar y aislar código, y todos los miembros del módulo son privados para el módulo por defecto.

En esta sección, aprenderás cómo definir un módulo, declarar sus miembros y acceder a él desde otros módulos.

Módulo:
* Contiene funciones y tipos.

Paquete:
* Conjunto de módulos.

En los tutoriales siguientes, trabajaremos la mayor parte del tiempo **solo con módulos**.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/00_intro
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
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] introduccion::practica_sui::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

¡Felicitaciones! :partying_face: Acabas de ejecutar con éxito tu primer módulo Move. Ahora, vamos a analizar lo que está pasando.

En la carpeta `sources`, podemos encontrar un archivo llamado `introduccion.move`. Este archivo, como la extensión indica, contiene el código Move que estamos ejecutando. En este caso, es un **módulo** con una **función** y una **prueba**.

## Estructura de un módulo

La estructura de un **módulo** es la siguiente:

```rust
module endereco::nome_do_modulo {
    // ...  resto del código
}
```

1. Declaración del módulo con la palabra clave `module`.
2. Dirección en la cual el módulo será desplegado.
    La dirección puede encontrarse en el archivo de configuración `Move.toml`, en la sección `addresses`. En nuestro caso:
    ```toml
    [addresses]
    introduccion = "0x5A6F6E612054726573"
    ```
3. Nombre del módulo, en nuestro caso: `practica_sui`

Por lo tanto, nuestro código queda así:
```rust
module introduccion::practica_sui {
    // ...  resto del código
}
```

A continuación, vienen los `imports` o los módulos/bibliotecas que estamos importando para que el nuestro funcione. En nuestro código, estamos importando dos funciones de la biblioteca principal de **Sui**:

```rust
    use std::debug::print;
    use std::string::utf8;
```

Se importa la función para imprimir en la consola, así como una función para convertir strings de texto a un formato aceptado por la función anterior. Veremos esto más adelante en esta serie de tutoriales.

La próxima sección de código incluye nuestra primera función:

```rust
    fun practica() {
        print(&utf8(b"Hello, World!"));
    }
```

En ella, hacemos uso de ambas bibliotecas importadas. La función simplemente imprime la cadena `Hello, World!` en la consola.

Y, por último, necesitamos una forma de ejecutar esta función. Por ahora, lo estamos haciendo a través de un **bloque de prueba** o `test`:

```rust
    #[test]
    fun teste() {
        practica();
    }
```

Cuando ejecutamos `sui move test`, le estamos diciendo a la CLI que ejecute todas las funciones que tienen un bloque `[#test]`, en este caso, ejecuta nuestra función `teste`, que a su vez llama a la función `pratica`.

## Salida

Por último, vamos a analizar el resultado que fue impreso en la consola.

```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] introduccion::practica_sui::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

El primer bloque de texto nos informa que está incluyendo las dependencias necesarias para ejecutar el proyecto:

```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
```

Estas dependencias son las dependencias básicas que todo paquete en **Move** necesita, así que el compilador las importa automáticamente.
Puedes verificar que no estamos importando ninguna dependencia en el archivo `Move.toml` en la sección `[dependencies]`.

La próxima línea en la salida nos dice que se ejecutarán las pruebas de unidad en el archivo, recuerda que esto ocurre porque ejecutamos el comando `sui move test`:
```
Running Move unit tests
```

A continuación, obtenemos el mensaje que la función de prueba ejecuta, en nuestro caso, la línea de texto `Hello, World!`:
```sh
[debug] "Hello, World!"
```

Ahora, en la próxima línea, podemos obtener información sobre exactamente qué funciones fueron ejecutadas:
```sh
[ PASS    ] introduccion::practica_sui::teste
```
La estructura es algo como:
```rust
endereco::nome_do_modulo::funcao
```
Con esto, podemos verificar que la función que fue ejecutada fue `teste`.

Por último, obtenemos información sobre las pruebas de unidad, como cuántas fueron ejecutadas y cuántas pasaron:

```sh
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Desafío Final

Como desafío final, modifica la función para que, en lugar de mostrar `Hello, World!`, imprima el logo de **Sui** en arte ASCII:
```ASCII
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
================================================:..:================================================
===============================================......-==============================================
=============================================-..    ..:=============================================
============================================....    ....============================================
==========================================-..............:==========================================
=========================================.......:==:.......=========================================
=======================================-.......-====-.......:=======================================
======================================:.    .:========:.    ..-=====================================
====================================-.......:==========-.......:====================================
===================================.........=============:... ...===================================
=================================-.........================..   ..:=================================
================================....    ..:=================:.......================================
==============================-.....    ..:==================-.......:==============================
=============================:............:====================:.......=============================
===========================-.......-.......=====================-.......-===========================
==========================-.......==:......-======================:.... .-==========================
=========================-......:====.......-======================-......-=========================
=========================......:=====-.......:======================-......=========================
========================:......=======-... ....:=====================:.....:========================
========================......-=========.........:-===================......========================
=======================-    ..===========-..........:-================:.    :=======================
=======================:    .:=============-...........:==============-.    :=======================
=======================:    .:================:.....    ..-===========-.    .=======================
=======================:    .:==================-:..    ...:==========:.    :=======================
=======================-.  ...=====================-:...    .:========..    :=======================
========================......-=======================:.    ...=======..    -=======================
========================:.. ...=========================........=====.......========================
=========================......:=========================:......:===:......-========================
=========================-......:=========================.......-=:......:=========================
==========================:.    ..-=======================-.    ....    .:==========================
===========================:.......:=======================.    ........:===========================
============================-...    ..=====================:        ...-============================
==============================:.    ....:-================-.        ..==============================
================================:...    .....::------::.....    ....================================
==================================:.    ....................    .:-=================================
====================================-:........................:-====================================
========================================-:................:-========================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
```

> :information_source: Recuerda guardar tus cambios en el archivo para después hacer el `push` a tu repositorio de **Github**.
