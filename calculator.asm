section .data
    Msg1 db "(1) SUMA -> RESULTADO = A + B $"
    CRLF db 0x0D, 0x0A

section .bss
    resultado resb 10
    numero1 resb 10
    operacion resb 1
    numero2 resb 10

section .text
    global _start

_start:
    mov dx, Msg1
    call WriteLn

    ; Leer el primer número
    mov dx, numero1
    call Read

    ; Leer la operación
    mov dx, operacion
    call Read

    ; Leer el segundo número
    mov dx, numero2
    call Read

    ; Realizar la operación
    cmp byte [operacion], '+'
    je suma
    cmp byte [operacion], '-'
    je resta
    cmp byte [operacion], '*'
    je multiplicacion
    cmp byte [operacion], '/'
    je division

    ; Si la operación no es válida, mostrar un mensaje de error
    mov dx, "Operación no válida"
    call WriteLn
    jmp exit

suma:
    mov al, [numero1]
    add al, [numero2]
    mov [resultado], al
    jmp mostrar_resultado

resta:
    mov al, [numero1]
    sub al, [numero2]
    mov [resultado], al
    jmp mostrar_resultado

multiplicacion:
    ; Implementar la multiplicación como sumas repetidas
    ; (no se utiliza la instrucción 'mul')
    ; ...

division:
    ; Implementar la división como restas repetidas
    ; (no se utiliza la instrucción 'div')
    ; ...

mostrar_resultado:
    mov dx, resultado
    call WriteLn

exit:
    ; Salir del programa
    mov eax, 1
    int 0x80

WriteLn:
    ; Imprimir cadena usando la función 'write'
    ; ...

Read:
    ; Leer entrada del usuario
    ; ...

; Otras funciones auxiliares (implementar según sea necesario)
