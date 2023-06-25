Proceso _1TUP5_PI_2023_GRUPO2_
	Definir opcionMenu, cantidad, cantidadVentas, dim, dimC como entero
	Definir nombreProducto, idProducto, nombreCliente, dniCliente como caracter
	Definir precioUnitario, precioTotal, montoResumenDelDia como real
	Definir terminarPrograma, encontrado Como Logico
	dim = 10
	dimC = 5
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
	nombreCliente[1] = "juan"
	nombreCliente[2] = "mario"
	
	dniCliente[0] = "12345678"
	dniCliente[1] = "23456789"
	dniCliente[2] = "34567890"
	
	nombreProducto[0] = "arroz"
	nombreProducto[1] = "jabon"
	nombreProducto[2] = "tuco"
	nombreProducto[3] = "gaseosa"
	nombreProducto[4] = "salchicha"
	
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
			Mostrar "1. Registrar ventas"
			Mostrar "2. Agregar productos"
			Mostrar "3. Buscar productos"
			Mostrar "4. Ordenar productos por stock"
			Mostrar "5. Modificar productos"
			Mostrar "6. Resumen del dia"
			Mostrar "7. Agregar nuevo cliente"
			Mostrar "8. SALIR"
			Mostrar "---------------------------------------------"
			Mostrar Sin Saltar "Ingrese una de las opciones "
			Leer opcionMenu
			si opcionMenu > 8 | opcionMenu < 1 Entonces
				Mostrar "Opcion Invalida"
			FinSi
		Mientras que opcionMenu > 8 | opcionMenu < 1
		
		Segun opcionMenu Hacer
			1:
				registrarVenta(nombreProducto, precioUnitario, cantidad, cantidadVentas, precioTotal, idProducto, encontrado, nombreCliente, dniCliente, dimC, dim, montoResumenDelDia)
			2:
				agregarProducto(nombreProducto, cantidad, idProducto, precioUnitario, dim)
			3:
				indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, dim, encontrado)
			4:
				ordenarProductoPorMenorStock(nombreProducto, cantidad, idProducto, precioUnitario, dim)
			5:
				modificarProducto(nombreProducto, cantidad, idProducto, precioUnitario, encontrado)
			6:
				resumenDia(cantidadVentas, montoResumenDelDia)
			7:
				agregarNuevoCliente(nombreCliente, dniCliente, dimC)
			8:
				terminarPrograma = Verdadero
		Fin Segun
	Mientras Que terminarPrograma == Falso
FinProceso

//Subproceso de registrar venta, esta está conectada con la funcion de buscar producto, y obtiene el indice para saber el precioUnitario, cantidad, etc.
SubProceso registrarVenta(nombreProducto, precioUnitario, cantidad, cantidadVentas Por Referencia, montoSubtotal Por Referencia, idProducto, encontrado Por Referencia, nombreCliente, dniCliente, dimC, dim, montoResumenDelDia Por Referencia)
	definir productoCorrecto, otroProducto como logico
	Definir opcionMenu, cantidadResumen, i, esCliente, opcionCliente, validacionCantidad Como Entero
	Definir nombreProductoResumen, idProductoResumen Como Caracter
	Definir precioResumen, precioTotalDelProductoResumen, PrecioTotalDeLaVentaResumen, montoTotal, descuentoCliente Como Real
	Dimension cantidadResumen[100]
	Dimension nombreProductoResumen[100]
	Dimension precioResumen[100]
	Dimension idProductoResumen[100]
	Dimension precioTotalDelProductoResumen[100]
	Dimension PrecioTotalDeLaVentaResumen[100]
	
	flag = Falso
	i = 0  
	Repetir
		//se resetean las variables para que no sume la venta anterior
		montoSubtotal = 0
		precioTotalDelProductoResumen[i] = 0
		precioTotal = 0
		//llama a la funcion de buscar producto, que esta devolvera el indice del producto si lo encuentra y todo se modificara 
		// sobre ese indice ya que en el mismo indice se encuentra toda la informacion del producto, y modificara la variable encontrado
		indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, dim, encontrado)
		//si el valor de la variable 'encontrado' es verdadero, significa que encontro al producto
		si encontrado == Verdadero Entonces
			Mostrar Sin Saltar "Ingrese la cantidad a vender: "
			Repetir
				Leer cantidadVendida
				//despues de ingresar la cantidad comprueba que no sea mayor a lo que tiene en stock utilizando la variable 'indice'
				si cantidadVendida > cantidad[indice]
					Mostrar Sin Saltar "No cuenta con la cantidad deseada, ingrese nuevamente: "
					//la variable de 'validacionCantidad' sirve para que itere o no la variable 'i'
					validacionCantidad = 0
				SiNo
					//si la cantidad esta bien, hace los calculos para el precio total
					precioTotal = precioTotal + (precioUnitario[indice] * cantidadVendida)
					// y descuenta las cantidad vendida del stock
					cantidad[indice] = cantidad[indice]  - cantidadVendida
					productoCorrecto = Verdadero
					//agregar productos vendidos a una nueva matriz para mostrarla como resumen al final, 
					// la variable 'i' no itera si la cantidad esta mal, para no crear lugares vacios en la matriz
					nombreProductoResumen[i] = nombreProducto[indice]
					idProductoResumen[i] = idProducto[indice]
					cantidadResumen[i] = cantidadVendida
					precioResumen[i] = precioUnitario[indice]
					precioTotalDelProductoResumen[i] = precioTotal
					montoSubtotal = montoSubtotal + precioTotalDelProductoResumen[i]
					
					validacionCantidad = 1
				FinSi	
			Mientras Que productoCorrecto = Falso
		FinSi
		//pregunta se desea agregar mas prodcutos a la venta, si es asi, la variable 'otroProducto' toma el valor verdadero y se repite el bucle
		Mostrar "¿Desea agregar otros productos a la venta? 1. Seguir  2. Salir"
		Repetir
			Leer opcionMenu
			si opcionMenu < 1 o opcionMenu > 2 Entonces
				mostrar "Opcion incorrecta, intente nuevamente"
			FinSi
			
		Mientras Que opcionMenu < 1 o opcionMenu > 2
		Segun opcionMenu Hacer
			1:
				otroProducto = Verdadero
			De Otro Modo:
				otroProducto = Falso
		Fin Segun
		si validacionCantidad == 1 Entonces
			i = i + 1;
		FinSi
	Mientras Que otroProducto == Verdadero
	
	//pregunta si es cliente
	Mostrar "¿Es cliente? 1. Si  2. No"
	Repetir
		leer esCliente
		si esCliente < 1 o esCliente > 2 Entonces
			mostrar "Opcion incorrecta, intente nuevamente"
		FinSi
	Mientras Que esCliente < 1 o esCliente > 2
	Segun esCliente Hacer
		1:
			//si la respuesta es si, llama a la funcion de buscar cliente, si el cliente es encontrado, se le aplica descuento
			clienteEncontrado = buscarCliente(nombreCliente, dniCliente, dimC)
		2:
			//si la respuesta es no, le pregunta si se quiere asociar para tener el descuento en la proxima compra
			Mostrar "¿Desea Registrar al Cliente? 1. Si 2.No"
			Repetir
				Leer opcionCliente
				si opcionCliente < 1 o opcionCliente > 2 Entonces
					mostrar "Opcion incorrecta, intente nuevamente"
				FinSi
			Mientras Que opcionCliente < 1 o opcionCliente > 2
			
			Segun opcionCliente Hacer
				1: 
					//si la respuesta es si, llama a la funcion de agregar nuevo cliente, y ahi comprueba que no sea un cliente existente
					agregarNuevoCliente(nombreCliente, dniCliente, dimC)
				De Otro Modo:
					//de otro modo es no
			FinSegun
		De Otro Modo:
			//de otro modo es no
	Fin Segun
	
	//ya una ves que no agrega mas producto, la variable 'otroProducto' toma el valor falso y  entra para mostrar el resumen
	si otroProducto == Falso Entonces
		//muestra resumen de la venta
		Para j = 0 Hasta i - 1 Hacer//y j itera hasta donde se agregaron productos, osea el valor de i - 1
			Mostrar Sin Saltar cantidadResumen[j]," | ",nombreProductoResumen[j]," | $", precioResumen[j]," | ",idProductoResumen[j]," | $",precioTotalDelProductoResumen[j]
			Mostrar ""
			//suma una venta mas para el resumen del dia
			cantidadVentas = cantidadVentas + 1
		FinPara
		//Si es Cliente Tiene 15% de Descuento
		Mostrar "Monto subtotal $",montoSubtotal
		Si clienteEncontrado == 1 Entonces
			descuentoCliente = montoSubtotal * 0.15
			Mostrar "Descuento cliente $", descuentoCliente
			montoTotal = montoSubtotal - descuentoCliente
			Mostrar "Monto total a pagar $", montoTotal
		SiNo
			montoTotal = montoSubtotal
			Mostrar "Monto total a pagar $", montoTotal
		FinSi
	FinSi
	montoResumenDelDia = montoResumenDelDia + montoTotal
FinSubProceso

//Funcion de buscar cliente
SubProceso clienteEncontrado = buscarCliente(nombreCliente, dniCliente, dimC)
	Mostrar "Ingrese el nombre o dni del cliente"
	Repetir
		Leer clienteBusqueda
		si Longitud(clienteBusqueda) > 8 y Longitud(clienteBusqueda) < 7 Entonces
			mostrar "El dni no puede superar los 8 digitos"
			
		FinSi
	Mientras Que Longitud(clienteBusqueda) > 8 y Longitud(clienteBusqueda) < 7
	
	
	//ingresa el nombre o dni del cliente y lo convierte todo a minuscula
	clienteBusqueda = Minusculas(clienteBusqueda)
	i = 0
	
	//con una busqueda secuencial busca coincidencia con el nombre o dni ingresado anterior mente
	Mientras i <= dimC - 1 Hacer
		si nombreCliente[i] == clienteBusqueda | dniCliente[i] == clienteBusqueda Entonces
			//si no encuentra lo muetra, y la funcion devuelve el valor 1 si lo encuentra o 0 si no, dentro de la variable 'clienteEncontrado'
			Mostrar nombreCliente[i]," ",dniCliente[i]
			i = dimC + 1
			clienteEncontrado = 1
		SiNo
			//si no lo encuentra y ya lo recorrio completo, muestra que no fue encontrado y devuelve el valor 0
			si i == dim - 1 Entonces
				Mostrar "Cliente no encontrado"
				ClienteEncontrado = 0
			FinSi
		FinSi
		i = i + 1
	FinMientras
FinSubProceso
//fin funcion de buscar cliente

//subproceso de agregar nuevo cliente
SubProceso agregarNuevoCliente(nombreCliente, dniCliente, dimC)
	Definir i, j, existente como entero
	Definir dniAux Como Caracter
	i = 0
	j = 0
	Mientras i <= dimC - 1 Hacer
		//va iterando 'i' hasta encontrar un lugar vacio en la lista
		Si nombreCliente[i] == "" y dniCliente[i] == "" Entonces
			Mostrar "Ingrese el Dni del Cliente: "
			Repetir
				Leer dniAux
				si Longitud(dniAux) > 8 y Longitud(dniAux) < 7 Entonces
					mostrar "El dni es invalido, intente nuevamente"
				FinSi
			Mientras Que Longitud(dniAux) > 8 y Longitud(dniAux) < 7
			
			//con una busqueda secuencial comprueba que el dni no este repetido
			Mientras j <= dimC - 1 Hacer
				Si dniCliente[j] == dniAux Entonces
					//si existe se lo dice y la variable 'existente' toma el valor 0
					Mostrar "El cliente ya existe"
					existente = 0
					j = 11
				SiNo
					//si no existe guarda el dni en la lista y la variable 'existente' toma el valor 1
					dniCliente[i] = dniAux
					existente = 1
					j = 11
				FinSi
				j = j + 1 
			FinMientras
			//si la variable 'existente' tiene el valor 1, significa que el cliente no existia en la lista, y procede a pedirle el nombre
			Si existente == 1 Entonces
				Mostrar "Ingrese el nombre del cliente: "
				Leer nombreCliente[i]
			FinSi
			
			i = dimC + 1
		FinSi
		i = i + 1
	FinMientras
FinSubProceso
//fin subproceso de agregar nuevo cliente

//funcion de buscar producto, esta misma devuelve el indice que sirve para otros subprocesos
SubProceso indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, dim, encontrado Por Referencia)
	Definir productoBusqueda como caracter
	Definir i como entero
	
	//lee el nombre o id del producto y lo guarda en una variable auxiliar
	Mostrar "Ingrese el nombre del producto o id del producto"
	Leer productoBusqueda
	//lo convierte a minuscula
	productoBusqueda = Minusculas(productoBusqueda)
	
	i = 0

	Mientras i <= dim - 1 Hacer
		//va iterando "i" hasta que la variable auxiliar coincide con el nombre o el id
		si nombreProducto[i] == productoBusqueda | idProducto[i] == productoBusqueda Entonces
			//se muestra el producto
			Mostrar cantidad[i]," | ",nombreProducto[i]," | $", precioUnitario[i]," | ",idProducto[i]
			//una vez que lo encuentra guarda el valor de "i" en una variable llamada "indice" que servira para calcular el total y descontar la cantidad
			indice = i
			i = dim + 1
			//la variable "encontrado" que fue mandada por referencia, se le asigna el valor verdadero, para indicar que el producto se ha encontrado
			encontrado = Verdadero
		SiNo
			//si no lo encuentra y ya paso por todo el array, significa que "i" es igual a la dimencion - 1, y ya el producto no fue encontrado
			si i == dim - 1 Entonces
				Mostrar "Producto no encontrado"
				//y la variable "encontrado" toma el valor de falso, que indicara de donde fue llamada que no continue
				encontrado = Falso
			FinSi
		FinSi
		i = i + 1
	FinMientras
FinSubProceso
//fin funcion de buscar producto

//Subproceso de agregar producto, esta busca en la lista lso productos vacios ( "-", " ", "" ), y ahi permite rellenar ese campo
SubProceso agregarProducto(nombreProducto, cantidad, idProducto, precioUnitario, dim)
	Definir precioAux como real
	Definir cantidadAux, repetido Como Entero
	Definir idProductoAux, nombreProductoAux Como Caracter
	
	Mientras i <= dim - 1 Hacer
		//'i' va iterando hasta encontrar el lugar en el array vacio
		si nombreProducto[i] == "" Entonces
			//una vez encontrado pide los datos
			mostrar Sin Saltar "Ingrese el nombre del producto: "
			Repetir
				//se crea una variable auxiliar para cada valor de la lista, esto es para validarlo antes agregarlo a la 'base de datos/array'
				leer nombreProductoAux
				//lee el valor ingresado y comprueba que sea un nombre valido
				si nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " " Entonces
					Mostrar "Nombre invalido, ingrese nuevamente"
				SiNo
					//una vez que ingreso un nombre valido lo agrega a la variable principal en el array
					nombreProducto[i] = nombreProductoAux
				FinSi
			mientras que nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " "
			//y asi con el resto de los datos
			mostrar Sin Saltar "Ingrese el id del producto: "
			Repetir
				leer idProductoAux
				//llama a la funcion para comprobar si el id no esta repetido, que esta le devolvera a la variable 'repetido' un valor de 1 si es repetido o 0 si no
				repetido = idRepetido(idProducto, idProductoAux, dim)
				//validacion para que el id no sea mayor a 5 digitos
				si (Longitud(idProductoAux) <> 5) | (repetido == 1) Entonces
					Mostrar "Id invalido, ingrese nuevamente"
				SiNo
					idProducto[i] = idProductoAux
				FinSi
			Mientras que Longitud(idProductoAux) <> 5 o (repetido == 1)
			
			mostrar Sin Saltar "Ingrese la cantidad del producto: "
			Repetir
				leer cantidadAux
				si cantidadAux < 1 Entonces
					Mostrar "Cantidad invalido, ingrese nuevamente"
				SiNo
					cantidad[i] = cantidadAux
				FinSi
			Mientras Que cantidadAux < 1
			
			mostrar Sin Saltar "Ingrese el precio unitario del producto: "
			Repetir
				leer precioAux
				si precioAux < 1 Entonces
					Mostrar "Precio unitario invalido, ingrese nuevamente"
				SiNo
					precioUnitario[i] = precioAux
				FinSi
			Mientras Que precioAux < 1
			
			i = dim + 1
		SiNo
			si i == dim - 1 Entonces
				Mostrar "Inadmisible"
			FinSi
		FinSi
		i = i + 1
	FinMientras
	
FinSubProceso

//buscar si el id ingresaado ya existe
SubProceso repetido = idRepetido(idProducto, idProductoAux Por Referencia, dim)
	i = 0
	//busqueda secuencial para buscar si el id no esta repetido
	Mientras i <= dim - 1 Hacer
		si idProducto[i] == idProductoAux Entonces
			//si lo encuentra, es que esta repetido y devuelve el valor 1 en la variable 'repetido'
			repetido = 1
			i = dim + 1
		SiNo
			//si no toma el valor 0
			repetido = 0
		FinSi
		i = i + 1
	FinMientras
FinSubProceso
//fin SubProceso de buscar id

//SubProceso de ordenar producto por menor stock
SubProceso ordenarProductoPorMenorStock(nombreProducto, cantidad, idProducto, precioUnitario, dim)
	Definir i, j, posMenor, aux Como Entero
	Definir auxNombre, auxId Como Caracter
	Definir auxPrecio Como Real
	
	//algoritmo de ordenamiento
	Para i = 0 Hasta dim - 2 Hacer
		posMenor = i
		Para j = i + 1 Hasta dim - 1 Hacer
			//ordena los productos de menor a mayor
			si cantidad[j] < cantidad[posMenor] Entonces
				posMenor = j
			FinSi
		FinPara
		
		//usa una variable auxiliar para cada parte de la lista, si asi ordenar todo
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
		//imprime la lista ordenada sin mostrar los lugares vacios
		Si nombreProducto[j] <> ""
			Mostrar Sin Saltar cantidad[j]," | ",nombreProducto[j]," | $", precioUnitario[j]," | ",idProducto[j]
			Mostrar ""
		FinSi
	FinPara
FinSubProceso
//fin subproceso de ordenar stock

//SubProceso de modicar un producto
SubProceso modificarProducto(nombreProducto, cantidad, idProducto, precioUnitario, encontrado Por Referencia)
	Definir opcionMenu Como Entero
	//la funcios de buscar producto modifica la variable 'encontrado' a verdadera o falsa, si encontro o no el producto
	indice = buscarProducto(nombreProducto, precioUnitario, cantidad, idProducto, dim, encontrado)
	
	si encontrado == Verdadero Entonces
		//si encontro el producto entra y pregunta que quiere modificar del producto
		Mostrar "QUE QUIERE MODIFICAR DEL PRODUCTO"
		Mostrar "1. Nombre"
		Mostrar "2. Id"
		Mostrar "3. Cantidad"
		Mostrar "4. Precio"
		
		Leer opcionMenu
		Segun opcionMenu Hacer
				//una vez que elije que quiere modificar, se valida que este bien y se cambia,
				//ya que la funcion anterior devuelve el indice del producto, se modifica sin problema
			1:
				Repetir
					//variable auxilia para que no entre en la base de datos sin comprobarla
					Mostrar Sin Saltar "Ingresar nombre"
					leer nombreProductoAux
					si nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " " Entonces
						Mostrar "Nombre invalido, ingrese nuevamente"
					SiNo
						nombreProducto[indice] = nombreProductoAux
					FinSi
				mientras que nombreProductoAux == "" | nombreProductoAux == "-" | nombreProductoAux == " "
			2:
				mostrar Sin Saltar "Ingrese el id del producto (ejem: #1234): "
				Repetir
					leer idProductoAux
					//llama a la funcion para comprobar si el id no esta repetido, que esta le devolvera a la variable 'repetido' un valor de 1 si es repetido o 0 si no
					repetido = idRepetido(idProducto, idProductoAux, dim)
					//validacion para que el id no sea mayor a 5 digitos
					si Longitud(idProductoAux) <> 5 | (repetido == 1) Entonces
						Mostrar Sin Saltar "Id invalido, ingrese nuevamente: "
					SiNo
						idProducto[indice] = idProductoAux
					FinSi
				Mientras que Longitud(idProductoAux) <> 5
			3:
				mostrar Sin Saltar "Ingrese la cantidad del producto: "
				Repetir
					//variable auxilia para que no entre en la base de datos sin comprobarla
					leer cantidadAux
					//validacion para que el cantidad no sea negativa
					si precioAux < 1 Entonces
						Mostrar "Cantidad invalido, ingrese nuevamente"
					SiNo
						cantidad[indice] = cantidadAux
					FinSi
				Mientras Que cantidadAux < 1
			4:
				mostrar Sin Saltar "Ingrese el precio unitario del producto: "
				Repetir
					//variable auxilia para que no entre en la base de datos sin comprobarla
					leer precioAux
					//validacion para que el precio no sea negativo
					si precioAux < 1 Entonces
						Mostrar "Precio unitario invalido, ingrese nuevamente"
					SiNo
						precioUnitario[indice] = precioAux
					FinSi
				Mientras Que precioAux < 1
		Fin Segun
	FinSi
	
FinSubProceso
//fin SubProceso de modificar producto

//SubProceso para mostrar el resumen del dia
SubProceso resumenDia(cantidadVentas, montoResumenDelDia)
	
	Mostrar "Las ventas totales del dia fueron: ", cantidadVentas
	Mostrar "El monto total de las ventas fueron: ", montoResumenDelDia
	
FinSubProceso
//fin SubProceso de resumen del dia