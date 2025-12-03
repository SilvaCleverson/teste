module suiz3::referencias {
    use std::debug::print;

    fun pratica() {
        // Tipo no referenciado:
        let a = 1;
        print(&a); // Para imprimir un tipo no referenciado, necesitamos agregar la referencia al valor.

        // Tipo referenciado:
        let b = 7;
        let c : &u64 = &b;
        print(c); // Como c ya fue declarado como tipo referenciado, no es necesario especificar la referencia.
    
        // Inmutable
        let original: u64 = 1;
        let copia_de_original = original; // Nota que no estamos pasando la referencia aquí.
        print(&copia_de_original); // Pero aquí sí.

        let outra_copia = &original;
        print(outra_copia);

        // Mutable
        let copia_mutavel = &mut original; 
        print(copia_mutavel); // Nuevamente, no es necesario pasar la referencia.

        *copia_mutavel = 20;
        print(copia_mutavel);
        print(&original); // ¿Por qué ahora el original es 20 si lo que modificamos fue la copia mutable? 
    }

    #[test]
    fun teste() {
        pratica();
    }
}