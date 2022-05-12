!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'VM 5/6/2022 15:03:25'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'VM 5/6/2022 15:19:31'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'VM 5/6/2022 19:51:10'!
* aMultiplier
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'VM 5/6/2022 19:51:13'!
+ anAdder
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'VM 5/6/2022 13:23:56'!
- aSubtrahend
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'VM 5/6/2022 19:51:18'!
/ aDivisor
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'VM 5/6/2022 19:51:22'!
negated
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'VM 5/6/2022 19:51:30'!
isNegative
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'VM 5/6/2022 19:51:33'!
isOne
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'VM 5/6/2022 19:51:36'!
isZero
	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'accessing' stamp: 'VM 5/6/2022 19:52:32'!
integerValue
	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 15:50:48'!
* aMultiplier 
	^aMultiplier beMultipliedWithAnEntero: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'vm 5/5/2022 20:56:39'!
+ anAdder 
	^anAdder beAddedToAnEntero: self.


! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 15:48:31'!
- aSubtrahend 
	^aSubtrahend beSubtractedFromAnEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VM 5/6/2022 16:13:56'!
/ aDivisor 
	^aDivisor dividesAnEntero: self.
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 20:42:37'!
fibonacci
	self subclassResponsibility.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'VM 5/8/2022 15:30:33'!
// aDivisor 
	^self class with: value // aDivisor integerValue
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'VM 5/6/2022 19:52:47'!
greatestCommonDivisorWith: anEntero 
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'asserting' stamp: 'VM 5/9/2022 14:41:02'!
canDivide: aDividend
	^aDividend isNotCero: self.
	! !

!Entero methodsFor: 'asserting' stamp: 'VM 5/9/2022 14:56:44'!
confirmThatIsNotOne: numerator
	^Fraccion new initializeWith: numerator over: self! !

!Entero methodsFor: 'asserting' stamp: 'VM 5/9/2022 14:53:57'!
isNotCero: aDivisor
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator confirmThatIsNotOne: numerator.
	
	! !


!Entero methodsFor: 'comparing' stamp: 'VM 5/6/2022 15:23:18'!
= anObject
	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'VM 5/6/2022 19:52:20'!
hash
	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'VM 5/6/2022 19:52:25'!
initializeWith: aValue 
	value := aValue! !


!Entero methodsFor: 'operations with a Fraccion' stamp: 'VM 5/8/2022 15:56:40'!
beAddedToAFraccion: anAugend
	^(self* anAugend denominator + anAugend numerator)/ anAugend  denominator.! !

!Entero methodsFor: 'operations with a Fraccion' stamp: 'VM 5/8/2022 15:56:59'!
beMultipliedWithAFraccion: aMultiplicand
	^self * aMultiplicand numerator / aMultiplicand denominator	! !

!Entero methodsFor: 'operations with a Fraccion' stamp: 'VM 5/8/2022 16:22:54'!
beSubtractedFromAFraccion: aMinuend
	^aMinuend numerator - (self*aMinuend denominator) / aMinuend denominator.! !

!Entero methodsFor: 'operations with a Fraccion' stamp: 'VM 5/8/2022 15:57:29'!
dividesAFraccion: aDividend
	^(aDividend numerator / (aDividend denominator * self)).
	! !


!Entero methodsFor: 'operations with another Entero' stamp: 'vm 5/5/2022 20:17:30'!
beAddedToAnEntero: anAugend
	^self class with: anAugend integerValue + self integerValue. ! !

!Entero methodsFor: 'operations with another Entero' stamp: 'VM 5/8/2022 15:50:39'!
beMultipliedWithAnEntero: aMultiplicand
	^self class with: value * aMultiplicand integerValue.! !

!Entero methodsFor: 'operations with another Entero' stamp: 'VM 5/8/2022 16:23:00'!
beSubtractedFromAnEntero: aMinuend
	^self class with: aMinuend integerValue - self integerValue.! !

!Entero methodsFor: 'operations with another Entero' stamp: 'VM 5/8/2022 16:07:44'!
dividesAnEntero: aDividend
	^Fraccion with: aDividend over: self.! !


!Entero methodsFor: 'printing' stamp: 'VM 5/6/2022 19:52:39'!
printOn: aStream
	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'VM 5/6/2022 19:51:44'!
isNegative
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'VM 5/6/2022 19:51:47'!
isOne
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'VM 5/6/2022 19:51:51'!
isZero
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'VM 5/8/2022 20:51:00'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	(aValue isZero) ifTrue: [^Cero new initialize].
	(aValue = 1) ifTrue: [^Uno new initialize].
	(aValue < 0) ifTrue: [^Negativo new initializeWith: aValue].
	(aValue > 0) ifTrue: [^Natural new initializeWith: aValue].
	
	^self new initializeWith: aValue.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 20:42:53'!
fibonacci
	^Entero with: 1.! !


!Cero methodsFor: 'asserting' stamp: 'VM 5/8/2022 21:57:07'!
canDivide: aDividend
	^self error: Entero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'asserting' stamp: 'VM 5/8/2022 21:57:41'!
isNotCero: aDividend
	^self! !


!Cero methodsFor: 'initialization' stamp: 'VM 5/8/2022 20:52:37'!
initialize
	value := 0.! !


!classDefinition: #Natural category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Natural
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Natural methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 20:54:25'!
fibonacci
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 20:54:04'!
fibonacci
	^self error: Entero negativeFibonacciErrorDescription. ! !


!Negativo methodsFor: 'asserting' stamp: 'VM 5/8/2022 21:53:32'!
canDivide: aDividend
	 ^aDividend negated / self negated.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 20:43:29'!
fibonacci
	^self.! !


!Uno methodsFor: 'asserting' stamp: 'VM 5/8/2022 22:00:45'!
canDivide: aDividend
	^aDividend! !

!Uno methodsFor: 'asserting' stamp: 'VM 5/9/2022 14:54:49'!
confirmThatIsNotOne: numerator
	^numerator.! !


!Uno methodsFor: 'initialization' stamp: 'VM 5/8/2022 20:47:38'!
initialize 
	value := 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 15:57:08'!
* aMultiplier 
	^aMultiplier beMultipliedWithAFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 15:56:50'!
+ anAdder 
	^anAdder beAddedToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 15:57:22'!
- aSubtrahend 
	^aSubtrahend beSubtractedFromAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VM 5/8/2022 15:57:37'!
/ aDivisor 
	^aDivisor dividesAFraccion: self.
	! !


!Fraccion methodsFor: 'comparing' stamp: 'VM 5/6/2022 19:53:37'!
= anObject
	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'VM 5/6/2022 19:53:40'!
hash
	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'VM 5/6/2022 19:53:45'!
denominator
	^denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'VM 5/6/2022 19:53:51'!
numerator
	^numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'VM 5/8/2022 16:31:40'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	"aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ]."
	"aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ]."
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'VM 5/6/2022 19:54:07'!
isNegative
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'VM 5/6/2022 19:54:12'!
isOne
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'VM 5/6/2022 19:54:15'!
isZero
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'VM 5/6/2022 19:54:19'!
printOn: aStream
	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'operations with another Fraccion' stamp: 'VM 5/8/2022 15:58:45'!
beAddedToAFraccion: anAugend
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAugend denominator) + (denominator * anAugend numerator).
	newDenominator := denominator * anAugend denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'operations with another Fraccion' stamp: 'VM 5/8/2022 15:58:50'!
beMultipliedWithAFraccion: aMultiplicand
	^(self numerator  * aMultiplicand numerator) / (self denominator  * aMultiplicand  denominator).! !

!Fraccion methodsFor: 'operations with another Fraccion' stamp: 'VM 5/8/2022 16:23:13'!
beSubtractedFromAFraccion: aMinuend
	| newNumerator newDenominator |
	
	newNumerator := (denominator * aMinuend numerator) - (numerator * aMinuend denominator). 
	newDenominator := denominator * aMinuend denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'operations with another Fraccion' stamp: 'VM 5/8/2022 15:59:00'!
dividesAFraccion: aDividend
	^((denominator * aDividend numerator) / (numerator *  aDividend denominator)).! !


!Fraccion methodsFor: 'operations with an Entero' stamp: 'VM 5/6/2022 19:54:27'!
beAddedToAnEntero: anAugend
	^anAugend * self denominator + self numerator / self denominator.! !

!Fraccion methodsFor: 'operations with an Entero' stamp: 'VM 5/8/2022 15:51:18'!
beMultipliedWithAnEntero: aMultiplicand
	^(aMultiplicand * self numerator / self denominator).! !

!Fraccion methodsFor: 'operations with an Entero' stamp: 'VM 5/8/2022 16:23:21'!
beSubtractedFromAnEntero: aMinuend
	^(aMinuend*self denominator - self numerator) / self denominator.! !

!Fraccion methodsFor: 'operations with an Entero' stamp: 'VM 5/6/2022 16:47:10'!
dividesAnEntero: aDividend
	^(self denominator / (aDividend*self numerator)).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'VM 5/9/2022 14:40:14'!
with: aDividend over: aDivisor
	^aDivisor canDivide: aDividend.
	! !