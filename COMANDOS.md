# 📋 Cola de Comandos - BootCamp Español Sui

> 🎯 **Esta es tu referencia rápida durante el bootcamp. Guarda este archivo para consulta rápida!**

---

## ⚡ INSTALACIÓN RÁPIDA - Copia y Pega

### 🍎 Mac / 🐧 Linux (Comandos Esenciales)

```bash
# 1. Instalar suiup
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh

# 2. Cargar variables de entorno (IMPORTANTE)
source ~/.sui/suiup/env

# 3. Instalar Sui CLI
suiup install sui

# 4. Verificar que funcionó
sui --version
```

### 🪟 Windows (PowerShell)

```powershell
# 1. Descargar suiup desde: https://github.com/Mystenlabs/suiup/releases
# 2. Extraer y agregar al PATH
# 3. Instalar Sui CLI
suiup install sui

# 4. Verificar
sui --version
```

### Instalar Sui CLI (Windows)
```powershell
# Descargar desde: https://github.com/Mystenlabs/suiup/releases
suiup install sui
sui --version
```

### 📦 Instalar MVR (Move Registry)
```bash
suiup install mvr
mvr --version
```

---

## 🔧 Comandos del BootCamp

### Navegación
```bash
# Ir a un tutorial específico
cd backend/00_intro
cd backend/01_variables
cd backend/02_referencias
# ... etc
```

### Ejecutar Tests
```bash
# Desde el directorio del tutorial
sui move test
```

### Ver Ayuda
```bash
sui --help
sui move --help
```

---

## 📦 Comandos de Git

### Configuración Inicial
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

### Trabajo Diario
```bash
git status                    # Ver estado
git add .                     # Agregar todos los cambios
git commit -m "Mensaje"       # Hacer commit
git push                      # Subir cambios
git pull                      # Descargar cambios
```

---

## 🎯 Comandos de Sui CLI

### Información
```bash
sui --version                 # Ver versión
sui client                    # Ver información del cliente
sui client active-env         # Ver red activa
```

### Redes
```bash
sui client envs               # Listar redes disponibles
sui client switch --env testnet    # Cambiar a testnet
sui client switch --env devnet     # Cambiar a devnet
sui client switch --env mainnet    # Cambiar a mainnet
```

### Wallet
```bash
sui client faucet             # Obtener tokens de prueba
sui client balance            # Ver saldo
sui client objects            # Ver objetos
```

---

## 💡 Tips Rápidos

- **Problema con "command not found"**: Ejecuta `source ~/.sui/suiup/env`
- **Verificar instalación**: Siempre usa `sui --version` después de instalar
- **Navegar entre tutoriales**: Usa `cd ../` para volver y `cd nombre_tutorial` para entrar
- **Ver código**: Usa `cat archivo.move` o abre en tu editor favorito

---

**Guarda esta página como referencia rápida durante el bootcamp! 📌**

