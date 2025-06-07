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

 bl dibuja_cuadrado

	mov x0, x20					// PARTE DEL BAUL
	mov x21, #325 	// (centrado a la mitad de la pantalla)
	mov x22, #280 	
	mov x23, #180	
	mov x24, #200	
	mov x25, #20	
	// no cambio
	bl dibuja_trapecio

	mov x0, x20 				// LUZ 1
	mov x21, #225	
	mov x22, #320	
	mov x23, #40	
	mov x24, #20	
	movz x15, 0xFF00, lsl 00	//amarillo
	movk x15, 0x00FF, lsl 16
	movk x15, 0x00FF, lsl 32
	bl dibuja_cuadrado

	mov x0, x20 				// LUZ 2
	mov x21, #385	
	mov x22, #320	
	mov x23, #40	
	mov x24, #20	
	// no cambio
	bl dibuja_cuadrado

	mov x0, x20 				// PATENTE DEL AUTO
	mov x21, #298	
	mov x22, #320	
	mov x23, #55	
	mov x24, #35	
	movz x15, 0xFFFF, lsl 00	//blanco
	movk x15, 0xFFFF, lsl 16
	movk x15, 0xFFFF, lsl 32
	bl dibuja_cuadrado	

	mov x0, x20	// PARTE DE ARRIBA (TECHO)
	mov x21, #325 	 
	mov x22, #230 	
	mov x23, #140	
	mov x24, #170	
	mov x25, #50	
	movz x15, 0x4010, lsl 00	//rojo anaranjado
	movk x15, 0x00C0, lsl 16
	movk x15, 0x00FF, lsl 16	
	bl dibuja_trapecio

	mov x0, x20					// VENTANA TRASERA
	mov x21, #325 	
	mov x22, #240 	
	mov x23, #120	
	mov x24, #140	
	mov x25, #40	
	movz x15, 0x1E1E, lsl 00    //gris oscuro sombra
	movk x15, 0x001E, lsl 16    
	movk x15, 0x00FF, lsl 32 
	bl dibuja_trapecio

	mov x0, x20	//  SOMBRA
	mov x21, #235	
	mov x22, #385	
	mov x23, #180	
	mov x24, #35	
	bl dibuja_cuadrado

	mov x0, x20 				// RUEDA 1
	mov x21, #235	
	mov x22, #385	
	mov x23, #45	
	mov x24, #30	
	movz x15, 0x00, lsl 00	//negro
	bl dibuja_cuadrado

	mov x0, x20 				// RUEDA 2
	mov x21, #370	
	mov x22, #385	
	mov x23, #45	
	mov x24, #30	
	bl dibuja_cuadrado

	//-------------NUBES-------------//

	movz x15, 0xDCDC, lsl 00	// gris claro
	movk x15, 0xFFDC, lsl 16

	// nube1
        // Círculo central
        mov x3, 135       // centro_x
        mov x4, 85       // centro_y
        mov x5, 35        // radio
        bl dibuja_circulos

        // Círculo izquierda
        mov x3, 85
        mov x4, 90
        mov x5, 30
        bl dibuja_circulos

        // Círculo derecha
        mov x3, 180
        mov x4, 90
        mov x5, 30
        bl dibuja_circulos

        // Círculo arriba izquierda
        mov x3, 105
        mov x4, 60
        mov x5, 30
        bl dibuja_circulos

        // Círculo arriba derecha
        mov x3, 155
        mov x4, 60
        mov x5, 30
        bl dibuja_circulos
        
        // nube2
        mov x3, 430
        mov x4, 100
        mov x5, 25
        bl dibuja_circulos

        mov x3, 405
        mov x4, 105
        mov x5, 23
        bl dibuja_circulos

        mov x3, 455
        mov x4, 105
        mov x5, 23
        bl dibuja_circulos

        mov x3, 415
        mov x4, 85
        mov x5, 20
        bl dibuja_circulos

        mov x3, 445
        mov x4, 85
        mov x5, 20
        bl dibuja_circulos

//------------ ARBOLES --------------
        // ARBOL IZQUIERDA
	mov x21, #75   // x
	mov x22, #200  // y
        mov x24, #70  //alto del cuadrado
        mov x23, #25   //ancho del cuadra
	movz x15, 0x0066, lsl 16   
	movk x15, 0x3300, lsl 00
        bl dibuja_cuadrado

        movz X15, 0x0033, lsl 16   
        movk x15, 0x6600, lsl 00
        mov x3, 70
        mov x4, 110
        mov x5, 25
        bl dibuja_circulos

        mov x3, 110
        mov x4, 110
        mov x5, 25
        bl dibuja_circulos
        
        mov x3, 50
        mov x4, 140
        mov x5, 25
        bl dibuja_circulos

        mov x3, 135
        mov x4, 130
        mov x5, 25
        bl dibuja_circulos

        mov x3, 50
        mov x4, 185
        mov x5, 27
        bl dibuja_circulos
        
        mov x3, 130
        mov x4, 180
        mov x5, 33
        bl dibuja_circulos

        mov x3, 90
        mov x4, 165
        mov x5, 47
        bl dibuja_circulos
        
        //ARBOL DERECHA
         
        mov x21, #525
	mov x22, #200
        mov x24, #100 //alto del cuadrado
        mov x23, #40 //ancho del cuadra
	movz x15, 0x0066, lsl 16   
	movk x15, 0x3300, lsl 00
        bl dibuja_cuadrado

        movz x15, 0x0033, lsl 16   
        movk x15, 0x6600, lsl 00
        mov x3, 510 
        mov x4, 110
        mov x5, 50
        bl dibuja_circulos

        mov x3, 570
        mov x4, 110
        mov x5, 50
        bl dibuja_circulos

        mov x3, 500
        mov x4, 140
        mov x5, 50
        bl dibuja_circulos
        
        mov x3, 500
        mov x4, 140
        mov x5, 50
        bl dibuja_circulos

        mov x3, 585
        mov x4, 145
        mov x5, 50
        bl dibuja_circulos

        mov x3, 500
        mov x4, 190
        mov x5, 50
        bl dibuja_circulos
        
        mov x3, 580
        mov x4, 190
        mov x5, 50
        bl dibuja_circulos

        mov x3, 550
        mov x4, 170
        mov x5, 75
	bl dibuja_circulos

//------------PATENTE-------------------------
        //PRIMER LETRA
        mov x21, #300  // x
	mov x22, #323  // y
        mov x24, #12    //alto del cuadrado
        mov x23, #3    //ancho del cuadra
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #309  
	mov x22, #323  
        mov x24, #12    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #302  
	mov x22, #321  
        mov x24, #3    
        mov x23, #8    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #302  
	mov x22, #334  
        mov x24, #3    
        mov x23, #8    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado
        //SEGUNDA LETRA
        mov x21, #320  
	mov x22, #323  
        mov x24, #12    
        mov x23, #3   	
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #328  
	mov x22, #323  
        mov x24, #12    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #320 
	mov x22, #321  
        mov x24, #3    
        mov x23, #9    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #320  
	mov x22, #334  
        mov x24, #3    
        mov x23, #9    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        //TERCER LETRA
        mov x21, #338  
	mov x22, #323  
        mov x24, #12    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #341  
	mov x22, #321  
        mov x24, #3    
        mov x23, #7    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        
        mov x21, #340  
	mov x22, #334  
        mov x24, #3    
        mov x23, #8    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

	mov x21, #347  
        mov x22, #323  
        mov x24, #3    
        mov x23, #3    
        movz x15, 0x0000, lsl 16
        movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

	mov x21, #347  
        mov x22, #332  
        mov x24, #3    
        mov x23, #3    
        movz x15, 0x0000, lsl 16
        movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

//---------PRIMER NUMERO---------------
        mov x21, #300  
	mov x22, #350  
        mov x24, #3    
        mov x23, #9    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #300  
	mov x22, #347  
        mov x24, #3    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #303 
	mov x22, #344  
        mov x24, #3    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #306  
	mov x22, #341  
        mov x24, #3    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #300  
	mov x22, #339  
        mov x24, #3    
        mov x23, #7    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado
//----------SEGUNDO NUMERO--------------        
        mov x21, #313  
	mov x22, #341  
        mov x24, #11    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

         mov x21, #322  
	mov x22, #341  
        mov x24, #11    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #315  
	mov x22, #339  
        mov x24, #3    
        mov x23, #8    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #315  
	mov x22, #350  
        mov x24, #3    
        mov x23, #8    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado
//-------------TERCER NUMERO-------------
        mov x21, #328  
	mov x22, #350  
        mov x24, #3    
        mov x23, #9    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #328  
	mov x22, #347  
        mov x24, #3    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #331 
	mov x22, #344  
        mov x24, #3    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #334  
	mov x22, #341  
        mov x24, #3    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #328  
	mov x22, #339  
        mov x24, #3    
        mov x23, #7    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado
//---------------CUARTA LETRA-----------------------
        mov x21, #348  
	mov x22, #345  
        mov x24, #6    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #342  
	mov x22, #350  
        mov x24, #3    
        mov x23, #7    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #342  
	mov x22, #344  
        mov x24, #3    
        mov x23, #7   
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #342  
	mov x22, #341  
        mov x24, #7    
        mov x23, #3    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado

        mov x21, #342  
	mov x22, #339  
        mov x24, #3    
        mov x23, #9    
	movz x15, 0x0000, lsl 16   
	movk x15, 0x0000, lsl 00
        bl dibuja_cuadrado
        //-----SUBRUTINAS-----//

dibuja_circulos:
    mul x6, x5, x5        // radio^2
    sub x8, x3, x5        // x_min = centro_x - radio
    add x9, x3, x5        // x_max = centro_x + radio
    sub x11, x4, x5       // y_min = centro_y - radio
    add x12, x4, x5       // y_max = centro_y + radio

loop_circ_y:
    mov x2, x8            // x = x_min
loop_circ_x:
    // dx = x - cx
    sub x13, x2, x3
    mul x13, x13, x13     // dx^2
    // dy = y - cy
    sub x14, x11, x4
    mul x14, x14, x14     // dy^2
    add x7, x13, x14      // dx^2 + dy^2
    cmp x7, x6
    b.ge skip

    // Calcula offset = (y * WIDTH + x) * 4
    mov x16, SCREEN_WIDTH
    mul x17, x11, x16
    add x17, x17, x2
    lsl x17, x17, 2       // * 4
    add x17, x17, x20     // framebuffer + framebuffer base
    stur w15, [x17]       // escribir pixel

skip:
    add x2, x2, 1
    cmp x2, x9
    ble loop_circ_x

    add x11, x11, 1
    cmp x11, x12
    ble loop_circ_y
    ret


dibuja_trapecio:

        // x21: x_start x del centro superior del trapecio (por ejemplo, 320 si e
        // x22: y_start y inicial (arriba del trapecio)
        // x23: ancho superior
        // x24: ancho inferior
        // x25: altura
        // x15: color

        mov x10, #0             // fila y actual (dy)
loop_trp_y:

        // para calcular el ancho de cada fila:
        // ancho_actual = a_sup + (a_inf - a_sup) * (dy / altura)

        sub x11, x24, x23               // a_inf - a_sup
        mul x11, x11, x10               // (a_inf - a_sup) * dy
        udiv x11, x11, x25              // (a_inf - a_sup) * dy / altura
        add x11, x11, x23               // ancho actual = a_sup + (a_inf - a_sup)

        // calculo donde va a empezar a pintar (x_offset)
        // x_offset = x_start - ancho_actual / 2
        lsr x13, x11, #1
        sub x12, x21, x13

        // y = y_start + dy
        add x4, x22, x10

        // NOTA: x11: ancho_actual
        //               x13: mitad del ancho
        //               x12: coordenada x inicial de la fila actual

        // Ciclo para columnas
    mov x9, #0          // columna x actual (dx)

loop_trp_x:
    add x3, x12, x9     // x = x_offset  + col

        // Dirección = base + 4 * (x + y * SCREEN_WIDTH)
    mov x7, #640
    mul x8, x4, x7
    add x8, x8, x3
    lsl x8, x8, #2
    add x8, x0, x8

        stur w15, [x8]

        add x9, x9, #1
    cmp x9, x11                 // dx < ancho_actual
    blt loop_trp_x

    // siguiente fila
    add x10, x10, #1
    cmp x10, x25                // dy < altura
    blt loop_trp_y

    ret

dibuja_cuadrado:

        // coordenadas en las que empieza, alto y ancho del cuadrado
        // x21  x_start 
        // x22  y_start
        // x23  ancho
        // X24  alto
        // x15  color

        // inicializo filas y columnas (es como un ciclo anidado)
        mov x25, #0     // dir_y = 0 (filas)
loop4:
        mov x26, #0             // dir_x = 0 (columnas)
loop3:

        // calculo coordenadas 
        add x3, x26, x21        // x
        add x4, x25, x22        // y

        // calculo direccion en memoria
        // Dirección = Dirección de inicio + 4 * [x + (y * 640)] 

        mov x6, #640
        mul x5, x4, x6  // y * 640->(SCREEN_WIDTH)
        add x5, x5, x3                          // x + (y*640)
        lsl x5, x5, #2                          // 4*(x+(y*640))
        add x7, x0, x5                          // dir base + 4 * [x + (y * 640)]

        stur w15, [x7]          // pinto el pixel de negro

        // sumo 1 a las columnas
        add x26, x26, #1
        cmp x26, x23
        b.lt loop3

        // sumo 1 a las filas
        add x25, x25, #1
        cmp x25, x24
        b.lt loop4
        
        ret

dibuja_triangulo:
    // x21: x_start
    // x22: y_start
    // x23: base (ancho de la base del triángulo)
    // x24: altura (altura del triángulo)
    // x15: color (nuevo parámetro para el color)

    mov x10, 0  // fila y actual (dy)
loop_tri_y:

    // Calculo el ancho de cada fila según la proporción de la altura
    // ancho_actual = base * (dy / altura)

    mul x11, x23, x10   // base * dy
    udiv x11, x11, x24  // (base * dy) / altura

    // Calcula la posición de inicio de la fila actual
    // x_offset = x_start - ancho_actual / 2
    lsr x13, x11, 1
    sub x12, x21, x13

    // y = y_start + dy
    add x4, x22, x10

    // Ciclo para columnas
    mov x9, 0  // columna x actual (dx)

loop_tri_x:
    add x3, x12, x9  // x = x_offset + col

    // Dirección = base + 4 * (x + y * SCREEN_WIDTH)
    mov x7, SCREEN_WIDTH
    mul x8, x4, x7
    add x8, x8, x3
    lsl x8, x8, 2
    add x8, x0, x8

    stur w15, [x8]  // colorear el pixel con x15

    add x9, x9, 1
    cmp x9, x11  // dx < ancho_actual
    blt loop_tri_x
    // siguiente fila
    add x10, x10, 1
    cmp x10, x24  // dy < altura
    blt loop_tri_y

    ret

        //---------------------------------------------------------------
        // Infinite Loop

InfLoop:
	b InfLoop
