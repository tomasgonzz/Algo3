!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'cantidadDeOrugas cantidadDeHuevosDeAvispas cantidadDePolillas'!

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:38:15'!
aumentarHuevoporOruga
	self hayRecursosParaReproducirse ifTrue: 
	[
		cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas +1.
		cantidadDeOrugas := cantidadDeOrugas - 1.	
		^true.
	] ifFalse: [	^false].
	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:47:56'!
aumentarHuevoporPolilla
	self hayRecursosParaReproducirse ifTrue: 
	[
		cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas +1.
		cantidadDePolillas := cantidadDePolillas - 1.	
		^true.
	] ifFalse: [^false].! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'Santi 4/21/2022 20:23:17'!
aumentarOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.
	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 13:24:23'!
aumentarPolilla
	cantidadDePolillas := cantidadDePolillas  +1.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'Santi 4/21/2022 20:06:09'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'Santi 4/21/2022 20:17:22'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 13:22:42'!
cantidadDePolillas
	^cantidadDePolillas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:18:34'!
eliminarHuevosConFirmaGenetica
	Oriana eliminarHuevos.
	Polly eliminarHuevos.
	Lara eliminarHuevos.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:16:33'!
hacerqueTengaRecursosSuficientes
	self aumentarOruga.
	self aumentarPolilla.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:43:28'!
hayRecursosParaReproducirse
	((self cantidadDeOrugas > 0) | (self cantidadDePolillas > 0)) ifTrue: [^true] ifFalse: [^false].
	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:55:32'!
retrocederAlInicioDeLosTiempos
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas  := 0.
	self eliminarHuevosConFirmaGenetica.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'VM 4/22/2022 20:08:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugas := 1.
	cantidadDeHuevosDeAvispas := 1.
	cantidadDePolillas := 0.! !


!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: 'CantidadDeHuevosDeLara'!

!Lara class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 20:02:16'!
agregarHuevo
	! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 20:05:24'!
agregarHuevo: unaAvispa
	unaAvispa eliminarUnHuevo.
	CantidadDeHuevosDeLara  := CantidadDeHuevosDeLara + 1.
	! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:59:28'!
cantidadDeHuevos
	^CantidadDeHuevosDeLara.! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:55:15'!
eliminarHuevos
	CantidadDeHuevosDeLara  := 0.! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 20:04:43'!
intentarReproducirse
	Oriana cantidadDeHuevos  > 0 ifTrue:
	[	self agregarHuevo: Oriana.
		^true.
	]ifFalse: 
	[
		Polly cantidadDeHuevos  > 0 ifTrue: 
		[	self agregarHuevo: Polly.
			^true.
		]
	]! !


!Lara class methodsFor: '--** private fileout/in **--' stamp: 'VM 4/22/2022 20:08:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	CantidadDeHuevosDeLara := 0.! !


!classDefinition: #Oriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oriana class' category: 'AvispasYAbejasParte2'!
Oriana class
	instanceVariableNames: 'CantidadDeHuevosDeOriana'!

!Oriana class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:30:41'!
aumentarCantidadHuevos
	CantidadDeHuevosDeOriana  := CantidadDeHuevosDeOriana + 1.! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:57:59'!
cantidadDeHuevos.
	^CantidadDeHuevosDeOriana.! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:53:57'!
eliminarHuevos.
	CantidadDeHuevosDeOriana  := 0.! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:59:31'!
eliminarUnHuevo
	CantidadDeHuevosDeOriana := CantidadDeHuevosDeOriana  - 1.! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:30:41'!
intentarReproducirse
	Habitat aumentarHuevoporOruga ifTrue: [self aumentarCantidadHuevos].
	! !


!Oriana class methodsFor: '--** private fileout/in **--' stamp: 'VM 4/22/2022 20:08:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	CantidadDeHuevosDeOriana := 1.! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
Oriana subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ornella class' category: 'AvispasYAbejasParte2'!
Ornella class
	instanceVariableNames: ''!

!Ornella class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:30:41'!
aumentarCantidadHuevos
	Oriana aumentarCantidadHuevos.! !


!Ornella class methodsFor: '--** private fileout/in **--' stamp: 'VM 4/22/2022 20:08:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	CantidadDeHuevosDeOriana := 6.! !


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: 'CantidadDeHuevosDePolly'!

!Polly class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:30:58'!
aumentarCantidadHuevos
	CantidadDeHuevosDePolly  := 	CantidadDeHuevosDePolly  +1.! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:59:12'!
cantidadDeHuevos
	^CantidadDeHuevosDePolly.! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 15:54:30'!
eliminarHuevos
	CantidadDeHuevosDePolly  := 0.! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 20:05:52'!
eliminarUnHuevo
	CantidadDeHuevosDePolly  := CantidadDeHuevosDePolly - 1.! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'VM 4/22/2022 19:30:58'!
intentarReproducirse
	Habitat aumentarHuevoporPolilla ifTrue: [self aumentarCantidadHuevos.].! !


!Polly class methodsFor: '--** private fileout/in **--' stamp: 'VM 4/22/2022 20:08:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	CantidadDeHuevosDePolly := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Santi 4/21/2022 19:55:13'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Santi 4/21/2022 19:55:13'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'VM 4/22/2022 15:11:08'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Santi 4/21/2022 19:55:13'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Santi 4/21/2022 19:55:13'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Santi 4/21/2022 19:55:13'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Santi 4/21/2022 19:55:13'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Santi 4/21/2022 19:55:13'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Santi 4/21/2022 19:55:13'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Santi 4/21/2022 19:55:13'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Santi 4/21/2022 19:55:13'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Santi 4/21/2022 19:55:13'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Santi 4/21/2022 19:55:13'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 15:57:21'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^Lara cantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 15:58:29'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^Oriana cantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 18:55:16'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^Oriana cantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 16:00:01'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^Polly cantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Santi 4/21/2022 19:56:57'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 13:17:31'!
hacerQueElHabitatTengaLosRecursosSuficientes
	^Habitat hacerqueTengaRecursosSuficientes.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 14:30:59'!
laAvispaLara
	^Lara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Santi 4/21/2022 19:58:14'!
laAvispaOriana
	^Oriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 19:28:34'!
laAvispaOrnella
	^Ornella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 13:09:16'!
laAvispaPolly
	^Polly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 13:10:57'!
queElHabitatTengaDosOrugasMas
	2 timesRepeat:
	[Habitat aumentarOruga.]
! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 14:30:37'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat:
	[Habitat aumentarPolilla]! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Santi 4/21/2022 20:22:36'!
queElHabitatTengaUnaOrugaMas
	Habitat aumentarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'VM 4/22/2022 13:23:49'!
queElHabitatTengaUnaPolillaMas
	Habitat aumentarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Santi 4/21/2022 20:13:11'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitat retrocederAlInicioDeLosTiempos.! !

Habitat initializeAfterFileIn!
Lara initializeAfterFileIn!
Oriana initializeAfterFileIn!
Ornella initializeAfterFileIn!
Polly initializeAfterFileIn!