.equ SCREEN_WIDTH, 640
 .equ SCREEN_HEIGH, 480
 .equ BITS_PER_PIXEL, 32

 .equ GPIO_BASE, 0x3f200000
 .equ GPIO_GPFSEL0, 0x00
 .equ GPIO_GPLEV0, 0x34

 .globl main

main:
 mov x20, x0 // Guarda la dirección base del framebuffer en x20 (x0 contiene la direccion base del framebuffer)

 //---------------------------------------------- CIELO ---------------------------------------------------------//
 movz x15, 0x95ED, lsl 00
 movk x15, 0xFF64, lsl 16 // Color ARGB: celeste cielo

 mov x2, SCREEN_HEIGH/2 // Y Size
loop1:
 mov x1, SCREEN_WIDTH // X Size
loop0:
 stur w15,[x0] // Colorear el pixel N
 add x0,x0,4 // Siguiente pixel
 sub x1,x1,1 // Decrementar contador X
 cbnz x1,loop0 // Si no terminó la fila, salto
 sub x2,x2,1 // Decrementar contador Y
 cbnz x2,loop1 // Si no es la última fila, salto

 //----------------------------------------- PASTO -------------------------------------------------------------//
 movz x15, 0x8E23, lsl 0
 movk x15, 0xFF6B, lsl 16 // color verde oliva
 mov x0, x20
 mov x10, #640
 mov x11, #240
 mul x11, x11, x10 // x11 = 240 * 640
 lsl x11, x11, #2 // x11 *= 4 → offset en bytes
 add x0, x0, x11 // x0 apunta a la mitad de la pantalla
 
 mov x2, SCREEN_HEIGH/2 // Y Size
loop1b:
 mov x1, SCREEN_WIDTH // X Size
loop0b:
 stur w15,[x0] // Colorear el pixel N
 add x0,x0,4 // Siguiente pixel
 sub x1,x1,1 // Decrementar contador X
 cbnz x1,loop0b // Si no terminó la fila, salto
 sub x2,x2,1 // Decrementar contador Y
 cbnz x2,loop1b // Si no es la última fila, salto

 mov x0, x20

  //------------------------------------------------- CALLE -----------------------------------------------------//
 
 mov x21, #320 // (centrado a la mitad de la pantalla)
 mov x22, #240 // (centrado a la mitad de la pantalla)
 mov x23, #150
 mov x24, #620
 mov x25, #240
 movz x15, 0x2828, lsl 00 //gris re oscuro
 movk x15, 0x0028, lsl 16
 movk x15, 0x00FF, lsl 32
 bl dibuja_trapecio

mov x27, #300  
b loop_animacion


InfLoop:
	b InfLoop
