Proceso _1TUP5_PI_2023_GRUPO2_
	Definir opcionMenu, cantidad, cantidadVentas como entero
	Definir nombreProducto, idProducto como caracter
	Definir precioUnitario, precioTotal como real
	Definir terminarPrograma, encontrado Como Logico
	Dimension cantidad[5]
	Dimension nombreProducto[5]
	Dimension precioUnitario[5]
	Dimension idProducto[5]
	precioTotal = 0
	cantidadVentas = 0
	terminarPrograma = Falso
	nombreProducto[0] = "arroz"
	nombreProducto[1] = "jabon"
	nombreProducto[2] = "-"
	nombreProducto[3] = "gaseosa"
	nombreProducto[4] = "-"
	precioUnitario[0] = 250
    precioUnitario[1] = 120
    precioUnitario[3] = 200
	idProducto[0] = "#1234"
	idProducto[1] = "#2345"
	idProducto[3] = "#3456"
	cantidad[0] = 3
	cantidad[1] = 5
	cantidad[3] = 4
	Repetir
		
		Repetir
			Mostrar "MENU"
			Mostrar "1. registrar ventas"
			Mostrar "2. agregar producto"
			Mostrar "3. buscar producto"
			Mostrar "4. ordenar producto por stock"
			Mostrar "5. modificar producto"
			Mostrar "6. resumen del dia"
			Mostrar "7. SALIR"
			Mostrar Sin Saltar "ingresar opcion "
			Leer opcionMenu
			si opcionMenu > 7 | opcionMenu < 1 Entonces
				Mostrar "opcion invalida"
			FinSi
		Mientras que opcionMenu > 7 | opcionMenu < 1
		
		Segun opcionMenu Hacer
			1:
				registrarVenta(nombreProducto, precioUnitario, cantidad, cantidadVentas, precioTotal, idProducto, encontrado)
			2:
				agregarProducto(nombreProducto, cantidad, idProducto, precioUnitario)
			3:
				indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, encontrado)
			4:
				
			5:
				
			6:
				resumenDia(cantidadVentas, precioTotal)
			7:
				terminarPrograma = Verdadero
		Fin Segun
	Mientras Que terminarPrograma == Falso
FinProceso

//Subproceso de registrar venta, esta está conectada con la funcion de buscar producto, y obtiene el indice para saber el precioUnitario, cantidad, etc.
SubProceso registrarVenta(nombreProducto, precioUnitario, cantidad, cantidadVentas Por Referencia, montoTotal Por Referencia, idProducto, encontrado Por Referencia)
	definir flag, otroProducto como logico
	Definir opcionMenu, cantidadResumen, i Como Entero
	Definir nombreProductoResumen, idProductoResumen Como Caracter
	Definir precioResumen, precioTotalDelProductoResumen, PrecioTotalDeLaVentaResumen Como Real
	Dimension cantidadResumen[2]
	Dimension nombreProductoResumen[2]
	Dimension precioResumen[2]
	Dimension idProductoResumen[2]
	Dimension precioTotalDelProductoResumen[2]
	Dimension PrecioTotalDeLaVentaResumen[2]
	
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
	
	si otroProducto == Falso Entonces
		//resumen de la venta
		Para j = 0 Hasta 1 Hacer
			Mostrar Sin Saltar cantidadResumen[j]," | ",nombreProductoResumen[j]," | $", precioResumen[j]," | ",idProductoResumen[j]," | $",precioTotalDelProductoResumen[j]
			Mostrar ""
		FinPara
		Mostrar "monto total a abonar ",montoTotal
	FinSi
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
SubProceso agregarProducto(nombreProducto, cantidad, idProducto, precioUnitario)
	Definir precioAux como real
	Definir cantidadAux Como Entero
	Definir idProductoAux, nombreProductoAux Como Caracter
	
	Mientras i <= 4 Hacer
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
				si Longitud(idProductoAux) <> 5 Entonces
					Mostrar "id invalido, ingrese nuevamente"
				SiNo
					idProducto[i] = idProductoAux
				FinSi
			Mientras que Longitud(idProductoAux) <> 5
			
			mostrar Sin Saltar "Ingrese la cantidad del producto: "
			Repetir
				//variable auxilia para que no entre en la base de datos sin comprobarla
				leer cantidadAux
				si precioAux < 1 Entonces
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
			
			i = 10
		SiNo
			si i == 4 Entonces
				Mostrar "Inadmisible"
			FinSi
		FinSi
		i = i + 1
	FinMientras
	
FinSubProceso

SubProceso resumenDia(cantidadVentas, precioTotal)
	
	mostrar "Las ventas totales del dia fueron: ", cantidadVentas
	Mostrar "El monto total de las ventas fueron: ", montoTotal
	
FinSubProceso