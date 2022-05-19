!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 17:19:04'!
añadirYSuspenderenLibro: unLibro aCliente: unCliente

	unLibro addCustomerNamed: unCliente.
	unLibro suspendCustomerNamed: unCliente.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:38:50'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook tiempo|
	customerBook := CustomerBook new.
	tiempo := self tiempoEnEjecutar: [ customerBook addCustomerNamed: 'John Lennon'].
	
	self assert: (tiempo) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:38:57'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook tiempo|
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: 'Paul McCartney'.
	tiempo := self tiempoEnEjecutar: [ customerBook removeCustomerNamed: 'Paul McCartney'].
	
	
	self assert: (tiempo) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:25:13'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:31:24'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarEnBloque: [ customerBook removeCustomerNamed: 'Paul McCartney'. self fail ] sielCliente: johnLennon estaEnLibro: customerBook conEstado: NotFound.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:22:22'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self añadirYSuspenderenLibro: customerBook aCliente: paulMcCartney .
	self verificarCantidadDeClientesEnLibro: customerBook Activos: 0 Suspendidos: 1 Total: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:22:40'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self añadirYSuspenderenLibro: customerBook aCliente: paulMcCartney .
	customerBook removeCustomerNamed: paulMcCartney.
	self verificarCantidadDeClientesEnLibro: customerBook Activos: 0 Suspendidos: 0 Total: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:30:43'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarEnBloque: [ customerBook suspendCustomerNamed: 'Ringo Starr'. self fail ]  sielCliente: johnLennon  estaEnLibro: customerBook conEstado: CantSuspend.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:31:56'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self añadirYSuspenderenLibro: customerBook aCliente: johnLennon.
	
	self verificarEnBloque: [ customerBook suspendCustomerNamed: johnLennon. self fail ]  sielCliente: johnLennon estaEnLibro: customerBook conEstado: CantSuspend.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:38:39'!
tiempoEnEjecutar: unBloque

	| millisecondsBeforeRunning  millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	unBloque value.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:21:50'!
verificarCantidadDeClientesEnLibro: unLibro Activos: activos Suspendidos: suspendidos Total: totales 

	self assert: activos equals: unLibro numberOfActiveCustomers.
	self assert: suspendidos equals: unLibro numberOfSuspendedCustomers.
	self assert: totales equals: unLibro numberOfCustomers.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VM 5/1/2022 18:28:52'!
verificarEnBloque: unBloque sielCliente: unCliente estaEnLibro: unLibro conEstado: unEstado

	unBloque
		on: unEstado
		do: [ :anError | 
			self assert: unLibro numberOfCustomers = 1.
			self assert: (unLibro includesCustomerNamed: unCliente) ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'VM 5/1/2022 17:26:33'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'VM 5/1/2022 17:28:22'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'VM 5/1/2022 18:16:20'!
removeCustomerNamed: aName 

	(active includes: aName) ifTrue: [active remove: aName. ^aName].
    	(suspended includes: aName) ifTrue: [suspended remove: aName. ^aName].

    	^ NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
