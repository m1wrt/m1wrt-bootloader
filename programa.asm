[BITS 16]
[ORG 0x7C00]

; Programado por: m1wrt

start:
    mov si, msg          ; Cargar la dirección del mensaje en SI
	call print_string    ; Llamar a la función para imprimir el mensaje

hang:
    jmp hang             ; Bucle infinito para detener la ejecución

print_string:
    mov ah, 0x0E         ; Función de BIOS para imprimir un carácter
.next_char:
    lodsb                ; Cargar el siguiente byte en AL
    cmp al, 0            ; ¿Es el byte nulo?
    je .done             ; Si es nulo, terminar
    int 0x10             ; Llamar a la interrupción de BIOS para imprimir
    jmp .next_char       ; Repetir para el siguiente carácter
.done:
    ret                  ; Retornar de la función

msg db 'Hola mundo!', 0 ; El mensaje a imprimir, terminado en nulo

times 510-($-$$) db 0    ; Rellenar con ceros hasta 510 bytes
dw 0xAA55                ; Firma de arranque

