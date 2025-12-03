module suiz3::structs {
    use std::debug::print;
    use std::string::{String,utf8};
    use std::option::{Option, some};

    // Haz una anotación mental de `has drop`. Veremos esto más adelante. Por ahora, no es necesario que entiendas.
    struct Autor has drop { // Declaramos un struct. Es un tipo personalizado que podemos usar en el resto de nuestro código.
        nome: String, // Este tipo tiene solo un campo.
    }

    struct Livro { // Ahora creamos un tipo con más campos.
        titulo: String,
        autor: Autor, // Nota que usamos el tipo que declaramos arriba.
        publicado: u16,
        tem_audiolivro: bool,
        edicao: Option<u16>, // ¿Qué es esto?
    } // Nota que no cerramos con ;

    fun pratica() {
        
        let autor = Autor { nome: utf8(b"Paulo Coelho") };
        print(&autor); // Nota que usamos debug_string de la lección anterior para imprimir el struct completo.
        // Resultado:
        // [debug] "0x5a6f6e612054726573::structs::Autor {
        //   nome: \"Paulo Coelho\"
        // }"

        let livro = Livro {
            titulo: utf8(b"O Alquimista"), // Usamos , similar a cuando declaramos un objeto en otros lenguajes.
            autor, // Como la variable que declaramos arriba tiene el mismo nombre que la propiedad, no es necesario poner algo como autor: autor,
            publicado: 1988u16, // Recuerda que podemos especificar el tipo del número literalmente
            tem_audiolivro: true,
            edicao: some(1), // O dejar que el compilador infiera
        }; // Tenemos que cerrar el bloque aquí.

        print(&livro); // Nota la impresión del campo Autor.
        //[debug] "0x5a6f6e612054726573::structs::Livro {
        //  titulo: \"O Alquimista\",
        //  autor: 0x5a6f6e612054726573::structs::Autor {
        //    nome: \"Paulo Coelho\"
        //  },
        //  publicado: 1988,
        //  tem_audiolivro: true,
        //  edicao: Some(1)
        //}"

        // Podemos acceder a valores específicos de la estructura.
        print(&livro.titulo); 
        print(&livro.autor.nome);

        // También podemos desestructurar un struct.
        let Livro { titulo: _, autor: _ , publicado, tem_audiolivro, edicao:_ } = livro; 
        // Básicamente, tomamos un struct y lo descomponemos en variables, para que puedan ser usadas después, por ejemplo:
        print(&publicado); // Resultado: [debug] 1988
        print(&tem_audiolivro); // Resultado: [debug] true

        // Nota que estamos ignorando ciertos valores de esta forma: titulo: _, para que no sean creadas variables para ellos.
        // Lo que significa que este código fallaría: print(&titulo);
        // Pues no creamos una variable para ese valor, simplemente lo ignoramos.

        let autor = Autor { nome: utf8(b"J. K. Rowling") }; // Shadowing de la variable autor.
        let Autor { nome: outro_nome } = autor; // Al desestructurar, puedes cambiar el nombre de la variable.
        print(&outro_nome); // Resultado: [debug] "J. K. Rowling"

        let Autor { nome } = Autor { nome: utf8(b"John Green") }; // Podemos incluso asignar valores y desestructurarlos al mismo tiempo:
        print(&nome); // Resultado: [debug] "John Green"

        // O crear nuevas referencias:
        let autor = Autor { nome: utf8(b"Octavio Paz") };
        let Autor { nome } = &autor; // Referencia inmutable
        print(nome); // Ahora nome es un tipo referenciado. Resultado: [debug] "Octavio Paz"

        let autor = Autor { nome: utf8(b"Carlos Fuentes") };
        let Autor { nome } = &mut autor; // Creamos una referencia mutable
        print(nome); // Resultado: [debug] "Carlos Fuentes"
        *nome = utf8(b"Edgar Allan Poe"); // Como es mutable, podemos modificar el valor
        print(nome); // Resultado: [debug] "Edgar Allan Poe"

        // Referencias
        let autor = Autor { nome: utf8(b"George Orwell") };
        let autor_ref = &autor;

        let leitura = autor_ref.nome; // Podemos leer un valor a través de la referencia.
        print(&leitura); // Resultado: [debug] "George Orwell"

        let modificavel = &mut autor.nome;
        *modificavel = utf8(b"Charles Dickens"); // Y podemos modificarla
        print(modificavel); // Resultado: [debug] "Charles Dickens"
        print(&autor); // Estamos haciendo una referencia al valor directamente, por lo tanto:
        // Resultado:
        // [debug] "0x5a6f6e612054726573::structs::Autor {
        //   nome: \"Charles Dickens\"
        // }"

        // Recuerda que puedes obtener información sobre las demás operaciones en:
        // https://move-language.github.io/move/structs-and-resources.html
    }

    #[test]
    fun teste() {
        pratica();
    }
}