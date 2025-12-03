![banner](./recursos/imagens/banner.jpg)
# Primeros pasos en Sui

## Introducción

**Sui** es una plataforma de blockchain y contratos inteligentes de **capa 1** diseñada para que la propiedad de activos digitales sea rápida, privada, segura y accesible.

**Move** es un lenguaje de código abierto para escribir paquetes seguros para manipular objetos en la blockchain. Permite bibliotecas, herramientas y comunidades de desarrolladores comunes en blockchains con modelos de datos y ejecución muy diferentes.

## Instalando un editor de código

Para este tutorial, instalaremos **Visual Studio Code**.

1. Descarga el instalador para tu sistema operativo en la [página oficial de Visual Studio](https://code.visualstudio.com/)
2. (Opcional) Recomendamos instalar las siguientes extensiones:
    * [Move (Extension)](https://marketplace.visualstudio.com/items?itemName=mysten.move) es una extensión de servidor de lenguaje para Move mantenida por [Mysten Labs](https://www.mystenlabs.com/).
    * [Move Formatter](https://marketplace.visualstudio.com/items?itemName=mysten.prettier-move) es un formateador de código para Move, desarrollado y mantenido por Mysten Labs.
    * [Move Syntax](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax) una simple extensión de resaltado de sintaxis para Move por [Damir Shamanaev](https://github.com/damirka/).

## Clonando este repositorio

> :information_source: Asegúrate de tener acceso a una consola en tu computadora con permisos para instalación de software.

## 1. Instalación de Git

1. [Instalación en Mac](#macgit)
2. [Instalación en Windows](#windowsgit)
3. [Instalación en Linux](#linuxgit)

## Instalación en Mac <a id="macgit"></a>

1. Asegúrate de tener **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abre una terminal e ingresa los siguientes comandos:
```sh
brew update
brew install git
```
3. Si necesitas más información sobre la instalación, puedes encontrarla en la documentación [oficial de Git](https://www.git-scm.com/download/mac).

## Instalación en Windows <a id="windowsgit"></a>

1. Descarga el instalador en la página oficial de Git: [https://www.git-scm.com/download/win](https://www.git-scm.com/download/win).
2. Sigue las instrucciones indicadas. Las opciones predeterminadas del instalador generalmente son suficientes, pero si quieres personalizar tu instalación de alguna forma y sabes lo que estás haciendo, siéntete libre de cambiar lo que sea necesario.

## Instalación en Linux <a id="linuxgit"></a>

1. Para distribuciones basadas en Debian, como Ubuntu, puedes ejecutar los siguientes comandos:
```bash
sudo apt update
sudo apt install git-all
```
2. Si necesitas información sobre la instalación en alguna otra distribución específica, puedes encontrarla en la documentación [oficial de Git](https://git-scm.com/download/linux).

## 2. Configurando Git

Es una buena idea configurar los valores globales de tu usuario antes de comenzar a usar Git. Puedes hacerlo con los siguientes comandos.

> :information_source: Recuerda sustituir los ejemplos con tus datos personales.
```sh
git config --global user.name "Nombre Ejemplo"
git config --global user.email nombre@ejemplo.com
```

## 3. Clonando el repositorio localmente

En tu terminal, ejecuta el siguiente comando:

```sh
git clone https://github.com/AguaPotavel/sui-first-steps.git
```

> :information_source: Recuerda que puedes cambiar el directorio donde se clonará el repositorio. Utiliza `cd` para moverte entre los directorios de tu computadora, y `mkdir` para crear uno nuevo. </br></br>
> Más información: [Tutorial de comandos básicos](https://aprendolinux.com/aprende-los-comandos-basicos-de-linux/).

Una vez que el repositorio sea clonado, puedes navegar hasta él:
```sh
cd sui-first-steps
```

Para visualizar el contenido, puedes ejecutar el comando:

```sh
ls -a
```

Y para abrirlo en el editor de código (en nuestro caso, VS Code), puedes ejecutar:
```sh
code .
```

## 3. Instalación de la Sui CLI

Para poder interactuar con el contenido de los tutoriales, es necesario instalar la **Sui CLI**.

1. [Instalación en Mac](#maccli)
2. [Instalación en Windows](#windowscli)
3. [Instalación en Linux](#linuxcli)

## Instalación en Mac <a id="maccli"></a>

Podemos instalar Sui de dos maneras. Una usando la herramienta desarrollada por MystenLabs, `suiup`, y otra utilizando Homebrew. La recomendada para dar tus primeros pasos sin la necesidad de muchas configuraciones es `suiup`, sin embargo, esta herramienta no debe ser utilizada en ambientes de producción. Vamos a explorar ambas opciones.

### `suiup`

* Ejecuta el siguiente comando en tu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* O puedes descargar los binarios e instalarlo manualmente directamente del [repositorio oficial de `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opción es un poco más avanzada, así que si nunca has instalado algo de forma similar, recomendamos usar el comando anterior.

> :information_source: Si no sabes qué arquitectura tienes, puedes ejecutar el siguiente comando:
> ```sh
> uname -m
> ```
> * Si aparece **arm64** → Descarga suiup-macOS-arm64.tar.gz.
> * Si aparece **x86_64** → Descarga suiup-macOS-x86_64.tar.gz.

1. Puedes probar si la instalación de `suiup` fue exitosa ejecutando el siguiente comando:
```sh
suiup --version
```

2. Después de instalar `suiup`, independientemente de la opción elegida, ejecuta el siguiente comando para instalar la Sui CLI:
```sh
suiup install sui
```

3. Y nuevamente, puedes probar si todo salió bien usando:
```sh
sui --version
```

### Homebrew

1. Asegúrate de tener **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abre una terminal e ingresa los siguientes comandos:
```sh
brew update
brew install sui
```
3. Puedes probar si todo fue instalado correctamente ejecutando:
```sh
sui --version
```

## Instalación en Windows <a id="windowscli"></a>

Podemos instalar Sui de dos maneras. Una usando la herramienta desarrollada por MystenLabs, `suiup`, y otra utilizando un gestor de paquetes como **Chocolatey**. La recomendada para dar tus primeros pasos sin la necesidad de muchas configuraciones es `suiup`, sin embargo, esta herramienta no debe ser utilizada en ambientes de producción. Vamos a explorar ambas opciones.

### `suiup`

1. Descarga el instalador directamente del [repositorio oficial de `suiup`](https://github.com/Mystenlabs/suiup/releases).

> :information_source: Si no sabes qué arquitectura tienes, simplemente descarga el archivo `suiup-Windows-msvc-x86_64.zip`.

2. Una vez instalado, abre una terminal y ejecuta el siguiente comando para verificar si todo salió bien:
```sh
suiup --version
```
> :information_source: Recomendamos usar PowerShell como terminal para ejecutar todos los comandos de este repositorio en Windows.

3. Después de instalar `suiup`, ejecuta el siguiente comando para instalar la Sui CLI:
```sh
suiup install sui
```

4. Y nuevamente, puedes probar si todo salió bien usando:
```sh
sui --version
```

### `choco`

1. Asegúrate de tener **Chocolatey** instalado: [https://chocolatey.org/install](https://chocolatey.org/install).
2. Abre una terminal e ingresa el siguiente comando:
```sh
choco install sui
```
3. Puedes probar si todo fue instalado correctamente ejecutando:
```sh
sui --version
```

## Instalación en Linux <a id="linuxcli"></a>

Podemos instalar Sui de dos maneras. Una usando la herramienta desarrollada por MystenLabs, `suiup`, y otra utilizando el gestor de paquetes para **Rust** llamado `cargo`. La recomendada para dar tus primeros pasos sin la necesidad de muchas configuraciones es `suiup`, sin embargo, esta herramienta no debe ser utilizada en ambientes de producción. Vamos a explorar ambas opciones.

### `suiup`

* Ejecuta el siguiente comando en tu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* O puedes descargar los binarios e instalarlo manualmente directamente del [repositorio oficial de `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opción es un poco más avanzada, así que si nunca has instalado algo de forma similar, recomendamos usar el comando anterior.

> :information_source: Si no sabes qué arquitectura tienes, puedes ejecutar el siguiente comando:
> ```sh
> uname -m
> ```
> * Si aparece **arm64** → Descarga `suiup-Linux-musl-arm64.tar.gz`.
> * Si aparece **x86_64** → Descarga `suiup-Linux-musl-x86_64.tar.gz`.

1. Puedes probar si la instalación de `suiup` fue exitosa ejecutando el siguiente comando:
```sh
suiup --version
```

2. Después de instalar `suiup`, independientemente de la opción elegida, ejecuta el siguiente comando para instalar la Sui CLI:
```sh
suiup install sui
```

3. Y nuevamente, puedes probar si todo salió bien usando:
```sh
sui --version
```

### `cargo`

1. Asegúrate de tener `rustup` instalado: [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install).
2. Abre una terminal e ingresa los siguientes comandos:
```sh
rustup update stable
cargo install --git https://github.com/MystenLabs/sui.git sui --branch devnet
```
3. Puedes probar si todo fue instalado correctamente ejecutando:
```sh
sui --version
```

## 4. Instalación de MVR

El **Move Registry** (MVR) es un gestor de paquetes para Move. Permite a cualquier persona publicar y utilizar paquetes publicados en nuevas aplicaciones desarrolladas con Move. 

1. La forma de instalar `mvr` depende de cómo instalaste la CLI `sui`.

* Si instalaste con `suiup` (independientemente de tu sistema operativo), ejecuta el siguiente comando:
```sh
suiup install mvr
```

* Si instalaste `sui` utilizando `cargo`, ejecuta el siguiente comando:
```sh
cargo install --locked --git https://github.com/mystenlabs/mvr --branch release mvr
```

* Por último, si realizaste la instalación manualmente descargando el instalador y **no** instalaste `suiup`, puedes descargar el instalador de `mvr` en el [repositorio oficial](https://github.com/MystenLabs/mvr/releases).

2. Independientemente de la opción elegida, recuerda verificar si la instalación fue realizada correctamente:
```sh
mvr --version
```

## 5. Interactuando con el repositorio.

El repositorio está compuesto por varias carpetas con archivos para cada tutorial, simplemente navega hasta ellas usando `cd` y sigue las instrucciones dentro de ellas.</br></br>
Cada tutorial posee un archivo `README.md` con instrucciones claras de cómo interactuar con ellos.

## Créditos

Este repositorio es una traducción al español del proyecto original desarrollado por [WayLearnLatam](https://github.com/WayLearnLatam). Puedes encontrar el repositorio original en:

**Repositorio Original:** [https://github.com/WayLearnLatam/sui-first-steps](https://github.com/WayLearnLatam/sui-first-steps)

Agradecemos al equipo WayLearnLatam por crear este excelente material educativo sobre Sui y Move.



curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
source ~/.sui/suiup/env
suiup install sui