Proceso manejo_Stock
	
	// variables para el manejo de menú
	Definir opciones Como Entero   // opcion del menú principal
	Definir opc Como Entero        // opcion del menú de carga de datos
	
	// variables de ciclos y cálculos
	Definir a Como Entero          // controla el fin del programa
	Definir i Como Entero          // fila de la matriz  
	Definir encontre Como Logico   // indica si el dato buscado lo encontré o no
	Definir ult Como Entero        // indica la última fila llena de la matriz 
	Definir stock Como Entero      // stock actual del producto
	Definir pos Como Entero        // posicion donde se encontró el id a buscar
	
	// variables ingresadas por el usuario
	Definir idBuscar Como Caracter   // id producto a buscar 
	Definir cantidad Como Entero     // cantidad en stock ingresada por el usuario
	Definir id Como Caracter         // id de producto ingresado por el usuario
	Definir elemento Como Caracter   // nombre del producto ingresado por el usuario
	
	
	// variables para conversión de datos
	Definir cantidadTXT Como Caracter   // convierte un número entero a caracter
	
	// matriz
	Dimension elementos_cant_id[10000,3]  // dimensiono el tamaño de la matriz (cant filas y cant columnas)
	Definir elementos_cant_id Como Caracter  // defino el contenido de la matriz (cada casiller contiene caracteres)
	
	
	// inicializo a la variable para que controle ciclo mientras
	a = 1
	
	// cargo la  matriz con datos
	elementos_cant_id[0,0] = "Zapatillas Nike Mujer"
	elementos_cant_id[0,1] = "20"
	elementos_cant_id[0,2] = "1"
	
	
	elementos_cant_id[1,0] = "Buzo Adidas"
	elementos_cant_id[1,1] = "4"
	elementos_cant_id[1,2] = "2"
	
	elementos_cant_id[2,0] = "Pantalon Puma"
	elementos_cant_id[2,1] = "33"
	elementos_cant_id[2,2] = "3"
	
	ult = 2  // ultima fila cargada
	
	// Comienza el proceso
	
	Mientras a = 1 Hacer
		Escribir "MENU"
		Escribir "1- Carga de datos"
		Escribir "2- Buscar por id de producto"
		Escribir "3- Ordenar productos por cantidad"
		Escribir "4- Mostrar todos los productos"
		Escribir "5- Salir"
		Escribir "Ingrese una opción: "
		Leer opciones
		
		Segun opciones Hacer
			1:
				//Si usuario ingresa el id existente se va a permitir agregar cantidad , 
				// caso contrario, se ingresa un nuevo producto
			    Escribir "Menu de productos"
			    Escribir "1- Nuevo producto"
				Escribir "2- Modificar stock de producto existente" 
				Escribir "Ingrese una opción: "
				Leer opc
				
				Segun opc hacer
				   1:
					// Ingresar un elemento nuevo
					Mostrar "Ingrese la descripción del producto:"
					Leer elemento
					
					Escribir "Ingrese la cantidad en stock:"
					Leer cantidad
					
					Escribir "Ingrese el Id del artículo:"
					Leer id
					
					// Crear un nuevo objeto y agregarlo a la matriz
					ult <- ult + 1           //incremento para obtener la fila vacia
					cantidadTXT<- ConvertirATexto(cantidad)
					
					elementos_cant_id[ult, 0] <- elemento
					elementos_cant_id[ult, 1] <- cantidadTXT
					elementos_cant_id[ult, 2] <- id
					
				   2: 
					// Elemento existente
					Mostrar "Ingrese el id del artículo existente: "
					Leer idBuscar
					Mostrar "Ingrese la cantidad a agregar: "
					Leer cantidad
					
					// búsqueda devuelve la posición donde encontró el dato, caso contrario
					// devuelve -1 (un valor absurdo)
					pos = buscar(elementos_cant_id,idBuscar,ult)
					
					si pos <> -1 entonces
						stock <- ConvertirANumero(elementos_cant_id[pos, 1])
						stock <- stock + cantidad
						cantidadTXT<- ConvertirATexto(stock)
						elementos_cant_id[pos, 1] <- cantidadTXT
					SiNo
						Escribir "Error! No se encontro el id del artículo"
					FinSi
					
				   De Otro Modo:
					  Escribir "Error! Opción incorrecta, debe ser un número entre 1 y 2"
			    FinSegun
			
				
			2: 
				Escribir "Ingrese el Id a buscar"
				Leer idBuscar
				
				// búsqueda
				pos = buscar(elementos_cant_id,idBuscar,ult)
				
				Si pos <> -1 entonces
					escribir "Descripcion : ", elementos_cant_id[pos,0]
					escribir "Stock       : ", elementos_cant_id[pos,1]
					escribir "Codigo      : ", elementos_cant_id[pos,2]
				SiNo
					Escribir "Error! No existe el id ingresado"
				FinSi
				
			3:
				ordenamiento(elementos_cant_id, ult)
				
			4:
				mostrarLista(elementos_cant_id, ult)
				
			5: 
				Escribir "Fin del programa"
				a = 2
				
			De Otro Modo:
				Escribir "Error! Opcion incorrecta, debe ingresar un numero entre 1 y 5" 
				
		Fin Segun
	FinMientras
FinProceso

//----------------------------------------------------------------------------------------------//
SubProceso mostrarLista (elementos_cant_id, ult)
	definir i como entero
	
	Escribir "" // renglón en blanco
	Escribir "Lista de productos"
	Para i<-0 Hasta ult Con Paso 1 Hacer
		escribir "Descripcion : ", elementos_cant_id[i,0]
		escribir "Stock       : ", elementos_cant_id[i,1]
		escribir "ID Codigo   : ", elementos_cant_id[i,2]
	Fin Para
	Escribir ""	
finSubProceso

//----------------------------------------------------------------------------------------------//
SubProceso ordenamiento(elementos_cant_id, ult)
	Definir i,j Como Entero
	Definir aux1,aux2,aux3 Como Caracter
	Definir num1, num2 Como Entero
	
	
	Para i<-0 Hasta ult-1 Con Paso 1 Hacer
		Para j<-i+1 Hasta ult Con Paso 1 Hacer
			
			num1 <- ConvertirANumero(elementos_cant_id[i,1])
			num2 <- ConvertirANumero(elementos_cant_id[j,1])
			
			Si num1 > num2 Entonces
			
				aux1 <- elementos_cant_id[i,1]
				elementos_cant_id[i,1] <- elementos_cant_id[j,1]
				elementos_cant_id[j,1] <- aux1
				
				
				aux2 <- elementos_cant_id[i,2]
				elementos_cant_id[i,2] <- elementos_cant_id[j,2]
				elementos_cant_id[j,2] <- aux2
				
				aux3 <- elementos_cant_id[i,0]
				elementos_cant_id[i,0] <- elementos_cant_id[j,0]
				elementos_cant_id[j,0] <- aux3
			Fin Si
		Fin Para
	Fin Para
FinSubProceso

//----------------------------------------------------------------------------------------------//
Funcion pos <- buscar(elementos_cant_id,idBuscar,ult)
	Definir encontre Como Logico
	Definir i Como Entero
	Definir pos Como Entero
	
	encontre = falso
	i <- 0
	Mientras i <= ult y encontre = Falso Hacer
		Si elementos_cant_id[i, 2] = idBuscar Entonces
			encontre = Verdadero
		SiNo
			i <- i + 1
		FinSi
	FinMientras
	
	Si encontre = Falso entonces
		pos <- -1
	SiNo
		pos <- i
	FinSi
FinFuncion
