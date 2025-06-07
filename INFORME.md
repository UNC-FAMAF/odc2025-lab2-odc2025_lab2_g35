Nombre y apellido 
Integrante 1: Yuliana Micaela Aráoz
Integrante 2: Lucas Nicolás Olmos
Integrante 3: Gabriel Agustín Mansilla
Integrante 4: Tsue Ivonne Motosono Pereda


Descripción ejercicio 1: Imagen de un auto anaranjado viajando por una carretera hacia las sierras.


Descripción ejercicio 2: Animación del mismo auto anaranjado viajando por la carretera hacia las sierras.


Justificación instrucciones ARMv8: 
Usamos las instrucciones str(store con pre indexado) y ldr(load con post indexado) que son modos de direccionamiento para modificar el registro base de forma más eficiente. Las instrucciones equivalentes en LEGv8 duplicarían la cantidad de instrucciones, por ejemplo, se tendría que usar una instrucción subi seguido de una instrucción stur en vez de la instrucción str. A continuación explicamos lo que hacen las dos instrucciones que utilizamos en el código:

str x30, [sp, #-16]!
     - "[sp, #-16]!" esta parte primero calcula la nueva direccion que sería (sp - 16) y luego almacena x30 en esa dirección. Y al final se actualiza sp a esa nueva dirección.

ldr x30, [sp], #16
     - "[sp], #16" esta parte primero carga el valor desde la dirección actual de sp y después actualiza sp sumándole 16.
