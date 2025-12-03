address suiz3 { // Ahora usamos una nueva sintaxis, ya que tendremos diferentes módulos dentro de la misma dirección.
    module funcoes1 {
        use std::debug::print;
        use std::string::utf8;

        fun retorno(): u64 { // Las funciones pueden retornar algo, hasta ahora la mayoría de las funciones que usamos no retornaban nada.
            let a = 0u64;
            a // Para retornar algo, necesita ser la última línea en la expresión. Omitimos el ;
            // Esto es un retorno implícito
        }

        fun retorno_condicional(a: u64): bool { // Las funciones pueden incluir en el nombre: a a z, A a Z, _, dígitos de 0 a 9.
            // El nombre de una función no puede tener _ al inicio, pero puede después del primer carácter.
            if (a > 0) {
                true
            } else {
                false
            } // Normalmente cerraríamos aquí, pero como el resultado del if será retornado, no cerramos
        }

        public fun funcao_publica() { // Podemos declarar funciones públicas para ser llamadas de otros módulos
            print(&utf8(b"¡Hola de funciones1!"));
        }

        #[test]
        fun teste() {
            retorno();
            let a = retorno_condicional(0); // Es importante notar que si vamos a retornar algo, necesita ser consumido. A menos que tenga la habilidad drop
            print(&a); // Resultado: [debug] false
        }
    }

    module funcoes2 { // ¡Nuevo módulo!
        use suiz3::funcoes1::{Self, funcao_publica}; // Usaremos este import para demostrar las diferentes maneras de importar un módulo.

        fun chamada_externa() {
            // Podemos hacer llamadas a funciones públicas:
            suiz3::funcoes1::funcao_publica(); // Esta forma de llamarla es cuando no importamos la función con use
            funcoes1::funcao_publica(); // Esta forma es cuando importamos Self
            funcao_publica(); // Y por último, esta es cuando importamos la función directamente.
            // Las 3 llamadas son equivalentes, cuál utilizar depende de tu caso de uso.
        }

        #[test]
        fun teste() {
            chamada_externa(); // Resultado: [debug] "¡Hola de funciones1!"
        }
    }

    module funcoes3 {
        use std::debug::print;

        fun parametros(a: u64, b: u64) { // Las funciones pueden recibir parámetros, cada uno separado por una coma y especificando el tipo esperado.
            print(&a); // Resultado: [debug] 1
            print(&b); // Resultado: [debug] 2
        }

        fun retorno_multiplo(): (vector<u8>, u64) { // Las funciones pueden tener múltiples retornos. Es necesario envolverlos en paréntesis.
            (b"Sui", 0) // Lo mismo al retornarlos
        }

        fun retorno_explicito(): u8 { // Como vimos arriba, podemos omitir la palabra return si nuestro código evalúa a un valor final
            return 100 // Aun así, también podemos usar return si es necesario. Nota que también se omite ;
        }

        #[test_only] // Podemos importar módulos que serán usados solo en las pruebas con test_only
        use std::string::utf8; // Por ejemplo, este import solo usaremos abajo para imprimir el valor recibido, pero arriba no lo necesitamos.

        #[test]
        fun teste() {
            let a = 1u64; // Los parámetros tienen que ser del tipo esperado por la función.
            parametros(a, 2); // Al enviar parámetros, recuerda separarlos con ,

            let (nome, numero) = retorno_multiplo(); // Al recibir una función con retorno múltiple, asignamos nuevas variables para guardar cada valor.
            print(&utf8(nome)); // Resultado: [debug] "Sui"
            print(&numero); // Resultado: [debug] 0

            let retorno_explicito = retorno_explicito(); // ¿Mencioné que las funciones y variables pueden tener el mismo nombre?
            print(&retorno_explicito); // Resultado: [debug] 100
        }
    }

    module funcoes4 {
        public entry fun funcao_entry() { // El modificador entry es esencialmente lo que sería el modificador main en otros lenguajes
            suiz3::funcoes1::funcao_publica(); // Son funciones que permiten que sean llamadas de manera segura e invocadas directamente.

            // No es un modificador restrictivo. Estas funciones pueden continuar siendo llamadas por otras funciones dentro del módulo.
            // Las funciones entry son las funciones que podremos llamar del terminal en el momento de subir el código a la blockchain.
            // Las funciones entry NO pueden retornar un valor.
        }

        #[ext(view)] // Por último, podemos tener funciones de lectura, ellas son atribuidas con #[ext(view)].
        public fun funcao_leitura(): u16 { // Estas funciones también pueden ser llamadas del terminal.
            200 // Las funciones view deben retornar un valor
            // Dentro de este contexto no hacen mucho sentido, pero las abordaremos en la próxima lección.
        }

        #[test_only]
        use std::debug::print;

        #[test]
        fun teste() {
            funcao_entry(); // Resultado: [debug] "¡Hola de funciones1!"
            let a = funcao_leitura();
            print(&a); // Resultado: [debug] 200
        }

        // Recuerda que puedes ver más información sobre las funciones y sus declaraciones en la documentación oficial del lenguaje Move:
        // https://move-book.com/move-basics/function
    }
}