Proceso manejo_Stock
	definir opciones,a como entero
	a = 1
	
	dimension elementos_cant_id[10000,3]
	
	elementos_cant_id[1,0] = "zapatillas nike mujer"
	elementos_cant_id[1,1] = "20"
	elementos_cant_id[1,2] = "1"
	
	
	elementos_cant_id[2,0] = "buzo adidas"
	elementos_cant_id[2,1] = "4"
	elementos_cant_id[2,2] = "2"
	
	elementos_cant_id[3,0] = "pantalon puma"
	elementos_cant_id[3,1] = "33"
	elementos_cant_id[3,2] = "3"
	
	
	
	Mientras a=1 Hacer
		Mostrar "Ingrese lo que desee hacer: 1-carga de datos, 2-Buscar por id de producto, 3-Ordenar productos por cantidad, 4-Mostrar todos los productos, 5-Salir"
		Leer opciones
	Segun opciones Hacer
		1:
			Mostrar "Ingrese una opción: 1.Elemento nuevo, 2.Elemento existente"
			//Si usuario ingresa el id existente se va a permitir agregar cantidad , si no esta creado con un parametro que cicle por el array se va a crear un objeto nuevo
		2:
			//Si ID es igual a algun ID existente que muestre toda la fila
		3:
			//Con una lista de ordenamiento i, j ,k ordene de mayor a menor por cantidades
		4:
			lista = mostrarLista(elementos_cant_id)
			Mostrar lista
		De Otro Modo:
			a=2
	Fin Segun
	finMientras
FinProceso



	Funcion  lista <- mostrarLista (elementos_cant_id)
		Para i = 1 Hasta 8 Hacer
			Mostrar "Nombre: ", elementos_cant_id[i,0], " - ", "Cantidad: ", elementos_cant_id[i,1], " ",  "Id: ", elementos_cant_id[i,2]
		Fin Para
FinFuncion

