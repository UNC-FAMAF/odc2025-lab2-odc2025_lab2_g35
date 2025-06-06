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

//------------------------------------------------ SUBRUTINAS -------------------------------------------------//

//------------------------------------------------ SUB AUTO -------------------------------------------------//
dibuja_auto:
 str x30, [sp, #-16]!
  //--------- PARTE DE LUCES Y PATENTE --------//
 mov x21, #225
 mov x22, #300
 mov x23, #200
 mov x24, #60
 movz x15, 0x0000, lsl 00 // rojo
 movk x15, 0x00C8, lsl 16
 movk x15, 0x00FF, lsl 32
 bl dibuja_cuadrado

//-------------- PARTE DE ABAJO ---------------//
 mov x21, #222
 mov x22, #360
 mov x23, #205
 mov x24, #25
 movz x15, 0x4010, lsl 00 // rojo anaranjado
 movk x15, 0x00C0, lsl 16
 movk x15, 0x00FF, lsl 16
 bl dibuja_cuadrado

 //------------------- PARTE DEL BAUL --------------------//
 mov x21, #325
 mov x22, #280
 mov x23, #180
 mov x24, #200
 mov x25, #20
 bl dibuja_trapecio

//----------------- LUZ 1 ----------------//
 mov x21, #225
 mov x22, #320
 mov x23, #40
 mov x24, #20
 movz x15, 0xFF00, lsl 00 // amarillo
 movk x15, 0x00FF, lsl 16
 movk x15, 0x00FF, lsl 32
 bl dibuja_cuadrado

//---------------- LUZ 2 ----------------//
 mov x21, #385
 mov x22, #320
 mov x23, #40
 mov x24, #20
 bl dibuja_cuadrado

//----------- PATENTE DEL AUTO ------------//
 mov x21, #298
 mov x22, #320
 mov x23, #55
 mov x24, #35
 movz x15, 0xFFFF, lsl 00 // blanco
 movk x15, 0xFFFF, lsl 16
 movk x15, 0xFFFF, lsl 32
 bl dibuja_cuadrado

 //--------- PARTE DE ARRIBA (TECHO) ------------//
 mov x21, #325
 mov x22, #230
 mov x23, #140
 mov x24, #170
 mov x25, #50
 movz x15, 0x4010, lsl 00 // rojo anaranjado
 movk x15, 0x00C0, lsl 16
 movk x15, 0x00FF, lsl 16
 bl dibuja_trapecio

 //-------------- VENTANA TRASERA -----------------//
 mov x21, #325
 mov x22, #240
 mov x23, #120
 mov x24, #140
 mov x25, #40
 movz x15, 0x1E1E, lsl 00 // gris oscuro sombra
 movk x15, 0x001E, lsl 16
 movk x15, 0x00FF, lsl 32
 bl dibuja_trapecio

 //-------- RUEDA 1 ------------//
 mov x21, #235
 mov x22, #385
 mov x23, #45
 mov x24, #30
 movz x15, 0x00, lsl 00 // negro
 bl dibuja_cuadrado

 //-------- RUEDA 2 ----------//
 mov x21, #370
 bl dibuja_cuadrado


InfLoop:
	b InfLoop
