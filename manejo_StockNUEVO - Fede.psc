Proceso fgdfg
	//VER DE PONER SI QUEREMOS ELIMINAR UN PRODUCTO O HACER ESO MISMO CON EL REEMPLAZO DE UNO NUEVO, OPCION Q NOS PUEDEN LLEGAR A PREGUNTAR O PEDIR LAS PROFES
	
	Definir opciones, a, carga1, opc, bus, nuevaCantidad, orden, lista como entero
	Definir elementos_cant_id Como Caracter
	a = 1
	
	Dimension elementos_cant_id[10000,3]
	
	elementos_cant_id[0,0] = "zapatillas nike mujer"
	elementos_cant_id[0,1] = "20"
	elementos_cant_id[0,2] = "1"
	
	elementos_cant_id[1,0] = "buzo adidas"
	elementos_cant_id[1,1] = "4"
	elementos_cant_id[1,2] = "2"
	
	elementos_cant_id[2,0] = "pantalon puma"
	elementos_cant_id[2,1] = "33"
	elementos_cant_id[2,2] = "3"
	
	Mientras a=1 Hacer
		
		Mostrar "Ingrese una opcion:"
		Mostrar "1. Carga de datos"
		Mostrar "2. Busqueda por id de producto"
		Mostrar "3. Ordenar productos por cantidad"
		Mostrar "4. Mostrar todos los productos"
		Mostrar "5. Salir"
		
		Leer opciones
		
		Segun opciones Hacer
			1:
				Repetir
					Mostrar "Ingrese una opción:"
					Mostrar "1. Elemento nuevo"
					Mostrar "2. Elemento existente"
					Mostrar "3. Salir"
					Leer opc
					Segun opc Hacer
						1:
							carga1 = cargaNueva(elementos_cant_id)
						2:
							nuevaCantidad = cargaExistente(elementos_cant_id)
						3:
							
						De Otro Modo:
							Mostrar "Opcion incorrecta"
					Fin Segun
				Mientras Que opc <> 3
				//Si usuario ingresa el id existente se va a permitir agregar cantidad , si no esta creado con un parametro que cicle por el array se va a crear un objeto nuevo
			2:
				bus = busqueda(elementos_cant_id)
			3:
				orden = ordenamiento(elementos_cant_id)
				//Con una lista de ordenamiento i, j ,k ordene de mayor a menor por cantidades
			4:
				lista = mostrarLista(elementos_cant_id)
				
			De Otro Modo:
				Mostrar "Opcion incorrecta"
		Fin Segun
		
	FinMientras
	
FinProceso


//Opcion 1.1
Funcion carga <- cargaNueva(array)
	
	Definir i, j, cantidad, id, cont Como Entero
	Definir nombre Como Caracter
	Definir a Como Logico
	a = Falso
	cont = 0
	
	Mostrar "1: Nombre del producto"
	Leer nombre
	Mostrar "2: Cantidad de producto"
	Leer cantidad
	Repetir
		Mostrar "3: ID de producto"
		Leer id
		Si "" == array[cont,2] Entonces
			array[cont,0] = nombre
			array[cont,1] = ConvertirATexto(cantidad)
			array[cont,2] = ConvertirATexto(id)
			a = Verdadero
		SiNo
			Mostrar "ID existente, ingrese otro"
			id = 0
		Fin Si
		cont = cont+1
	Hasta Que a == Verdadero
	
FinFuncion


//Opcion 1.2
Funcion carga <- cargaExistente(array)
	
	Definir busqueda1, i, j, cant Como Entero
	
	Mostrar "Ingrese ID de producto a modificar"
	Leer busqueda1
	
	Para i<-0 Hasta 2 Con Paso 1 Hacer
		Para j<-0 Hasta 0 Con Paso 1 Hacer
			Si busqueda1 ==  ConvertirANumero(array[i,2]) Entonces
				Mostrar "ID encontrado. El producto es ", array[i,0] " - Cantidad: " array[i,1] " - ID: " array[i,2]
				Mostrar "Actualice la cantidad del producto"
				Leer cant
				array[i,1] = ConvertirATexto(cant)
				Mostrar "Actualizado con exito. El nuevo producto quedó modificado de la siguiente manera: " array[i,0] " - CANTIDAD: " array[i,1] " - ID: " array[i,2]
			Fin Si
		Fin Para
	Fin Para
	
FinFuncion


//Opcion 2
Funcion bus <- busqueda(array)
	
	Definir busqueda1, i, j Como Entero
	Definir encontrado Como Logico
	encontrado = Falso
	
	Mostrar "Ingrese ID de producto a buscar"
	Leer busqueda1
	
	Para i<-0 Hasta 2 Con Paso 1 Hacer
		Para j<-0 Hasta 0 Con Paso 1 Hacer
			Si busqueda1 == ConvertirANumero(array[i,2]) Entonces
				Mostrar "Busqueda exitosa: ", array[i,0], " - ", "Cantidad: ", array[i,1], " - ",  "ID: ", array[i,2]
				encontrado = Verdadero
			Fin Si
		Fin Para
	Fin Para
	
	Si encontrado == Falso Entonces
		Mostrar "Disculpe, el ID no se encuentra aún registrado"
	Fin Si
	
FinFuncion


//Opcion 3
Funcion ord <- ordenamiento(array)
	
	Definir posMayor, i, j, k Como entero
	Definir aux Como Caracter
	
	Para i<-0 Hasta 2 Con Paso 1 Hacer
		posMayor = i
		Para j<-i+1 Hasta 2 Con Paso 1 Hacer
			Si array[j,1] > array[posMayor,1] Entonces
				posMayor = j
			Fin Si
		Fin Para
		
		Para k<-0 Hasta 2 Con Paso 1 Hacer
			Mostrar aux = array[i,k]
			Mostrar array[i,k] = array[posMayor,k]
			Mostrar array[posMayor,k] = aux
		Fin Para
		
	Fin Para
	
	Para i<-0 Hasta 2 Con Paso 1 Hacer
		Para j<-0 Hasta 2 Con Paso 1 Hacer
			Mostrar Sin Saltar array[i,j]
			Mostrar " "
		Fin Para
	Fin Para
	
FinFuncion


//Opcion 4
Funcion  lista <- mostrarLista (elementos_cant_id)
	
	Definir cont Como Entero
	Definir bandera Como Logico
	bandera = Verdadero
	cont = 0
	
	Repetir
		Si "" == elementos_cant_id[cont,0] Entonces
			bandera = Falso
		SiNo
			Mostrar "Nombre: ", elementos_cant_id[cont,0], " - ", "Cantidad: ", elementos_cant_id[cont,1], " ",  "Id: ", elementos_cant_id[cont,2]
			cont = cont + 1
		Fin Si
	Hasta Que bandera = Falso
	
FinFuncion