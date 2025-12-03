module suiz3::tipos_primitivos {
    use std::debug::print;

    fun pratica() {
        // Enteros (Integers)
        let a = 1; // Cuando el tipo de dato no es especificado, el compilador asume u64.
        print(&a); // Resultado: [debug] 1

        let b: u8 = 2; // Puedes especificar el tipo al declarar la variable.
        print(&b); // Resultado: [debug] 2

        let c = 3u16; // O puedes declarar el valor usando literales.
        print(&c); // Resultado: [debug] 3

        let d = 1_123_456; // Puedes usar guion bajo _ para separar números largos para mejorar la lectura.
        print(&d); // Resultado: [debug] 1123456

        let e: u32 = 0xCAFE; // También puedes escribir literales en hexadecimal.
        print(&e); // Resultado: [debug] 51966

        let f = 0xBE_BE_FE_00; // Y separarlos usando guion bajo.
        print(&f); // Resultado: [debug] 3200187904

        // Operaciones
        let numero_1 = 2;
        let numero_2 = 4;
        let _soma = numero_1 + numero_2; // 6
        let _subtracao = numero_2 - numero_1; // 2
        let _multiplicacao = numero_1 * numero_2; // 8
        let _divisao = numero_2 / numero_1; // 2
        let _modulo = numero_2 % numero_1; // 0

        // Recuerda que los tipos de ambas variables deben ser iguales.
        let numero_3: u8 = 1;
        let numero_4: u8 = 4;
        let _outra_soma = numero_3 + numero_4; //5

        // Comparaciones e igualdades
        let menor_que = numero_3 < numero_4; // true
        let _menor_ou_igual = numero_3 <= numero_4; // true
        let _maior_que = numero_3 > numero_4; // false
        let _maior_ou_igual = numero_3 >= numero_4; // false
        let _igual = numero_3 == numero_4; // false
        let _nao_igual = numero_3 != numero_4; // true
        print(&menor_que); // Resultado: [debug] true. Recuerda que el resultado de una comparación retorna un bool.

        // Conversión (Cast)
        let um_u8: u8 = 100;
        let _converte_para_u16 = (um_u8 as u16);

        // Bool
        let and = true && false; // Necesita que ambos valores sean verdaderos.
        print(&and); // Resultado: [debug] false

        let or = true || false; // Necesita que cualquiera de los valores sea verdadero.
        print(&or); // Resultado: [debug] true
        
        let negacao = !true; // Invierte el valor.
        print(&negacion); // Resultado: [debug] false

        
    }

    #[test]
    fun teste() {
        pratica();
    }
}