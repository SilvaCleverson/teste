module suiz3::condicionais {
    use std::debug::print;
    use std::string::utf8;

    const ESemAcesso: u64 = 1; // Generalmente, las constantes para indicar un error comienzan con E mayúscula, seguido por el motivo del error.
    const NAO_HA_ACESSO: u64 = 2; // Aunque no sea necesario, sé descriptivo en tus errores.

    fun pratica() {
        // If
        let a = 10;
        if (a > 0) { // La evaluación de la condición dentro del if tiene que resultar en un booleano.
            print(&utf8(b"a es mayor que 0")); // La operación después de la evaluación puede ser casi cualquier cosa.
        }; // Cerramos el bloque.
        // Resultado: [debug] "a es mayor que 0"

        // Else
        if (a > 20) {
            print(&utf8(b"a es mayor que 20"));
        } else { // No cerramos el bloque.
            print(&utf8(b"a no es mayor que 20"));
        }; // Hasta aquí se cierra.
        // Resultado: [debug] "a no es mayor que 20"

        // Si la expresión resulta en un valor, es posible almacenarla en una variable
        let armazenada = if (a < 100) a else 100;
        print(&armazenada); // Resultado: [debug] 10

        // Abort
        let acesso_usuario: bool = true; // En este escenario, nuestro usuario tiene acceso a todas las funciones.
        // Normalmente, tendrías que evaluar esto dependiendo de tu módulo.
        if(!acesso_usuario) { // Intenta remover la negación y ejecuta nuevamente.
            abort(1) // El código es retornado al usuario si la ejecución aborta.
        } else {
            print(&utf8(b"Usuario tiene acceso."));
        };

        // Assert
        assert!(acesso_usuario, 1); // Otra forma de escribir la expresión anterior sin la necesidad de retornar algo.
        // Intenta negar el acceso usando !

        // Códigos de error
        assert!(acesso_usuario, ESemAcesso); // Es una buena práctica especificar el motivo de un abort/assert.
        assert!(acesso_usuario, NAO_HA_ACESSO);
    }

    #[test]
    fun teste() {
        pratica();
    }
}