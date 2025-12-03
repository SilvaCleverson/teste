![banner](./recursos/imagens/banner.jpg)
# 🚀 BootCamp Español - Primeros Pasos en Sui

## 📚 Introducción

¡Bienvenido al **BootCamp Español de Sui**! Este es un curso completo diseñado para que aprendas desde cero cómo desarrollar aplicaciones en la blockchain de Sui usando el lenguaje Move.

**Sui** es una plataforma de blockchain y contratos inteligentes de **capa 1** diseñada para que la propiedad de activos digitales sea rápida, privada, segura y accesible.

**Move** es un lenguaje de código abierto para escribir paquetes seguros para manipular objetos en la blockchain. Permite bibliotecas, herramientas y comunidades de desarrolladores comunes en blockchains con modelos de datos y ejecución muy diferentes.

---

## 🎯 Estructura del BootCamp

Este bootcamp está organizado en **10 módulos progresivos** que te llevarán desde los conceptos básicos hasta temas avanzados:

1. **00_intro** - Introducción a módulos y paquetes
2. **01_variables** - Variables y constantes
3. **02_referencias** - Referencias inmutables y mutables
4. **03_tipos_primitivos** - Tipos de datos básicos
5. **04_condicionales** - Estructuras condicionales
6. **05_vectores** - Manejo de colecciones
7. **06_strings** - Trabajo con cadenas de texto
8. **07_structs** - Estructuras de datos personalizadas
9. **08_habilidades** - Sistema de habilidades en Move
10. **09_address** - Manejo de direcciones
11. **10_funciones** - Funciones y visibilidad

---

## 📋 Cola de Comandos Rápidos (Cheat Sheet)

> 💡 **Tip:** Para una referencia completa de comandos, consulta el archivo [`COMANDOS.md`](./COMANDOS.md)

### ⚡ Instalación Rápida de Sui CLI

**Para Mac y Linux:**
```bash
# Instalar suiup
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh

# Cargar variables de entorno (si es necesario)
source ~/.sui/suiup/env

# Instalar Sui CLI
suiup install sui

# Verificar instalación
sui --version
```

**Para Windows (PowerShell):**
```powershell
# Descargar suiup desde: https://github.com/Mystenlabs/suiup/releases
# Luego instalar Sui CLI
suiup install sui

# Verificar instalación
sui --version
```

### 🔧 Comandos Esenciales del BootCamp

```bash
# Navegar a un tutorial
cd backend/00_intro

# Ejecutar tests de un módulo
sui move test

# Ver ayuda de Sui CLI
sui --help

# Ver versión instalada
sui --version
```

### 📦 Comandos de Git (si trabajas con repositorio)

```bash
# Clonar repositorio
git clone <url-del-repositorio>

# Ver estado
git status

# Agregar cambios
git add .

# Hacer commit
git commit -m "Mensaje descriptivo"

# Subir cambios
git push
```

---

## 🛠️ Configuración Inicial

### 1. Instalando un Editor de Código

Para este bootcamp, recomendamos **Visual Studio Code**.

1. Descarga el instalador para tu sistema operativo en la [página oficial de Visual Studio Code](https://code.visualstudio.com/)
2. **Extensiones recomendadas** (opcional pero muy útil):
    * [Move (Extension)](https://marketplace.visualstudio.com/items?itemName=mysten.move) - Extensión de servidor de lenguaje para Move mantenida por [Mysten Labs](https://www.mystenlabs.com/).
    * [Move Formatter](https://marketplace.visualstudio.com/items?itemName=mysten.prettier-move) - Formateador de código para Move, desarrollado y mantenido por Mysten Labs.
    * [Move Syntax](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax) - Extensión de resaltado de sintaxis para Move.

### 2. Instalación de Git

> :information_source: Asegúrate de tener acceso a una consola en tu computadora con permisos para instalación de software.

#### Mac
```bash
# Si tienes Homebrew instalado
brew update
brew install git
```

#### Windows
Descarga el instalador en: [https://www.git-scm.com/download/win](https://www.git-scm.com/download/win)

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install git-all
```

**Configurar Git (solo la primera vez):**
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

### 3. Instalación de la Sui CLI

#### 🍎 Mac

**Opción 1: Usando suiup (Recomendado)**
```bash
# Instalar suiup
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh

# Cargar variables de entorno
source ~/.sui/suiup/env

# Instalar Sui CLI
suiup install sui

# Verificar
sui --version
```

**Opción 2: Usando Homebrew**
```bash
brew update
brew install sui
sui --version
```

#### 🪟 Windows

**Opción 1: Usando suiup (Recomendado)**
1. Descarga `suiup-Windows-msvc-x86_64.zip` desde: [https://github.com/Mystenlabs/suiup/releases](https://github.com/Mystenlabs/suiup/releases)
2. Extrae y agrega al PATH
3. En PowerShell:
```powershell
suiup install sui
sui --version
```

**Opción 2: Usando Chocolatey**
```powershell
choco install sui
sui --version
```

#### 🐧 Linux

**Opción 1: Usando suiup (Recomendado)**
```bash
# Instalar suiup
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh

# Cargar variables de entorno
source ~/.sui/suiup/env

# Instalar Sui CLI
suiup install sui

# Verificar
sui --version
```

**Opción 2: Usando Cargo (Rust)**
```bash
rustup update stable
cargo install --git https://github.com/MystenLabs/sui.git sui --branch devnet
sui --version
```

### 4. Instalación de MVR (Move Registry)

**Si instalaste con suiup:**
```bash
suiup install mvr
mvr --version
```

**Si instalaste con cargo:**
```bash
cargo install --locked --git https://github.com/mystenlabs/mvr --branch release mvr
mvr --version
```

---

## 🎓 Cómo Usar Este BootCamp

### Paso 1: Clonar o Descargar el Repositorio

```bash
git clone https://github.com/SilvaCleverson/teste.git
cd teste
```

### Paso 2: Navegar a un Tutorial

```bash
# Ejemplo: ir al tutorial de introducción
cd backend/00_intro
```

### Paso 3: Leer las Instrucciones

Cada tutorial tiene su propio `README.md` con:
- Explicación del concepto
- Instrucciones paso a paso
- Ejercicios prácticos
- Desafíos finales

### Paso 4: Ejecutar el Código

```bash
# Desde el directorio del tutorial
sui move test
```

### Paso 5: Experimentar y Aprender

- Modifica el código
- Prueba diferentes valores
- Resuelve los desafíos propuestos
- Consulta la documentación oficial cuando sea necesario

---

## 📖 Recursos Adicionales

### Documentación Oficial
- [Documentación de Sui](https://docs.sui.io/)
- [Documentación de Move](https://move-language.github.io/move/)
- [Sui Developer Portal](https://sui.io/developers)

### Comunidad
- [Discord de Sui](https://discord.gg/sui)
- [Foro de Sui](https://forums.sui.io/)

---

## 🎯 Objetivos del BootCamp

Al finalizar este bootcamp, serás capaz de:

✅ Entender los conceptos fundamentales de Move y Sui  
✅ Escribir contratos inteligentes básicos  
✅ Trabajar con tipos de datos, estructuras y funciones  
✅ Comprender el sistema de habilidades de Move  
✅ Desarrollar aplicaciones descentralizadas en Sui  

---

## 💡 Consejos para Estudiantes

1. **Sigue el orden**: Los tutoriales están diseñados para ser completados en secuencia
2. **Experimenta**: No tengas miedo de modificar el código y ver qué pasa
3. **Lee los comentarios**: Cada archivo `.move` tiene comentarios explicativos
4. **Resuelve los desafíos**: Son fundamentales para consolidar el aprendizaje
5. **Consulta la documentación**: Cuando tengas dudas, la documentación oficial es tu mejor amiga

---

## 🐛 Solución de Problemas Comunes

### Error: "sui: command not found"
**Solución:** Asegúrate de haber cargado las variables de entorno:
```bash
source ~/.sui/suiup/env
```

### Error al ejecutar `sui move test`
**Solución:** Verifica que estás en el directorio correcto del tutorial y que tienes la Sui CLI instalada correctamente.

### Problemas con Git en Windows
**Solución:** Usa Git Bash o PowerShell como administrador.

---

## 📝 Notas Importantes

- Este bootcamp está diseñado para **principiantes** pero también es útil como referencia para desarrolladores con experiencia
- Todos los ejemplos están probados y funcionan correctamente
- Los comandos están actualizados para la versión más reciente de Sui
- Si encuentras algún error, por favor reporta el problema

---

## 🙏 Créditos

Este repositorio es una traducción y adaptación al español del proyecto original desarrollado por [WayLearnLatam](https://github.com/WayLearnLatam).

**Repositorio Original:** [https://github.com/WayLearnLatam/sui-first-steps](https://github.com/WayLearnLatam/sui-first-steps)

Agradecemos al equipo WayLearnLatam por crear este excelente material educativo sobre Sui y Move.

---

## 📞 Soporte

Si tienes preguntas o necesitas ayuda:
1. Revisa la documentación oficial
2. Consulta los comentarios en el código
3. Únete a la comunidad de Sui en Discord
4. Consulta el archivo [`COMANDOS.md`](./COMANDOS.md) para referencia rápida

---

## 📄 Archivos de Referencia

- **[COMANDOS.md](./COMANDOS.md)** - Cola completa de comandos para consulta rápida
- **[backend/README.md](./backend/README.md)** - Guía de los tutoriales de backend

---

**¡Éxito en tu aprendizaje! 🚀**
