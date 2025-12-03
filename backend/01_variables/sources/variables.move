module suiz3::variables {
    use std::debug::print;
    use std::string::utf8;
    use std::vector;
    
    // Las constantes solo pueden ser usadas en el módulo donde fueron declaradas.
    // La primera letra de una constante siempre tiene que ser una letra mayúscula de A a Z.
    // Después de la primera letra, puede contener: letras de a a z, o de A a Z, así como dígitos de 0 a 9, o guion bajo _.
    // El código en Move no acepta acentos en ningún lugar, ni siquiera en comentarios.
    const SAUDACAO: vector<u8> = b"¡Hola, Mundo!";
    const VALOR_VERDADEIRO: bool = true;

    fun pratica() {
        // Haciendo uso de constantes:
        print(&utf8(SAUDACAO)); // Resultado: [debug] "¡Hola, Mundo!"
        let copia_valor_verdadeiro = VALOR_VERDADEIRO; // Copia del valor verdadero para evitar el warning por ownership.
        print(&copia_valor_verdadeiro); // Resultado: [debug] true

        // Declarando variables:
        let a = 1; // Las variables en Move son declaradas con let
        let b = a + a;
        print(&a); // Resultado: [debug] 1
        print(&b); // Resultado: [debug] 2

        //Nombrar variables:
        // Las variables pueden tener: letras de a a z, o de A a Z, así como dígitos de 0 a 9, o guion bajo _.
        // Pueden comenzar con letras de a a z o con guion bajo.
        // Su nombre no puede comenzar con una letra mayúscula (A - Z).
        let _c = 3; // Generalmente usamos _ al inicio del nombre para indicar que es una variable que no será usada.
        let uma_variavel_com_um_nome_muito_longo = b"Sui";
        let _camelCase = false;
        print(&utf8(uma_variavel_com_um_nome_muito_longo)); // Resultado: [debug] "Sui"

        // Anotaciones de tipo:
        // Puedes especificar el tipo de una variable antes de declararla
        let _d: address = @0x0;
        // Sin embargo, esto no siempre es necesario.
        // Solo debe hacerse cuando el compilador no puede inferir el tipo por sí solo.
        // Por ejemplo: let v1 = vector::empty(); dará error porque el sistema no sabe el tipo resultante de la función vector::empty().
        let _v2: vector<u64> = vector::empty();

        // Declaración múltiple:
        let (x0, x1) = (0, 1); // Puedes declarar múltiples variables al mismo tiempo.
        print(&x0); // Resultado: [debug] 0
        print(&x1); // Resultado: [debug] 1

        // Reasignación
        let _e = 0;
        _e = 100;
        print(&_e);

        // Alcance
        let f = 5; // Las variables declaradas fuera de un alcance pueden ser usadas dentro de los alcances declarados en el mismo nivel de la variable.
        { // Abriendo un nuevo alcance
            let g = f + f;
            print(&g); // Resultado: [debug] 10
        }; // Cerrando el alcance
        // print(&g); aquí daría error, pues fue declarada en otro alcance, y una vez cerrado, no tenemos más acceso a esa variable.
        // Sin embargo, como no estamos más en ese alcance, podemos redeclararla y usarla:
        let g = f + f + f;
        print(&g); // Resultado: [debug] 15

        // Shadowing (Sombreado)
        // Si una variable es redeclarada, la declaración anterior es ignorada.
        let _h = 1;
        let _h = false; // En realidad, puedes cambiar el tipo de una variable declarada anteriormente.
        print(&_h); // Resultado: [debug] false
    }

    #[test]
    fun teste() {
        pratica();
    }
}