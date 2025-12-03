// Esta vez, usaremos la dirección explícita en lugar de la nombrada.
module 0x5A6F6E612054726573::address {

    use std::debug::print; // Cuando importamos usando `use`, en realidad `std` es una dirección nombrada, en este caso, la de la biblioteca estándar de Move
    use sui::tx_context::{TxContext, sender}; // Y `sui` es la dirección nombrada correspondiente a la biblioteca de Sui
    use sui::address::{to_string, from_ascii_bytes};

    // Nota: estas funciones están dentro de la biblioteca estándar de Move
    fun pratica_address() {
        let a1: address = @0x1; // versión corta de 0x00000000000000000000000000000001
        print(&a1); // Resultado: [debug] @0x1
        let a2: address = @0xBEBE; // versión corta de 0x0000000000000000000000000000BEBE
        print(&a2); // Resultado: [debug] @0xbebe
        let a3: address = @66;
        print(&a3); // Resultado: [debug] @0x42
    }

    // Nota: estas funciones están dentro de la biblioteca de Sui
    // Al llamar alguna función de nuestro contrato inteligente, estamos ejecutando una transacción
    // Esta transacción es escrita en la blockchain y contiene información como la cuenta de quien la ejecutó
    fun pratica_sender(ctx: &TxContext) { // Podemos acceder a esta información usando el TxContext o contexto de transacción
        // Y podemos acceder a quién está llamando esa transacción usando la función sender.
        print(&sender(ctx)); // Esto imprimirá un address. Resultado: [debug] @0x0

        // Dentro de la biblioteca de Sui, tenemos otras opciones para manipular el tipo address
        // Podemos convertir direcciones a strings
        print(&to_string(sender(ctx))); // Resultado: [debug] "0000000000000000000000000000000000000000000000000000000000000000"

        // Podemos leer una dirección a partir de texto y convertirla en address (Debe tener exactamente 64 caracteres)
        print(&from_ascii_bytes(&b"000000000000000000000000000000000000000000000000000000000000BEBE")); // Resultado: [debug] @0xbebe
        
        // Puedes validar otras operaciones en la documentación del framework de Sui
        // https://docs.sui.io/references/framework/sui/address
    }

    #[test_only]
    use sui::tx_context; // Vamos a usar esta biblioteca solo durante el contexto de pruebas

    #[test]
    fun teste() {
        // Como estamos programando localmente, no existe una transacción, es decir, no estamos escribiendo en la blockchain
        let ctx = &tx_context::dummy(); // Por lo tanto, usamos una función que simula una transacción en las pruebas

        practica_address();
        practica_sender(ctx); // Y enviamos este contexto a la función que lo requiere.
    }
}