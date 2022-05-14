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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content'
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

!OOStack methodsFor: 'operations' stamp: 'VM 5/13/2022 17:09:17'!
push: anElement
	content add: anElement.
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


!OOStack methodsFor: 'creating' stamp: 'VM 5/13/2022 17:26:25'!
state
	StackState subclasses 
	detect: [:subclass | subclass sizeCheck: self size] 
	ifFound: [:subclass | ^subclass new] 
	ifNone: [].
	! !


!OOStack methodsFor: 'initialization' stamp: 'VM 5/13/2022 17:09:04'!
initialize 
	content := OrderedCollection new.! !


!OOStack methodsFor: 'asserting' stamp: 'VM 5/13/2022 17:31:11'!
isEmpty
	^self size = 0.! !


!OOStack methodsFor: 'error handling' stamp: 'VM 5/13/2022 17:20:21'!
popWhenEmpty
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'error handling' stamp: 'VM 5/13/2022 17:20:53'!
topWhenEmpty
	^self error: self class stackEmptyErrorDescription. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'VM 5/11/2022 09:18:13'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'operations' stamp: 'VM 5/13/2022 14:08:05'!
popFromTheStack: anStack
	self subclassResponsibility.! !

!StackState methodsFor: 'operations' stamp: 'VM 5/13/2022 14:12:43'!
topFromTheStack: anStack
	self subclassResponsibility.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'asserting' stamp: 'VM 5/13/2022 17:23:11'!
sizeCheck: aSize
	self subclassResponsibility. ! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 17:07:17'!
popFromTheStack: anStack
	^anStack popWhenEmpty.! !

!EmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 17:10:07'!
topFromTheStack: anStack
	^anStack topWhenEmpty.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'asserting' stamp: 'VM 5/13/2022 17:26:49'!
sizeCheck: aSize
	^aSize = 0.! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
StackState subclass: #NotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 14:09:33'!
popFromTheStack: anStack
	^anStack popElement.! !

!NotEmptyState methodsFor: 'operations' stamp: 'VM 5/13/2022 16:05:00'!
topFromTheStack: anStack
	^anStack topElement. ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'asserting' stamp: 'VM 5/13/2022 17:26:55'!
sizeCheck: aSize
	^aSize > 0.! !
