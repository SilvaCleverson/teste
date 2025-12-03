# Configuración del SUI Client

En cualquier blockchain, las redes son ambientes en los cuales usuarios y desarrolladores pueden interactuar con contratos inteligentes, validar transacciones o probar nuevas funcionalidades. En el caso de Sui, estas redes permiten separar el ambiente de desarrollo del ambiente de producción, facilitando tanto la experimentación como la estabilidad del ecosistema. Cada red cumple una función específica y comprenderlas es fundamental para saber en qué momento utilizar cada una según el objetivo: probar, desarrollar o implementar en producción.

* **Mainnet**: Es la red principal de Sui, donde se ejecutan transacciones reales y permanentes. Todo lo que sucede aquí tiene valor real —por ejemplo, transferencias de tokens SUI o NFTs—, y está directamente vinculado con dinero o activos que ya están en circulación.
* **Testnet**: Es una red pensada para pruebas controladas antes de lanzar actualizaciones importantes. Su objetivo es garantizar que los cambios no afecten negativamente el desempeño de la red principal. Los desarrolladores pueden validar sus paquetes y scripts aquí sin correr riesgos económicos.
* **Devnet**: Es un ambiente más inestable, pensado para quienes están trabajando con funciones experimentales que aún no han sido integradas oficialmente. Sirve para explorar nuevas capacidades y obtener retroalimentación temprana, aunque no se garantice su continuidad.
* **Localnet**: Es una red privada que corre localmente en tu computadora. Es ideal para desarrollar y probar sin conexión con internet ni necesidad de depender de otros validadores. Te da control total sobre el ambiente y permite iterar más rápidamente.

Estas redes permiten a los desarrolladores preparar, probar y validar sus aplicaciones de forma segura antes de moverlas al ambiente real. Para poder interactuar con cualquiera de estas redes, es necesario conectarse a una red a través de la Sui CLI, lo que implica configurar tu terminal para trabajar con los endpoints correctos y tener las credenciales necesarias.

## Configuración inicial del cliente

1. Primero, vamos a verificar si el cliente está configurado correctamente:

```sh
sui client
```

2. Si esta es la primera vez que ejecutas este comando, el sistema solicitará que configures una nueva cartera. Para esto, selecciona la opción `y` (yes) y elige el esquema de firma. Para este tutorial, recomendamos usar `0` para **ed25519**.

```sh
Config file ["/home/user/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full Node server [y/N]?y
Sui Full Node server URL (Defaults to Sui Testnet if not specified) : 
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1): 
0
```

3. Una vez finalizada la configuración, puedes verificar la información básica de tu cliente ejecutando nuevamente:

```sh
sui client
```

4. Ahora puedes ver información sobre las redes configuradas, direcciones disponibles y otras configuraciones relevantes:

```sh
Config file ["/home/user/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full Node server [y/N]?y
Sui Full Node server URL (Defaults to Sui Testnet if not specified) : 
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1): 
0

Generated new keypair and alias for address with scheme "ed25519" [charming-turquoise: 0x123...]
Secret Recovery Phrase : [abandon ability able about above absent absorb abstract absurd abuse access accident]

Config file ["/home/user/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full Node server [y/N]?y
```

> :warning: **Importante**: Guarda tu frase de recuperación secreta en un lugar seguro. Esta frase es necesaria para recuperar tu cartera en caso de pérdida.

## Financiar una cuenta de prueba

Para poder ejecutar transacciones en la red de prueba, necesitarás tokens SUI de prueba. Para obtenerlos:

1. Ejecuta el siguiente comando para solicitar tokens de prueba:

```sh
sui client faucet
```

2. Puedes verificar tu saldo ejecutando:

```sh
sui client balance
```

3. Si quieres ver más detalles sobre los objetos en tu cuenta:

```sh
sui client objects
```

## Cambio entre ambientes de red

Para alternar entre diferentes redes (mainnet, testnet, devnet), puedes usar los siguientes comandos:

### Listar ambientes disponibles:

```sh
sui client envs
```

### Alternar a una red específica:

```sh
# Para testnet
sui client switch --env testnet

# Para devnet  
sui client switch --env devnet

# Para mainnet
sui client switch --env mainnet
```

### Agregar una nueva red:

```sh
sui client new-env --alias [nombre-de-la-red] --rpc [url-del-endpoint]
```

Por ejemplo, para agregar una red local:

```sh
sui client new-env --alias localnet --rpc http://127.0.0.1:9000
```

### Verificar red actual:

Puedes verificar en qué red estás actualmente conectado ejecutando:

```sh
sui client active-env
```

Con estas configuraciones, estarás listo para comenzar a interactuar con la red Sui de tu elección y desarrollar aplicaciones descentralizadas.
