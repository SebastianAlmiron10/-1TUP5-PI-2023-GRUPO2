Proceso _1TUP5_PI_2023_GRUPO2_
	Definir opcionMenu, cantidad, cantidadVentas, dim, dimC como entero
	Definir nombreProducto, idProducto, nombreCliente, dniCliente como caracter
	Definir precioUnitario, precioTotal como real
	Definir terminarPrograma, encontrado Como Logico
	dim = 10
	dimC = 2
	Dimension cantidad[dim]
	Dimension nombreProducto[dim]
	Dimension precioUnitario[dim]
	Dimension idProducto[dim]
	
	Dimension nombreCliente[dimC]
	Dimension dniCliente[dimC]
	precioTotal = 0
	cantidadVentas = 0
	terminarPrograma = Falso
	
	nombreCliente[0] = "jose"
	dniCliente[0] = "12345678"
	
	
	nombreProducto[0] = "arroz"
	nombreProducto[1] = "jabon"
	nombreProducto[2] = "tuco"
	nombreProducto[3] = "gaseosa"
	nombreProducto[4] = "salchicha"
	nombreProducto[5] = "-"
	nombreProducto[6] = "-"
	nombreProducto[7] = "-"
	nombreProducto[8] = "-"
	nombreProducto[9] = "-"
	
	precioUnitario[0] = 250
    precioUnitario[1] = 120
    precioUnitario[2] = 200
	precioUnitario[3] = 120
    precioUnitario[4] = 200
	
	idProducto[0] = "#1234"
	idProducto[1] = "#2345"
	idProducto[2] = "#3456"
	idProducto[3] = "#4567"
	idProducto[4] = "#5678"
	
	cantidad[0] = 3
	cantidad[1] = 2
	cantidad[2] = 4
	cantidad[3] = 5
	cantidad[4] = 6
	Repetir
		
		Repetir
			Mostrar "----MENU------------------------------------"
			Mostrar "1. registrar ventas"
			Mostrar "2. agregar producto"
			Mostrar "3. buscar producto"
			Mostrar "4. ordenar producto por stock"
			Mostrar "5. modificar producto"
			Mostrar "6. resumen del dia"
			Mostrar "7. SALIR"
			Mostrar "---------------------------------------------"
			Mostrar Sin Saltar "ingresar opcion "
			Leer opcionMenu
			si opcionMenu > 7 | opcionMenu < 1 Entonces
				Mostrar "opcion invalida"
			FinSi
		Mientras que opcionMenu > 7 | opcionMenu < 1
		
		Segun opcionMenu Hacer
			1:
				registrarVenta(nombreProducto, precioUnitario, cantidad, cantidadVentas, precioTotal, idProducto, encontrado, nombreCliente, dniCliente)
			2:
				agregarProducto(nombreProducto, cantidad, idProducto, precioUnitario, dim)
			3:
				indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, encontrado)
			4:
				ordenarProductoPorMenorStock(nombreProducto, cantidad, idProducto, precioUnitario, dim)
			5:
				modificarProducto(nombreProducto, cantidad, idProducto, precioUnitario, encontrado)
			6:
				resumenDia(cantidadVentas, precioTotal)
			7:
				//agregarNuevoCliente(nombreCliente, dniCliente)
			8:
				terminarPrograma = Verdadero
		Fin Segun
	Mientras Que terminarPrograma == Falso
FinProceso

//Subproceso de registrar venta, esta está conectada con la funcion de buscar producto, y obtiene el indice para saber el precioUnitario, cantidad, etc.
SubProceso registrarVenta(nombreProducto, precioUnitario, cantidad, cantidadVentas Por Referencia, montoTotal Por Referencia, idProducto, encontrado Por Referencia, nombreCliente, dniCliente)
	definir flag, otroProducto como logico
	Definir opcionMenu, cantidadResumen, i, esCliente Como Entero
	Definir nombreProductoResumen, idProductoResumen Como Caracter
	Definir precioResumen, precioTotalDelProductoResumen, PrecioTotalDeLaVentaResumen Como Real
	Dimension cantidadResumen[3]
	Dimension nombreProductoResumen[3]
	Dimension precioResumen[3]
	Dimension idProductoResumen[3]
	Dimension precioTotalDelProductoResumen[3]
	Dimension PrecioTotalDeLaVentaResumen[3]
	
	flag = Falso
	i = 0  
	Repetir
		precioTotal = 0
		indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, encontrado)
		si encontrado == Verdadero Entonces
			Mostrar "ingresar cantidad a vender"
			Repetir
				Leer cantidadVendida
				si cantidadVendida > cantidad[indice]
					Mostrar"no cuenta con la cantidad deseada, ingrese nuevamente "
				SiNo
					cantidadVentas = cantidadVentas + 1
					precioTotal = precioTotal + (precioUnitario[indice] * cantidadVendida)
					cantidad[indice] = cantidad[indice]  - cantidadVendida
					flag = Verdadero
					//agregar productos vendidos a una nueva matriz para mostrarla como resumen al final
					nombreProductoResumen[i] = nombreProducto[indice]
					idProductoResumen[i] = idProducto[indice]
					cantidadResumen[i] = cantidadVendida
					precioResumen[i] = precioUnitario[indice]
					precioTotalDelProductoResumen[i] = precioTotal
					montoTotal = montoTotal + precioTotalDelProductoResumen[i]
				FinSi	
			Mientras Que flag = Falso
		FinSi
		Mostrar "desea agregar otro productos a la venta? 1. seguir  2. salir"
		Leer opcionMenu
		Segun opcionMenu Hacer
			1:
				otroProducto = Verdadero
			De Otro Modo:
				otroProducto = Falso
		Fin Segun
		i = i + 1
	Mientras Que otroProducto == Verdadero
	Mostrar "es cliente? 1. Si  2. No"
	leer esCliente
	Segun esCliente Hacer
		1:
			clienteEncontrado = buscarCliente(nombreCliente, dniCliente)
			si clienteEncontrado == 1 Entonces
				Mostrar ""//agregar descuento
			FinSi
		De Otro Modo:
			//
	Fin Segun
	si otroProducto == Falso Entonces
		//resumen de la venta
		Para j = 0 Hasta i - 1 Hacer
			Mostrar Sin Saltar cantidadResumen[j]," | ",nombreProductoResumen[j]," | $", precioResumen[j]," | ",idProductoResumen[j]," | $",precioTotalDelProductoResumen[j]
			Mostrar ""
		FinPara
		Mostrar "monto total a abonar ",montoTotal
	FinSi
FinSubProceso

SubProceso clienteEncontrado = buscarCliente(nombreCliente, dniCliente)
	Mostrar "ingresar nombre o dni del cliente"
	Leer clienteBusqueda
	clienteBusqueda = Minusculas(clienteBusqueda)
	i = 0
	
	Mientras i <= 0 Hacer
		si nombreCliente[i] == clienteBusqueda | dniCliente[i] == clienteBusqueda Entonces
			Mostrar nombreCliente[i]," ",dniCliente[i]
			i = 10
			clienteEncontrado = 1
		SiNo
			si i == 4 Entonces
				Mostrar "cliente no encontrado"
				ClienteEncontrado = 0
			FinSi
		FinSi
		i = i + 1
	FinMientras
FinSubProceso

//funcion de buscar producto, esta misma devuelve el indice que sirve para otros subprocesos
SubProceso indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, encontrado Por Referencia)
	Definir productoBusqueda como caracter
	Definir i como entero
	
	Mostrar "ingresar nombre del producto o id del producto"
	Leer productoBusqueda
	productoBusqueda = Minusculas(productoBusqueda)
	i = 0
	
	Mientras i <= 4 Hacer
		si nombreProducto[i] == productoBusqueda | idProducto[i] == productoBusqueda Entonces
			Mostrar cantidad[i]," | ",nombreProducto[i]," | $", precioUnitario[i]," | ",idProducto[i]
			indice = i
			i = 10
			encontrado = Verdadero
		SiNo
			si i == 4 Entonces
				Mostrar "producto no encontrado"
				encontrado = Falso
			FinSi
		FinSi
		i = i + 1
	FinMientras
	
FinSubProceso

//Subproceso de agregar producto, esta busca en la lista lso productos vacios ( "-", " ", "" ), y ahi permite rellenar ese campo
SubProceso agregarProducto(nombreProducto, cantidad, idProducto, precioUnitario, dim)
	Definir precioAux como real
	Definir cantidadAux, repetido Como Entero
	Definir idProductoAux, nombreProductoAux Como Caracter
	
	Mientras i <= dim - 1 Hacer
		si nombreProducto[i] == "-" Entonces
			
			mostrar Sin Saltar "Ingrese el nombre del producto: "
			Repetir
				//variable auxilia para que no entre en la base de datos sin comprobarla
				leer nombreProductoAux
				si nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " " Entonces
					Mostrar "nombre invalido, ingrese nuevamente"
				SiNo
					nombreProducto[i] = nombreProductoAux
				FinSi
			mientras que nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " "
			
			mostrar Sin Saltar "Ingrese el id del producto: "
			Repetir
				leer idProductoAux 
				repetido = idRepetido(idProducto, idProductoAux, dim)
				si (Longitud(idProductoAux) <> 5) o (repetido == 1) Entonces
					Mostrar "id invalido, ingrese nuevamente"
				SiNo
					idProducto[i] = idProductoAux
				FinSi
			Mientras que Longitud(idProductoAux) <> 5 o (repetido == 1)
			
			mostrar Sin Saltar "Ingrese la cantidad del producto: "
			Repetir
				//variable auxilia para que no entre en la base de datos sin comprobarla
				leer cantidadAux
				si cantidadAux < 1 Entonces
					Mostrar "cantidad invalido, ingrese nuevamente"
				SiNo
					cantidad[i] = cantidadAux
				FinSi
			Mientras Que cantidadAux < 1
			
			mostrar Sin Saltar "Ingrese el precio unitario del producto: "
			Repetir
				//variable auxilia para que no entre en la base de datos sin comprobarla
				leer precioAux
				si precioAux < 1 Entonces
					Mostrar "precio unitario invalido, ingrese nuevamente"
				SiNo
					precioUnitario[i] = precioAux
				FinSi
			Mientras Que precioAux < 1
			
			i = 11
		SiNo
			si i == dim - 1 Entonces
				Mostrar "Inadmisible"
			FinSi
		FinSi
		i = i + 1
	FinMientras
	
FinSubProceso
SubProceso repetido = idRepetido(idProducto, idProductoAux Por Referencia, dim)
	i = 0
	Mientras i <= dim - 1 Hacer
		si idProducto[i] == idProductoAux Entonces
			repetido = 1
			i = 11
		SiNo
			repetido = 0
		FinSi
		i = i + 1
	FinMientras
	
	
FinSubProceso
//SubProceso de ordenar producto por menor stock
SubProceso ordenarProductoPorMenorStock(nombreProducto, cantidad, idProducto, precioUnitario, dim)
	Definir i, j, posMenor, aux Como Entero
	Definir auxNombre, auxId Como Caracter
	Definir auxPrecio Como Real
	
	Para i = 0 Hasta dim - 2 Hacer
		posMenor = i
		Para j = i + 1 Hasta dim - 1 Hacer
			si cantidad[j] < cantidad[posMenor] Entonces
				posMenor = j
			FinSi
		FinPara
		aux = cantidad[i]
		cantidad[i] = cantidad[posMenor]
		cantidad[posMenor] = aux
		
		auxNombre = nombreProducto[i]
		nombreProducto[i] = nombreProducto[posMenor]
		nombreProducto[posMenor] = auxNombre
		
		auxPrecio = precioUnitario[i]
		precioUnitario[i] = precioUnitario[posMenor]
		precioUnitario[posMenor] = auxPrecio
		
		auxId = idProducto[i]
		idProducto[i] = idProducto[posMenor]
		idProducto[posMenor] = auxId
	FinPara
	
	Para j = 0 Hasta dim - 1 Hacer
		Si nombreProducto[j] <> "-"
			Mostrar Sin Saltar cantidad[j]," | ",nombreProducto[j]," | $", precioUnitario[j]," | ",idProducto[j]
			Mostrar ""
		FinSi
	FinPara
FinSubProceso

//SubProceso de modicar un producto
SubProceso modificarProducto(nombreProducto, cantidad, idProducto, precioUnitario, encontrado Por Referencia)
	Definir opcionMenu Como Entero
	indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, encontrado)
	si encontrado == Verdadero Entonces
		Mostrar "QUE QUIERE MODIFICAR DEL PRODUCTO"
		Mostrar "1. nombre"
		Mostrar "2. id"
		Mostrar "3. cantidad"
		Mostrar "4. precio"
		
		Leer opcionMenu
		Segun opcionMenu Hacer
			1:
				Repetir
					//variable auxilia para que no entre en la base de datos sin comprobarla
					Mostrar Sin Saltar "ingresar nombre"
					leer nombreProductoAux
					si nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " " Entonces
						Mostrar "nombre invalido, ingrese nuevamente"
					SiNo
						nombreProducto[indice] = nombreProductoAux
					FinSi
				mientras que nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " "
			2:
				mostrar Sin Saltar "Ingrese el id del producto: "
				Repetir
					leer idProductoAux
					si Longitud(idProductoAux) <> 5 Entonces
						Mostrar "id invalido, ingrese nuevamente"
					SiNo
						idProducto[indice] = idProductoAux
					FinSi
				Mientras que Longitud(idProductoAux) <> 5
			3:
				mostrar Sin Saltar "Ingrese la cantidad del producto: "
				Repetir
					//variable auxilia para que no entre en la base de datos sin comprobarla
					leer cantidadAux
					si precioAux < 1 Entonces
						Mostrar "cantidad invalido, ingrese nuevamente"
					SiNo
						cantidad[indice] = cantidadAux
					FinSi
				Mientras Que cantidadAux < 1
			4:
				mostrar Sin Saltar "Ingrese el precio unitario del producto: "
				Repetir
					//variable auxilia para que no entre en la base de datos sin comprobarla
					leer precioAux
					si precioAux < 1 Entonces
						Mostrar "precio unitario invalido, ingrese nuevamente"
					SiNo
						precioUnitario[indice] = precioAux
					FinSi
				Mientras Que precioAux < 1
		Fin Segun
	FinSi
	
FinSubProceso

SubProceso resumenDia(cantidadVentas, precioTotal)
	
	mostrar "Las ventas totales del dia fueron: ", cantidadVentas
	Mostrar "El monto total de las ventas fueron: ", montoTotal
	
FinSubProceso