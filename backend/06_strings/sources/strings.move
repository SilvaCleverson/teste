module suiz3::strings {
    use std::debug::print;
    use std::string::{utf8, is_empty, append, append_utf8, insert};

    fun pratica() {
        // Strings
        
        // Bytes
        let string_bytes = b"Hello World!";
        print(&string_bytes); // Resultado: [debug] 0x48656c6c6f20576f726c6421
        print(&utf8(string_bytes)); // Resultado: [debug] "Hello World!"
        
        // Hex
        let string_hexadecimal = x"48656C6C6F20576F726C6421";
        print(&string_hexadecimal); // Resultado: [debug] 0x48656c6c6f20576f726c6421 ¿Notas alguna semejanza?
        print(&utf8(string_hexadecimal)); // Resultado: [debug] "Hello World!"

        // Operaciones
        let string_vazia = b"";
        let validacao = is_empty(&utf8(string_vazia)); // Validando si la string está vacía
        print(&validacao); // Resultado: [debug] true

        let string_utf8 = utf8(string_vazia);
        append_utf8(&mut string_utf8, b"Hola"); // Concatenando 2 strings utf8. Nota que pasamos una referencia mutable.
        print(&string_utf8); // Resultado: [debug] "Hola"

        let outra_string = utf8(b"Adios");
        append(&mut string_utf8, outra_string); // Concatenando 2 strings.
        print(&string_utf8); // Resultado: [debug] "HolaAdios"

        let hex_para_utf8 = utf8(string_hexadecimal);
        append(&mut string_utf8, hex_para_utf8); // Recuerda que puedes usar tanto bytes como hex.
        print(&string_utf8); // Resultado: [debug] "HolaAdiosHello World!"

        let intruso = utf8(b"INSERTAR-ME");
        insert(&mut string_utf8, 3, intruso); // Insertando una string.
        print(&string_utf8); // Resultado: [debug] "HolINSERTAR-MEAdiosHello World!"

        let escape = utf8(b"\nEsto sera impreso en una nueva linea.");
        append(&mut string_utf8, escape);
        print(&string_utf8); // Resultado: [debug] "HolINSERTAR-MEAdiosHello World!
                            //            Esto sera impreso en una nueva linea."
    }

    #[test]
    fun teste() {
        pratica();
    }
}