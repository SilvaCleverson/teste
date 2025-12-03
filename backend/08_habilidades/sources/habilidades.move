module suiz3::habilidades {
    use sui::object::{UID, new, delete};
    use sui::tx_context::TxContext;

    // drop
    struct Ignorame has drop { a: u8 }
    struct SemDrop { a: u8}

    fun pratica_drop() {
        let sem_drop = SemDrop { a: 1 };
        let _ = Ignorame { a: 1 }; // Podemos descartar este valor directamente. Aquí lo estamos ignorando en la declaración.

        let _valor_sem_uso = Ignorame { a: 1 }; // O podemos declararlo y simplemente no usarlo. Dejamos el _ solo para evitar que el compilador envíe warnings.
    
        let SemDrop { a: _ } = sem_drop; // Este valor necesitamos al menos desestructurarlo para que el compilador lo considere como usado.
    }

    // copy
    struct Copiavel has copy {}

    fun pratica_copy() {
        let a = Copiavel {}; // Instanciamos la estructura copiable
        let b = a; // `a` es copiado a `b`
        let c = *&b; // copia explícita usando desreferenciación

        // Si nos detuviéramos aquí, daría error, ya que las variables arriba no tienen `drop`
        // Por lo tanto, necesitamos usarlas, en este caso con desestructuración:
        let Copiavel {} = a;
        let Copiavel {} = b;
        let Copiavel {} = c;
    }

    // copy & drop
    struct Valor has copy, drop {}

    fun pratica_copy_drop() {
        let _a = Valor {}; // Podemos detenernos aquí sin hacer uso de esta variable, ya que tiene la habilidad `drop`.
        let b = 1; // Recuerda que algunos tipos primitivos también tienen esas habilidades.
        let _c = &b; // Y también las referencias, siempre que su valor referenciado también las tenga.
    }

    // key
    struct Objeto has key { id: UID } // Objetos con la habilidad key exigen que su primer campo sea un id

    fun pratica_key(ctx: &mut TxContext) { // Para inicializar un UID (unique ID) necesitamos del contexto de la transacción, este concepto veremos a fondo más adelante
        let objeto = Objeto { id: new(ctx) }; // Los UIDs siempre son inicializados con esta expresión, usando el contexto de la transacción que pasamos a la función
        let Objeto { id } = objeto; // Como UID NO tiene drop, necesitamos consumirlo, pero solo podemos consumirlo si es desempaquetado de un objeto, como aquí
        delete(id); // Una vez desempaquetado, podemos excluirlo usando delete, una función que importamos de la biblioteca sui::object
    }

    // key & store
    struct Armazenavel has store {}
    struct Container has key, store {
        id: UID, // Recuerda que cualquier struct con la habilidad key necesita su UID
        armazena: Armazenavel,
    }

    fun pratica_key_store(ctx: &mut TxContext) {
        let armazenavel = Armazenavel {}; // Estructura con la habilidad `store`
        let container = Container { // Y la guardamos.
            id: new(ctx),
            armazena: armazenavel, // Para poder guardarla aquí, necesitamos que la variable arriba tenga `store`.
        }; // Esta estructura podemos almacenar y usar como clave al mismo tiempo. ¿Pero cómo?? ¿Dónde??

        let Container { armazena, id } = container;
        let Armazenavel {} = armazena; // No tienen `drop`, entonces tenemos que consumirlas.
        delete(id); // Recuerda que los UIDs son consumidos usando object::delete.
        // Claro que esto sería resuelto agregando `drop`, pero es útil saber la sintaxis de desestructuración.
        
        // key y store harán más sentido en las próximas lecciones. Por ahora, analiza las sintaxis y entiende cuáles son las habilidades que existen en Move.
    }

    #[test_only]
    use sui::tx_context; // Por ahora, como no estamos trabajando con la blockchain y solo compilando localmente, vamos a simular una transacción para las pruebas

    #[test]
    fun teste() {
        let ctx = &mut tx_context::dummy();

        pratica_drop();
        pratica_copy();
        pratica_copy_drop();
        pratica_key(ctx); // Aquí pasamos la simulación de la transacción que creamos hace poco
        pratica_key_store(ctx);
    }
}