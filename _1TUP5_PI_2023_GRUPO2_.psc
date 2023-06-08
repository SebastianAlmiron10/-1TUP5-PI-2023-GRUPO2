Proceso _1TUP5_PI_2023_GRUPO2_
	Definir opcionMenu, cantidad, cantidadVentas como entero
	Definir nombreProducto como caracter
	Definir precio, precioTotal como real
	Definir flag Como Logico
	Dimension cantidad[5]
	Dimension nombreProducto[5]
	Dimension precio[5]
	precioTotal = 0
	cantidadVendida = 0
	
	nombreProducto[0] = "arroz"
	nombreProducto[1] = "jabon"
	nombreProducto[2] = "-"
	nombreProducto[3] = "-"
	nombreProducto[4] = "-"
	cantidad[0] = 3
	Repetir
		
		Repetir
			Mostrar "MENU"
			Mostrar "1. registrar ventas"
			Mostrar "2. ingresar producto"
			Mostrar "3. buscar producto"
			Mostrar "4. ordenar producto por stock"
			Mostrar "5. modificar producto"
			Mostrar "6. resumen del dia"
			Mostrar "7. SALIR"
			Mostrar Sin Saltar "ingresar opcion "
			Leer opcionMenu
			si opcionMenu > 5 | opcionMenu < 1 Entonces
				Mostrar "opcion invalida"
			FinSi
		Mientras que opcionMenu > 5 || opcionMenu < 1
		
		Segun opcionMenu Hacer
			1:
				registrarVenta(nombreProducto, precio, cantidad, cantidadVentas, precioTotal)
			2:
				
			3:
				indice = buscarProducto(nombreProducto, precio, cantidad)
			4:
				
			5:
				
		Fin Segun
		flag = Verdadero
	Mientras Que flag == Verdadero
FinProceso

SubProceso registrarVenta(nombreProducto, precio, cantidad, cantidadVentas Por Referencia, precioTotal Por Referencia)
	indice = buscarProducto(nombreProducto, precio, cantidad)
	Mostrar "ingresar cantidad a vender"
	Leer cantidadVendida
	si cantidadVendida > cantidad[indice]
		Mostrar"no cuenta con la cantidad deseada"
	SiNo
		cantidadVentas = cantidadVentas + 1
		precioTotal = precioTotal + precio[indice]
		cantidad[indice] = cantidad[indice]  - cantidadVendida
	FinSi	
FinSubProceso

SubProceso indice = buscarProducto(nombreProducto, precio, cantidad)
	Definir nombreProductoBusqueda como caracter
	Definir i como entero
	
	Mostrar "ingresar nombre del producto"
	Leer nombreProductoBusqueda
	
	i = 0
	
	Mientras i <= 4 Hacer
		si nombreProducto[i] == nombreProductoBusqueda Entonces
			Mostrar cantidad[i]," ",nombreProducto[i]," $", precio[i]
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
