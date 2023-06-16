Proceso _1TUP5_PI_2023_GRUPO2_
	Definir opcionMenu, cantidad, cantidadVentas como entero
	Definir nombreProducto, idProducto como caracter
	Definir precio, precioTotal como real
	Definir flag Como Logico
	Dimension cantidad[5]
	Dimension nombreProducto[5]
	Dimension precio[5]
	Dimension idProducto[5]
	precioTotal = 0
	cantidadVentas = 0
	
	nombreProducto[0] = "arroz"
	nombreProducto[1] = "jabon"
	nombreProducto[2] = "-"
	nombreProducto[3] = "gaseosa"
	nombreProducto[4] = "-"
	precio[0] = 250
    precio[1] = 120
    precio[3] = 200
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
				registrarVenta(nombreProducto, precio, cantidad, cantidadVentas, precioTotal, idProducto)
			2:
				agregarProducto(nombreProducto, cantidad, idProducto, precio)
			3:
				indice = buscarProducto(nombreProducto, precio, cantidad, idProducto)
			4:
				
			5:
				
			6:
				resumenDia(cantidadVentas, precioTotal)
			7:
		Fin Segun
		flag = Verdadero
	Mientras Que flag == Verdadero
FinProceso

SubProceso registrarVenta(nombreProducto, precio, cantidad, cantidadVentas Por Referencia, precioTotal Por Referencia, idProducto)
	definir flag como logico
	flag = Falso
	indice = buscarProducto(nombreProducto, precio, cantidad, idProducto)
	Mostrar "ingresar cantidad a vender"
	
	Repetir
		
		Leer cantidadVendida
		si cantidadVendida > cantidad[indice]
			Mostrar"no cuenta con la cantidad deseada, ingrese nuevamente "
		SiNo
			cantidadVentas = cantidadVentas + 1
			precioTotal = precioTotal + (precio[indice] * cantidadVendida)
			cantidad[indice] = cantidad[indice]  - cantidadVendida
			flag = Verdadero
		
		FinSi	
	Mientras Que flag = Falso

FinSubProceso

SubProceso indice = buscarProducto(nombreProducto, precio, cantidad, idProducto)
	Definir productoBusqueda como caracter
	Definir i como entero
	
	Mostrar "ingresar nombre del producto o id del producto"
	Leer productoBusqueda
	productoBusqueda = Minusculas(productoBusqueda)
	i = 0
	
	Mientras i <= 4 Hacer
		si nombreProducto[i] == productoBusqueda | idProducto[i] == productoBusqueda Entonces
			Mostrar cantidad[i]," ",nombreProducto[i]," $", precio[i]," ",idProducto[i]
			indice = i
			i = 10
		SiNo
			si i == 4 Entonces
				Mostrar "producto no encontrado"
			FinSi
		FinSi
		i = i + 1
	FinMientras
	
FinSubProceso

SubProceso agregarProducto(nombreProducto, cantidad, idProducto, precio)
	
	Mientras i <= 4 Hacer
		si nombreProducto[i] == "-" Entonces
			
			mostrar Sin Saltar "Ingrese el nombre del producto: "
			leer nombreProducto[i]
			mostrar Sin Saltar "Ingrese el id del producto: "
			leer idProducto[i]
			mostrar Sin Saltar "Ingrese la cantidad del producto: "
			leer cantidad[i]
			mostrar Sin Saltar "Ingrese el precio del producto: "
			leer precio[i]
			
			
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
	Mostrar "El monto total de las ventas fueron: ", precioTotal

	
FinSubProceso

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

