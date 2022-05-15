!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!OOStackTest methodsFor: 'testLimit' stamp: 'VM 5/15/2022 15:18:41'!
test11CannotPushWhenFull
	| stack |
	
	stack := (OOStack new initializeWithLimit: 3) push: 'holis'; push: 'valen'; push: 'tomas'. 
	
	self
		should: [ stack push: 'something' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackFullErrorDescription]
		! !

!OOStackTest methodsFor: 'testLimit' stamp: 'VM 5/15/2022 15:25:10'!
test12CannotInitializeStackWithZero
	
	| stack |
	
	self
		should: [ stack := OOStack new initializeWithLimit: 0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack limitCanOnlyBeANaturalErrorDescription]

	! !

!OOStackTest methodsFor: 'testLimit' stamp: 'VM 5/15/2022 15:25:49'!
test13CannotInitializeStackWithNegative
	
	| stack |
	
	self
		should: [ stack := OOStack new initializeWithLimit: -3]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack limitCanOnlyBeANaturalErrorDescription]
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'asserting' stamp: 'VM 5/15/2022 16:02:15'!
assertThat: aBlockToEvaluate endsWithError: anErrorExpected

	self
		should: aBlockToEvaluate
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = anErrorExpected].! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:28:59'!
test01CantFindAnEmptyPrefix

	| stack sentenceFinder |
	
	stack := (OOStack new) push: 'holis'; push: 'valen'; push: 'tomas'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	sentenceFinder initializeWithStack: stack.
	
	self assertThat: [ sentenceFinder find: ''] endsWithError: SentenceFinderByPrefix prefixEmptyErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:29:56'!
test02CantInitializeWithAnEmptyStack

	| stack sentenceFinder |
	
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assertThat: [ sentenceFinder initializeWithStack: stack.] endsWithError: SentenceFinderByPrefix stackIsEmptyErrorDescription! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:30:29'!
test03CantFindWordNotInStack

	| stack sentenceFinder |
	
	stack := (OOStack new) push: 'holis'; push: 'valen'; push: 'tomas'.
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder initializeWithStack: stack.
	
	self assertThat: [ sentenceFinder find: 'Algo3'] endsWithError: SentenceFinderByPrefix sentenceWasNotFoundErrorDescription. ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:31:06'!
test04CantFindAPrefixWithAnEmptySpace

	| stack sentenceFinder |
	
	stack := (OOStack new) push: 'holis'; push: 'valen'; push: 'tomas'.
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder initializeWithStack: stack.
	
	self assertThat: [ sentenceFinder find: 'h ola'] endsWithError: SentenceFinderByPrefix prefixHasAnSpaceErrorDescription. ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:31:19'!
test05CanFindWordInStack

	| stack sentenceFinder findings |
	
	stack := (OOStack new) push: 'holis'; push: 'valen'; push: 'tomas'.
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder initializeWithStack: stack.
	
	findings := (sentenceFinder find: 'va') first.
	
	self assert: 'valen' equals: findings.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:33:13'!
test06CanFindMultipleWordsInStack

	| stack sentenceFinder findings expectedCollection |
	
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.
	stack push: 'holis'; push: 'valen'; push: 'tomas'; push: 'valentin'.
	
	expectedCollection := #('valentin' 'valen') asOrderedCollection.
	
	sentenceFinder initializeWithStack: stack.
	
	findings := sentenceFinder find: 'va'.
	
	self assert: findings = expectedCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 16:13:35'!
test07InitializationDoesNotModifyPreviousStack

	| stack sentenceFinder expectedCollection collectionOrderedAccordingToStack |
	
	stack := (OOStack new)  push: 'holis'; push: 'valen'; push: 'tomas'.
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder initializeWithStack: stack.
	
	expectedCollection := #('tomas' 'valen' 'holis') asOrderedCollection.
	collectionOrderedAccordingToStack := (OrderedCollection new).
	collectionOrderedAccordingToStack add: stack pop; add: stack pop; add: stack pop.
	
	self assert: expectedCollection = collectionOrderedAccordingToStack.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'VM 5/15/2022 15:33:21'!
test08CanFindWordConsideringCaseSensitive 

	| stack sentenceFinder findings expectedCollection |
	
	stack := (OOStack new) push: 'winter is coming'; push: 'winning is everything'; push: 'Winds of Winter'; push: 'Winter is here'.
	sentenceFinder := SentenceFinderByPrefix new.
	
	expectedCollection := #('winning is everything' 'winter is coming') asOrderedCollection.
	
	sentenceFinder initializeWithStack: stack.
	
	findings := sentenceFinder find: 'wi'.
	
	self assert: findings = expectedCollection.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'VM 5/13/2022 17:06:03'!
pop
	^self state popFromTheStack: self
	! !

!OOStack methodsFor: 'operations' stamp: 'VM 5/13/2022 17:27:20'!
popElement
	^content removeLast.
	


	! !

!OOStack methodsFor: 'operations' stamp: 'VM 5/15/2022 16:00:51'!
push: anElement
	self state pushTheElement: anElement inTheStack: self.
	! !

!OOStack methodsFor: 'operations' stamp: 'TG 5/15/2022 09:21:56'!
pushElement: anElement
	content addLast: anElement.
	! !


!OOStack methodsFor: 'accessing' stamp: 'VM 5/12/2022 11:33:24'!
size
	^content size.! !

!OOStack methodsFor: 'accessing' stamp: 'VM 5/13/2022 17:09:33'!
top
	^self state topFromTheStack: self. ! !

!OOStack methodsFor: 'accessing' stamp: 'VM 5/13/2022 16:05:09'!
topElement
	^content first. ! !


!OOStack methodsFor: 'creating' stamp: 'TG 5/15/2022 09:35:48'!
state
	StackState subclasses 
	detect: [:subclass | subclass sizeCheck: self size isLargerThan: limit] 
	ifFound: [:subclass | ^subclass new] 
	ifNone: [].
	! !


!OOStack methodsFor: 'initialization' stamp: 'TG 5/15/2022 09:32:38'!
initialize 
	self initializeWithLimit: (PlusInfinity new).! !

!OOStack methodsFor: 'initialization' stamp: 'VM 5/15/2022 16:01:47'!
initializeWithLimit: aLimit

	content := OrderedCollection new.
	
	(aLimit <= 0) ifTrue: [^self error: OOStack limitCanOnlyBeANaturalErrorDescription].
	
	limit := aLimit
	
	! !


!OOStack methodsFor: 'asserting' stamp: 'VM 5/13/2022 17:31:11'!
isEmpty
	^self size = 0.! !


!OOStack methodsFor: 'error handling' stamp: 'VM 5/13/2022 17:20:21'!
popWhenEmpty
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'error handling' stamp: 'TG 5/15/2022 09:20:30'!
pushWhenFull: anElement
	^self error: self class stackFullErrorDescription. 
	! !

!OOStack methodsFor: 'error handling' stamp: 'VM 5/13/2022 17:20:53'!
topWhenEmpty
	^self error: self class stackEmptyErrorDescription. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'VM 5/15/2022 15:24:30'!
limitCanOnlyBeANaturalErrorDescription
	^'Limit can only be a Natural'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'VM 5/11/2022 09:18:13'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'TG 5/15/2022 09:18:30'!
stackFullErrorDescription
	^ 'Stack is full'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'errorHandling' stamp: 'VM 5/15/2022 16:09:32'!
verifyThatTheCollection: aCollection isEmptyThenExecuteABlock: aBlockToBeExecuted

	(aCollection isEmpty) ifTrue: aBlockToBeExecuted.! !

!SentenceFinderByPrefix methodsFor: 'errorHandling' stamp: 'VM 5/15/2022 14:45:17'!
verifyThatThePrefixIsValid: aPrefix

	(aPrefix = '') ifTrue: [^self error: SentenceFinderByPrefix prefixEmptyErrorDescription].
	
	(aPrefix includesSubString: ' ') ifTrue: [^self error: SentenceFinderByPrefix prefixHasAnSpaceErrorDescription].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'VM 5/15/2022 16:05:25'!
fillContentWithElementsFromAnStack

	| anElement |
	
	anElement := stack pop.
	
	content add: anElement.
	
	(stack isEmpty) ifFalse: [self fillContentWithElementsFromAnStack].! !

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'VM 5/15/2022 16:10:33'!
initializeWithStack: anStack
	stack := anStack.
	content := OrderedCollection new.
	
	self verifyThatTheCollection: stack isEmptyThenExecuteABlock: [^self error: SentenceFinderByPrefix stackIsEmptyErrorDescription].
	
	self fillContentWithElementsFromAnStack.
	self refillStackWithElementsFromContent.
	! !

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'VM 5/15/2022 16:06:17'!
refillStackWithElementsFromContent

	content reverseDo: [:element | stack push: element ].! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'VM 5/15/2022 16:10:08'!
find: aSentence

	| listOfCoincidences |

	self verifyThatThePrefixIsValid: aSentence.
	
	listOfCoincidences := content select: [:element | element beginsWith: aSentence].
	
	self verifyThatTheCollection: listOfCoincidences isEmptyThenExecuteABlock: [^self error: SentenceFinderByPrefix sentenceWasNotFoundErrorDescription].
	
	^listOfCoincidences 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TG 5/14/2022 19:52:08'!
prefixEmptyErrorDescription
	^'The prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'VM 5/15/2022 14:34:04'!
prefixHasAnSpaceErrorDescription
	^'The prefix cannot have spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TG 5/14/2022 21:02:19'!
sentenceWasNotFoundErrorDescription
	^'Sentence was not found with that prefix'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TG 5/14/2022 20:30:41'!
stackIsEmptyErrorDescription

	^'Stack is empty cannot be used'.! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'operations' stamp: 'VM 5/13/2022 14:08:05'!
popFromTheStack: anStack
	self subclassResponsibility.! !

!StackState methodsFor: 'operations' stamp: 'VM 5/15/2022 16:03:06'!
pushTheElement: anElement inTheStack: anStack
	self subclassResponsibility. ! !

!StackState methodsFor: 'operations' stamp: 'VM 5/13/2022 14:12:43'!
topFromTheStack: anStack
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'asserting' stamp: 'TG 5/15/2022 09:28:02'!
sizeCheck: aSize isLargerThan: aLimit
	self subclassResponsibility. ! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'operations' stamp: 'TG 5/14/2022 19:54:28'!
popFromTheStack: anStack
	^anStack popWhenEmpty.
	! !

!EmptyState methodsFor: 'operations' stamp: 'TG 5/15/2022 09:36:42'!
pushTheElement: anElement inTheStack: anStack

	anStack pushElement: anElement.! !

!EmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 17:10:07'!
topFromTheStack: anStack
	^anStack topWhenEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'asserting' stamp: 'TG 5/15/2022 09:26:48'!
sizeCheck: aSize isLargerThan: aLimit
	^aSize = 0.! !


!classDefinition: #FullState category: 'Stack-Exercise'!
StackState subclass: #FullState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FullState methodsFor: 'operations' stamp: 'TG 5/15/2022 09:13:17'!
popFromTheStack: anStack
	^anStack popElement.! !

!FullState methodsFor: 'operations' stamp: 'TG 5/15/2022 09:19:34'!
pushTheElement: anElement inTheStack: anStack

	anStack pushWhenFull: anElement.! !

!FullState methodsFor: 'operations' stamp: 'TG 5/15/2022 09:13:26'!
topFromTheStack: anStack
	^anStack topElement. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullState class' category: 'Stack-Exercise'!
FullState class
	instanceVariableNames: ''!

!FullState class methodsFor: 'as yet unclassified' stamp: 'TG 5/15/2022 09:31:17'!
sizeCheck: size isLargerThan: aLimit
	^aLimit <= size.! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
StackState subclass: #NotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 14:09:33'!
popFromTheStack: anStack
	^anStack popElement.! !

!NotEmptyState methodsFor: 'operations' stamp: 'TG 5/15/2022 09:36:49'!
pushTheElement: anElement inTheStack: anStack

	anStack pushElement: anElement.! !

!NotEmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 16:05:00'!
topFromTheStack: anStack
	^anStack topElement. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'asserting' stamp: 'TG 5/15/2022 09:33:20'!
sizeCheck: aSize isLargerThan: aLimit
	^(aSize > 0) and: (aLimit > aSize).! !
