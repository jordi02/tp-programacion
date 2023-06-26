Proceso trabajo_practico
	
	Definir opciones, a, carga1, opc, bus, nuevaCantidad, orden, lista, dim, ult como entero
	Definir elementos_cant_id, nombreUsuario Como Caracter
	
	a = 1
	dim = 10000
	ult = 4
	
	Dimension elementos_cant_id[dim,3]
	
	//ELEMENTOS DEL ARREGLO PRECARGADOS COMO PRUEBA
	elementos_cant_id[0,0] = "Zapatillas Nike mujer"
	elementos_cant_id[0,1] = "20"
	elementos_cant_id[0,2] = "1"
	
	elementos_cant_id[1,0] = "Buzo Adidas"
	elementos_cant_id[1,1] = "4"
	elementos_cant_id[1,2] = "2"
	
	elementos_cant_id[2,0] = "Pantalon Puma"
	elementos_cant_id[2,1] = "33"
	elementos_cant_id[2,2] = "3"
	
	elementos_cant_id[3,0] = "Gorra Adidas"
	elementos_cant_id[3,1] = "50"
	elementos_cant_id[3,2] = "4"
	
	Mostrar "Bienvendio. Ingrese su nombre..."
	Leer nombreUsuario
	
	Mientras opciones <> 5 Hacer
		
		Mostrar nombreUsuario ". Ingrese una opcion:"
		Mostrar "1. Carga de datos"
		//BUSCA UN PRODUCTO POR SU ID Y LO MUESTRA
		Mostrar "2. Busqueda por id de producto"
		//ORDENA PRODUCTOS POR CANTIDAD DE STOCK DISPONIBLE
		Mostrar "3. Ordenar productos por cantidad"
		//MUESTRA LISTA CON TODOS LOS PRODUCTOS DISPONIBLES ACTUALMENTE
		Mostrar "4. Mostrar todos los productos"
		Mostrar "5. Salir"
		
		Leer opciones
		
		Segun opciones Hacer
			1:
				Repetir
					//CARGA DE NUEVO PRODUCTO O MODIFICACION DE UNO YA EXISTENTE
					Mostrar "Ingrese una opción:"
					Mostrar "1. Elemento nuevo"
					Mostrar "2. Elemento existente"
					Mostrar "3. Salir"
					Leer opc
					Segun opc Hacer
						1:
							carga1 = cargaNueva(elementos_cant_id, ult)
						2:
							nuevaCantidad = cargaExistente(elementos_cant_id, dim)
						3:
							
						De Otro Modo:
							Mostrar "Opcion incorrecta"
					Fin Segun
				Mientras Que opc <> 3
			2:
				bus = busqueda(elementos_cant_id, dim)
			3:
				orden = ordenamiento(elementos_cant_id, dim, ult)
			4:
				lista = mostrarLista(elementos_cant_id)
			5:
				Mostrar "Hasta luego..."
				
			De Otro Modo:
				Mostrar "Opcion incorrecta"
		Fin Segun
		
	FinMientras
	
FinProceso
//Opcion 1.1
Funcion carga <- cargaNueva(array, ult Por Referencia)
	
	Definir i, j, cantidad, id, cont, contaux Como Entero
	Definir nombre Como Caracter
	Definir a, b Como Logico
	a = Falso
	b = Falso
	cont = 0 //PARA UBICAR ULTIMA POSICION CON UN PRODUCTO
	contaux = 0 //PARA VALIDAR ID Y NOMBRE EXISTENTE
	
	//CARGANDO NUEVO PRODUCTO. PRIMERO SE INGRESA, DESPUES SE VALIDA ANTES DE CARGAR
	Mostrar "1: Nombre del producto"
	Leer nombre
	Mostrar "2: Cantidad de producto"
	Leer cantidad
	Mostrar "3: ID de producto"
	Leer id
	Repetir
		Si "" == array[cont,2] Entonces
			//VALIDAR ID
			Repetir
				Si id == ConvertirANumero(array[contaux,2]) Entonces
					Mostrar "ID existente. Ingrese otro"
					Leer id
					contaux = 0
				FinSi
				Si id <> ConvertirANumero(array[contaux,2]) Entonces
					contaux = contaux + 1
				Fin Si
				Si contaux > cont Entonces
					b = Verdadero
				Fin Si
			Hasta Que b = Verdadero
			
			contaux = 0
			b = Falso
			
			//VALIDAR NOMBRE
			Repetir
				Si nombre == array[contaux,0] Entonces
					Mostrar "Nombre existente. Ingrese otro"
					Leer nombre
					contaux = 0
				FinSi
				Si nombre <> array[contaux,0] Entonces
					contaux = contaux + 1
				Fin Si
				Si contaux > cont Entonces
					b = Verdadero
				Fin Si
			Hasta Que b = Verdadero
			
			//VALIDAR QUE CANTIDAD SEA MAYOR A 0
			Mientras cantidad < 0 Hacer
				Mostrar "Cantidad incorrecta. Ingrese un numero mayor a 0"
				Leer cantidad
			Fin Mientras
			
			//SI TODO ES CORRECTO, SE CARGA NUEVO PRODUCTO
			array[cont,0] = nombre
			array[cont,1] = ConvertirATexto(cantidad)
			array[cont,2] = ConvertirATexto(id)
			
			//SE VALIDA PARA PODER SALIR
			a = Verdadero
			
			//SE SUMA UNA POSICION PARA SABER CUAL ES EL ULTIMO LUGAR CON UN PRODUCTO CARGADO Y UTILIZARLO EN OTRAS FUNCIONES
			ult = ult + 1
		FinSi
		cont = cont+1
	Hasta Que a == Verdadero
	
FinFuncion


//Opcion 1.2
Funcion carga <- cargaExistente(array, a)
	
	Definir busqueda1, i, j, cant Como Entero
	Definir encontrado Como Logico
	encontrado = Falso
	
	Mostrar "Ingrese ID de producto a modificar"
	Leer busqueda1
	
	Para i<-0 Hasta a-1 Con Paso 1 Hacer
		Si busqueda1 ==  ConvertirANumero(array[i,2]) Entonces
			Mostrar "ID encontrado. El producto es ", array[i,0] " - Cantidad: " array[i,1] " - ID: " array[i,2]
			Mostrar "Actualice la cantidad del producto"
			Leer cant
			//VALIDANDO QUE CANTIDAD SEA MAYOR A 0
			Mientras cant < 0 Hacer
				Mostrar "Cantidad incorrecta. Ingrese un numero mayor a 0"
				Leer cant
			Fin Mientras
			//COPIANDO NUEVO VALOR DE CANTIDAD
			array[i,1] = ConvertirATexto(cant)
			Mostrar "Actualizado con exito. El nuevo producto quedó modificado de la siguiente manera: " array[i,0] " - CANTIDAD: " array[i,1] " - ID: " array[i,2]
			//VALIDANDO LA BUSQUEDA COMO EXITOSA
			encontrado = Verdadero
		Fin Si
		
	Fin Para
	
	//CUANDO EL ID BUSCADO NO SE ENCUENTRA
	Si encontrado == Falso Entonces
		Mostrar "Disculpe, el ID no se encuentra aún registrado"
	Fin Si
	
FinFuncion


//Opcion 2
Funcion bus <- busqueda(array, a)
	
	Definir busqueda1, i, j Como Entero
	Definir encontrado Como Logico
	encontrado = Falso
	
	Mostrar "Ingrese ID de producto a buscar"
	Leer busqueda1
	
	Para i<-0 Hasta a-1 Con Paso 1 Hacer
		Si busqueda1 == ConvertirANumero(array[i,2]) Entonces
			Mostrar "Busqueda exitosa: ", array[i,0], " - ", "Cantidad: ", array[i,1], " - ",  "ID: ", array[i,2]
			//VALIDANDO LA BUSQUEDA COMO EXITOSA
			encontrado = Verdadero
		Fin Si
	Fin Para
	
	//CUANDO EL ID BUSCADO NO SE ENCUENTRA
	Si encontrado == Falso Entonces
		Mostrar "Disculpe, el ID no se encuentra aún registrado"
	Fin Si
	
FinFuncion


//Opcion 3
Funcion ord <- ordenamiento(array, a, ult Por Referencia)
	
	Definir posMayor, i, j, k, cont Como entero
	Definir aux Como Caracter
	Definir bandera Como Logico
	
	bandera = Verdadero
	cont = 0
	
	Para i<-0 Hasta a-1 Con Paso 1 Hacer
		posMayor = i
		Para j<-i+1 Hasta ult-1 Con Paso 1 Hacer
			Si ConvertirANumero(array[j,1]) > ConvertirANumero(array[posMayor,1]) Entonces
				posMayor = j
			Fin Si
		Fin Para
		
		//UBICANDO LO VALORES NUEVOS Y LOS VIEJOS EN ORDEN DESCENDENTE
		Para k<-0 Hasta 2 Con Paso 1 Hacer
			aux = array[i,k]
			array[i,k] = array[posMayor,k]
			array[posMayor,k] = aux
		Fin Para
		
	Fin Para
	
	//MOSTRANDO NUEVO ARREGLO ORDENADO DE MANERA DESCENDENTE
	Repetir
		Si "" == array[cont,0] Entonces
			bandera = Falso
		SiNo
			Mostrar "Nombre: ", array[cont,0], " - ", "Cantidad: ", array[cont,1], " ",  "Id: ", array[cont,2]
			cont = cont + 1
		Fin Si
	Hasta Que bandera = Falso
	
FinFuncion


//Opcion 4
Funcion  lista <- mostrarLista(elementos_cant_id)
	
	Definir cont Como Entero
	Definir bandera Como Logico
	bandera = Verdadero
	cont = 0
	
	Repetir
		//MOSTRANDO SOLO LOS LUGARES DEL ARREGLO QUE CONTIENEN ALGUN DATO
		Si "" == elementos_cant_id[cont,0] Entonces
			//MODIFICANDO BANDERA PARA PODER SALIR
			bandera = Falso
		SiNo
			Mostrar "Nombre: ", elementos_cant_id[cont,0], " - ", "Cantidad: ", elementos_cant_id[cont,1], " ",  "Id: ", elementos_cant_id[cont,2]
			cont = cont + 1
		Fin Si
	Hasta Que bandera = Falso
	
FinFuncion