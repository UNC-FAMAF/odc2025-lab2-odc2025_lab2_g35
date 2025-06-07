	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

// CIELO
	movz x15, 0x95ED, lsl 00
	movk x15, 0xFF64, lsl 16   // Color ARGB: celeste cielo

	mov x2, SCREEN_HEIGH/2        // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w15,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

        //--------MONTAÑAS--------//

	//----MONTAÑA 1----//
        mov x0, x20   
        mov x21, 280  // posición x 
        mov x22, 100  // posición y
        mov x23, 250  // ancho de la base
        mov x24, 180  // altura
        movz x15, 0x4321, lsl 00  // color marron montaña
        movk x15, 0x65, lsl 16
        bl dibuja_triangulo

        mov x0, x20	//esto es la nieve en la parte superior de la montaña
        mov x21, 280	
        mov x22, 100	
        mov x23, 70
        mov x24, 50	
        movz x15, 0xE0E0, lsl 00
        movk x15, 0xE0, lsl 16	//color blanco
        bl dibuja_triangulo

	//----MONTAÑA 2----//
	mov x0, x20
	mov x21, 350	
	mov x22, 140	
	mov x23, 250	
	mov x24, 180	
	movz x15, 0x4321, lsl 00
	movk x15, 0x65, lsl 16
	bl dibuja_triangulo

	mov x0, x20
	mov x21, 350	
	mov x22, 140	
	mov x23, 56	
	mov x24, 40	
	movz x15, 0xE0E0, lsl 00
	movk x15, 0xE0, lsl 16
	bl dibuja_triangulo

	//----MONTAÑA 3----//
        mov x0, x20	
        mov x21, 170	
        mov x22, 180	
        mov x23, 120	
        mov x24, 70	
        movz x15, 0x4321, lsl 00
        movk x15, 0x65, lsl 16
        bl dibuja_triangulo

	mov x0, x20
        mov x21, 170	
        mov x22, 180	
        mov x23, 35	
        mov x24, 20	
        movz x15, 0xE0E0, lsl 00
        movk x15, 0xE0, lsl 16
        bl dibuja_triangulo

	//----MONTAÑA 4----//
        mov x0, x20
        mov x21, 5	
        mov x22, 200	
        mov x23, 120	
        mov x24, 70	
        movz x15, 0x4321, lsl 00
        movk x15, 0x65, lsl 16
        bl dibuja_triangulo

	mov x0, x20
        mov x21, 5	
        mov x22, 200	
        mov x23, 23	
        mov x24, 13	
        movz x15, 0xE0E0, lsl 00
        movk x15, 0xE0, lsl 16
        bl dibuja_triangulo

	//----MONATAÑA 5----//
	mov x0, x20
        mov x21, 450	
        mov x22, 160	
        mov x23, 120	
        mov x24, 80	
        movz x15, 0x4321, lsl 00
        movk x15, 0x65, lsl 16
        bl dibuja_triangulo

	mov x0, x20
        mov x21, 450	
        mov x22, 160	
        mov x23, 45	
        mov x24, 30	
        movz x15, 0xE0E0, lsl 00
        movk x15, 0xE0, lsl 16
        bl dibuja_triangulo

	//----MONTAÑA 6----//
	mov x0, x20
        mov x21, 90	
        mov x22, 160	
        mov x23, 120	
        mov x24, 80	
        movz x15, 0x4321, lsl 00
        movk x15, 0x65, lsl 16
        bl dibuja_triangulo

	//----MONTAÑA 7----//
	mov x0, x20
        mov x21, 545	
        mov x22, 160	
        mov x23, 120	
        mov x24, 80	
        movz x15, 0x4321, lsl 00
        movk x15, 0x65, lsl 16
        bl dibuja_triangulo

// PASTO
	movz x15, 0x8E23, lsl 0      
	movk x15, 0xFF6B, lsl 16       // color verde oliva
	mov x0, x20
	mov x10, #640
	mov x11, #240
	mul x11, x11, x10        // x11 = 240 * 640
	lsl x11, x11, #2         // x11 *= 4 → offset en bytes
	add x0, x0, x11          // x0 apunta a la mitad de la pantalla
	
	mov x2, SCREEN_HEIGH/2        // Y Size
loop1b:
	mov x1, SCREEN_WIDTH         // X Size
loop0b:
	stur w15,[x0]  
	add x0,x0,4	   
	sub x1,x1,1	  
	cbnz x1,loop0b  
	sub x2,x2,1	  
	cbnz x2,loop1b  


	// CALLE
	mov x0, x20
	mov x21, #320 // (centrado a la mitad de la pantalla)
	mov x22, #240 // (centrado a la mitad de la pantalla)
	mov x23, #150
	mov x24, #620
	mov x25, #240
	movz x15, 0x2828, lsl 00    //gris re oscuro
	movk x15, 0x0028, lsl 16    
	movk x15, 0x00FF, lsl 32    
	bl dibuja_trapecio

// LINEAS DE LA CALLE
	mov x0, x20						// LINEA 3
	mov x21, #320 	 
	mov x22, #410 	
	mov x23, #60	
	mov x24, #85	
	mov x25, #70	
	movz x15, 0xFF00, lsl 00	//amarillo
	movk x15, 0x00FF, lsl 16
	movk x15, 0x00FF, lsl 32
	bl dibuja_trapecio	

	// AUTO
	mov x0, x20 	// PARTE DE LUCES Y PATENTE
	mov x21, #225	
	mov x22, #300	
	mov x23, #200	
	mov x24, #60	
	movz x15, 0x0000, lsl 00    //rojo
	movk x15, 0x00C8, lsl 16    
	movk x15, 0x00FF, lsl 32    
	bl dibuja_cuadrado

	mov x0, x20						//  PARTE DE ABAJO
	mov x21, #222	// donde
	mov x22, #360	// empieza
	mov x23, #205	// ancho
	mov x24, #25	// largo
	movz x15, 0x4010, lsl 00	//rojo anaranjado
	movk x15, 0x00C0, lsl 16
	movk x15, 0x00FF, lsl 16
	bl dibuja_cuadrado

InfLoop:
	b InfLoop
