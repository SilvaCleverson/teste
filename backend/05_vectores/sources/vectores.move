module suiz3::vetores {
    use std::debug::print;
    use std::vector::{empty, length, borrow, borrow_mut, push_back}; // Solo para crear un vector, no es necesario importar la biblioteca.
    // Pero las operaciones de los vectores (como push, pop_back) necesitan que la importes.

    fun pratica() {
        // Vectores
        let _vazio: vector<u64> = vector[]; // Un vector vacío.
        let _vazio2 = empty<u32>(); // Otra forma de crear un vector vacío.
        let _v1: vector<u8> = vector[10, 20, 30]; // Un vector de u8 inicializado con 3 elementos.
        let _v2: vector<vector<u16>> = vector[
            vector[10, 20],
            vector[30, 40]
        ]; // Un vector de vectores u16 inicializado con 2 elementos, cada uno con 2 elementos.

        // Operaciones
        let v3: vector<u8> = vector[1, 2, 3];

        let elemento = *borrow(&v3, 0); // Obteniendo el primer elemento del vector.
        print(&elemento); // Resultado: [debug] 1

        let comprimento = length(&v3); // Obteniendo la longitud del vector.
        print(&comprimento); // Resultado: [debug] 3

        *borrow_mut(&mut v3, 1) = 55; // Sustituyendo un valor en el vector.
        print(borrow(&v3, 1)); // Resultado: [debug] 55

        push_back(&mut v3, 40); // Agregando un elemento al final del vector.
        print(borrow(&v3, 3)); // Resultado: [debug] 40

        // Recuerda que puedes obtener información sobre las demás operaciones en:
        // https://github.com/sui-labs/sui-core/blob/main/sui-move/framework/move-stdlib/doc/vector.md
    }

    #[test]
    fun teste() {
        pratica();
    }
}