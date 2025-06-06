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

 //------------------------------------------ PATENTE ------------------------------------------------------------//

 //---------- PRIMER LETRA -----------//
 mov x21, #300
 mov x22, #323
 mov x24, #12
 mov x23, #3
 movz x15, 0x0000, lsl 00
 bl dibuja_cuadrado

 mov x21, #309
 bl dibuja_cuadrado

 mov x21, #302
 mov x22, #321
 mov x24, #3
 mov x23, #8
 bl dibuja_cuadrado

 mov x22, #334
 bl dibuja_cuadrado

 //--------- SEGUNDA LETRA ------------//
 mov x21, #320
 mov x22, #323
 mov x24, #12
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #328
 bl dibuja_cuadrado

 mov x21, #320
 mov x22, #321
 mov x24, #3
 mov x23, #9
 bl dibuja_cuadrado

 mov x22, #334 // y
 bl dibuja_cuadrado

 //--------- TERCER LETRA -----------//
 mov x21, #338
 mov x22, #323
 mov x24, #12
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #341
 mov x22, #321
 mov x24, #3
 mov x23, #7
 bl dibuja_cuadrado

 mov x21, #340
 mov x22, #334
 mov x23, #8
 bl dibuja_cuadrado

 mov x21, #347
 mov x22, #323
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #347
 mov x22, #332
 bl dibuja_cuadrado

 //--------- PRIMER NUMERO ----------//
 mov x21, #300
 mov x22, #350
 mov x23, #9
 bl dibuja_cuadrado

 mov x22, #347
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #303
 mov x22, #344
 bl dibuja_cuadrado

 mov x21, #306
 mov x22, #341
 bl dibuja_cuadrado

 mov x21, #300
 mov x22, #339
 mov x23, #7
 bl dibuja_cuadrado

 //-------- SEGUNDO NUMERO ----------//
 mov x21, #313
 mov x22, #341
 mov x24, #11
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #322
 bl dibuja_cuadrado

 mov x21, #315
 mov x22, #339
 mov x24, #3
 mov x23, #8
 bl dibuja_cuadrado

 mov x22, #350
 bl dibuja_cuadrado

 //---------- TERCER NUMERO ----------//
 mov x21, #328
 mov x22, #350
 mov x24, #3
 mov x23, #9
 bl dibuja_cuadrado

 mov x22, #347
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #331
 mov x22, #344
 bl dibuja_cuadrado

 mov x21, #334
 mov x22, #341
 bl dibuja_cuadrado

 mov x21, #328
 mov x22, #339
 mov x23, #7
 bl dibuja_cuadrado

 //---------- CUARTO NUMERO -------------//
 mov x21, #348
 mov x22, #345
 mov x24, #6
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #342
 mov x22, #350
 mov x24, #3
 mov x23, #7
 bl dibuja_cuadrado

 mov x21, #342
 mov x22, #344
 bl dibuja_cuadrado

 mov x22, #341
 mov x24, #7
 mov x23, #3
 bl dibuja_cuadrado

 mov x21, #342
 mov x22, #339
 mov x24, #3
 mov x23, #9
 bl dibuja_cuadrado
ldr x30, [sp], #16
ret

//----------------------------------------- SUB MONTAÑAS ------------------------------------------------------//

dibuja_montañas:

 str x30, [sp, #-16]!

 //---------------------- MONTAÑA 1 ----------------------//
 mov x21, 280 // posición x
 mov x22, 70 // posición y
 mov x23, 190 // ancho de la base
 mov x24, 170 // altura
 movz x15, 0x4321, lsl 00 // color marron montaña
 movk x15, 0x65, lsl 16
 bl dibuja_triangulo

 //---------------------- MONTAÑA 2 ---------------------//
 mov x21, 350
 mov x22, 100
 mov x23, 180
 mov x24, 140
 bl dibuja_triangulo

 //---------------------- MONTAÑA 3 --------------------//
 mov x21, 170
 mov x22, 170
 mov x23, 120
 mov x24, 70
 bl dibuja_triangulo

 //---------------------- MONTAÑA 4 --------------------//
 mov x21, 5
 mov x22, 191
 mov x23, 100
 mov x24, 50
 bl dibuja_triangulo

 //---------------------- MONATAÑA 5 -------------------//
 mov x21, 450
 mov x22, 160
 mov x23, 120
 mov x24, 80
 bl dibuja_triangulo

 //---------------------- MONTAÑA 6 -------------------//
 mov x21, 90  
 bl dibuja_triangulo

 //---------------------- MONTAÑA 7 ------------------//
 mov x21, 545
 bl dibuja_triangulo

//----------------- PARTES NEVADAS -------------------//

 mov x21, 280  
 mov x22, 70    
 mov x23, 59  
 mov x24, 50  
 movz x15, 0xE0E0, lsl 00
 movk x15, 0xE0, lsl 16     //color blanco
 bl dibuja_triangulo

 mov x21, 350
 mov x22, 100
 mov x23, 65
 bl dibuja_triangulo

 mov x21, 170
 mov x22, 170
 mov x23, 35
 mov x24, 20
 bl dibuja_triangulo

 mov x21, 5
 mov x22, 191
 mov x23, 48
 mov x24, 24
 bl dibuja_triangulo

 mov x21, 450
 mov x22, 160
 mov x23, 45
 mov x24, 30
 bl dibuja_triangulo

 mov x21, 90
 mov x22, 160
 mov x23, 35
 mov x24, 20
 bl dibuja_triangulo

 mov x21, 545
 bl dibuja_triangulo
 
 ldr x30, [sp], #16

 ret

 //------------------------------------------------ SUB NUBES ----------------------------------------------//
dibuja_nubes:
 // x0 base_fb
 // x21 x_base
 // x22 y_base
 // x15 color

 str x30, [sp, #-16]! // x30 return address

 // círculo central
 mov x3, x21
 mov x4, x22
 mov x5, #30
 bl dibuja_circulos

 // círculo izquierda
 sub x3, x21, #25
 add x4, x22, #5
 mov x5, #25
 bl dibuja_circulos

 // círculo derecha
 add x3, x21, #25
 add x4, x22, #5
 bl dibuja_circulos

 // círculo arriba izquierda
 sub x3, x21, #10
 sub x4, x22, #15
 bl dibuja_circulos

 // círculo arriba derecha
 add x3, x21, #10
 sub x4, x22, #15
 bl dibuja_circulos

 ldr x30, [sp], #16

 ret

//------------------------------------------------- SUB CIRCULOS ----------------------------------------//
dibuja_circulos:
 mul x6, x5, x5 // radio^2
 sub x8, x3, x5 // x_min = centro_x - radio
 add x9, x3, x5 // x_max = centro_x + radio
 sub x11, x4, x5 // y_min = centro_y - radio
 add x12, x4, x5 // y_max = centro_y + radio

loop_circ_y:
 mov x2, x8 // x = x_min
loop_circ_x:
 // dx = x - cx
 sub x13, x2, x3
 mul x13, x13, x13 // dx^2
 // dy = y - cy
 sub x14, x11, x4
 mul x14, x14, x14 // dy^2
 add x7, x13, x14 // dx^2 + dy^2
 cmp x7, x6
 b.ge skip

 // Calcula offset = (y * WIDTH + x) * 4
 mov x16, SCREEN_WIDTH
 mul x17, x11, x16
 add x17, x17, x2
 lsl x17, x17, 2 // * 4
 add x17, x17, x20 // framebuffer + framebuffer base
 stur w15, [x17] // escribir pixel

skip:
 add x2, x2, 1
 cmp x2, x9
 ble loop_circ_x

 add x11, x11, 1
 cmp x11, x12
 ble loop_circ_y
 ret

InfLoop:
	b InfLoop
