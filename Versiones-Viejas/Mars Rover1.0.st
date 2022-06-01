!classDefinition: #MarsRoverTests category: 'Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 18:28:02'!
test01MarsRoverCreatesWithCorrectLocationAndOrientation
	| marsRover |
	
	marsRover := MarsRover new. 
	
	self assert: (marsRover position = (0@0)).
	self assert: (marsRover orientation class = North)! !

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 18:33:14'!
test02SingleCommandMovesMarsRover
	| marsRover |
	
	marsRover := MarsRover new. 
	marsRover executeLineOfCommands: 'f'.
	
	self assert: (marsRover position = (0@1))! !

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 18:33:33'!
test03SingleCommandRotatesMarsRover
	| marsRover |
	
	marsRover := MarsRover new. 
	marsRover executeLineOfCommands: 'r'.
	
	self assert: (marsRover orientation class = East)! !

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 18:40:29'!
test04LineOfCommandsMovesAndRotatesMarsRover
	| marsRover |
	
	marsRover := MarsRover new. 
	marsRover executeLineOfCommands: 'rrbbfl'.
	
	self assert: (marsRover orientation class = East).
	self assert: (marsRover position = (0@1)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 18:43:39'!
test05MultipleLinesOfCommandsMovesAndRotatesMarsRover
	| marsRover |
	
	marsRover := MarsRover new. 
	marsRover executeLineOfCommands: 'rr'.
	marsRover executeLineOfCommands: 'bb'.
	marsRover executeLineOfCommands: 'lf'.
	marsRover executeLineOfCommands: 'fl'.
	
	self assert: (marsRover orientation class = North).
	self assert: (marsRover position = (2@2)).! !

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 19:01:58'!
test06InvalidSingleCommandReturnsErrorDescription
	| marsRover |
	
	marsRover := MarsRover new. 
	
	self
		should: [marsRover executeLineOfCommands: 'x']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandErrorDescription]! !

!MarsRoverTests methodsFor: 'test' stamp: 'VM 5/29/2022 18:59:56'!
test07InvalidCommandStopsExecutionOfLineOfCommands
	| marsRover |
	
	marsRover := MarsRover new. 
	
	self
		should: [marsRover executeLineOfCommands: 'ffxr']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: marsRover position = (0@2).
			self assert: marsRover orientation class = North.
			self assert: anError messageText = MarsRover invalidCommandErrorDescription]! !


!classDefinition: #Commands category: 'Mars Rover'!
Object subclass: #Commands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Commands methodsFor: 'actions' stamp: 'VM 5/29/2022 18:11:06'!
executeCommand: aMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Commands class' category: 'Mars Rover'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'as yet unclassified' stamp: 'VM 5/29/2022 18:17:55'!
determinateCommand: aCommandToBeExecuted forMarsRover: aMarsRover
	self subclasses detect: [:aCommandClass | aCommandClass isCommand: aCommandToBeExecuted] 
	ifFound: [:aCommandClass | ^aCommandClass new] 
	ifNone: [MarsRover error: MarsRover invalidCommandErrorDescription].! !


!classDefinition: #Backwards category: 'Mars Rover'!
Commands subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Backwards methodsFor: 'actions' stamp: 'VM 5/29/2022 19:04:46'!
executeCommand: aMarsRover
	aMarsRover moveBackwards. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'Mars Rover'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'as yet unclassified' stamp: 'VM 5/29/2022 18:15:40'!
isCommand: aCommandToBeExecute
	^aCommandToBeExecute = $b.! !


!classDefinition: #Forward category: 'Mars Rover'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Forward methodsFor: 'actions' stamp: 'VM 5/29/2022 19:05:26'!
executeCommand: aMarsRover
	aMarsRover moveForward. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Mars Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'VM 5/29/2022 18:15:48'!
isCommand: aCommandToBeExecute
	^aCommandToBeExecute = $f.! !


!classDefinition: #Left category: 'Mars Rover'!
Commands subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Left methodsFor: 'actions' stamp: 'VM 5/29/2022 18:11:46'!
executeCommand: aMarsRover
	aMarsRover rotateToTheLeft. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'Mars Rover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'VM 5/29/2022 18:15:54'!
isCommand: aCommandToBeExecute
	^aCommandToBeExecute = $l.! !


!classDefinition: #Right category: 'Mars Rover'!
Commands subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Right methodsFor: 'actions' stamp: 'VM 5/29/2022 18:11:54'!
executeCommand: aMarsRover
	aMarsRover rotateToTheRight. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'Mars Rover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'VM 5/29/2022 18:16:01'!
isCommand: aCommandToBeExecute
	^aCommandToBeExecute = $r.! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:52:42'!
changePositionInX: aQuantityToMoveInX andInY: aQuantityToMoveInY
	currentPosition := currentPosition + (aQuantityToMoveInX@aQuantityToMoveInY).! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/29/2022 17:58:10'!
moveBackwards
	currentOrientation directionToMoveBackwards: self. ! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:43:31'!
moveBackwardsEast
	self moveForwardWest. ! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:43:50'!
moveBackwardsNorth
	self moveForwardSouth. ! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:43:56'!
moveBackwardsSouth
	self moveForwardNorth. ! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:43:43'!
moveBackwardsWest
	self moveForwardEast. ! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/29/2022 17:57:47'!
moveForward
	currentOrientation directionToMoveForward: self.! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:53:16'!
moveForwardEast
	self changePositionInX: 1 andInY: 0.! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:53:27'!
moveForwardNorth
	self changePositionInX: 0 andInY: 1.! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:53:36'!
moveForwardSouth
	self changePositionInX: 0 andInY: -1.! !

!MarsRover methodsFor: 'movement' stamp: 'VM 5/28/2022 18:53:43'!
moveForwardWest
	self changePositionInX: -1 andInY: 0.! !


!MarsRover methodsFor: 'rotations' stamp: 'VM 5/28/2022 18:22:35'!
rotateToTheLeft
	currentOrientation := currentOrientation left.! !

!MarsRover methodsFor: 'rotations' stamp: 'VM 5/28/2022 18:22:45'!
rotateToTheRight
	currentOrientation := currentOrientation right.! !


!MarsRover methodsFor: 'accesing' stamp: 'VM 5/28/2022 18:11:14'!
orientation
	^currentOrientation ! !

!MarsRover methodsFor: 'accesing' stamp: 'VM 5/28/2022 17:52:21'!
position
	^currentPosition ! !


!MarsRover methodsFor: 'initialize' stamp: 'VM 5/28/2022 18:09:00'!
initialize
	currentPosition := 0@0.
	currentOrientation := North new.! !


!MarsRover methodsFor: 'actions' stamp: 'VM 5/29/2022 19:03:28'!
executeLineOfCommands: aString 
	aString do: [:aCharacter | self executeSingleCommand: aCharacter].! !

!MarsRover methodsFor: 'actions' stamp: 'VM 5/29/2022 18:14:29'!
executeSingleCommand: aCharacter 
	| aCommand |
	
	aCommand := Commands determinateCommand: aCharacter forMarsRover: self.
	
	aCommand executeCommand: self. 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'VM 5/29/2022 18:16:34'!
invalidCommandErrorDescription
	^'Invalid Command'! !


!classDefinition: #Orientations category: 'Mars Rover'!
Object subclass: #Orientations
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Orientations methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:58:22'!
directionToMoveBackwards: aMarsRoverToBeMoved
	self subclassResponsibility. ! !

!Orientations methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:57:34'!
directionToMoveForward: aMarsRoverToBeMoved
	self subclassResponsibility. ! !

!Orientations methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:38:14'!
left
	self subclassResponsibility. ! !

!Orientations methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:38:18'!
right
	self subclassResponsibility. ! !


!classDefinition: #East category: 'Mars Rover'!
Orientations subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!East methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:58:22'!
directionToMoveBackwards: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveBackwardsEast. ! !

!East methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:57:34'!
directionToMoveForward: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveForwardEast. ! !

!East methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:26:08'!
left
	^North new.! !

!East methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:25:31'!
right
	^South new.! !


!classDefinition: #North category: 'Mars Rover'!
Orientations subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!North methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:58:22'!
directionToMoveBackwards: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveBackwardsNorth. ! !

!North methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:57:34'!
directionToMoveForward: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveForwardNorth. ! !

!North methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:26:16'!
left
	^West new.! !

!North methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:24:33'!
right
	^East new.! !


!classDefinition: #South category: 'Mars Rover'!
Orientations subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!South methodsFor: 'accessing' stamp: 'VM 5/29/2022 19:05:14'!
directionToMoveBackwards: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveBackwardsSouth. ! !

!South methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:57:34'!
directionToMoveForward: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveForwardSouth. ! !

!South methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:26:30'!
left
	^East new.! !

!South methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:25:40'!
right
	^West new.! !


!classDefinition: #West category: 'Mars Rover'!
Orientations subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!West methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:58:22'!
directionToMoveBackwards: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveBackwardsWest. ! !

!West methodsFor: 'accessing' stamp: 'VM 5/29/2022 17:57:34'!
directionToMoveForward: aMarsRoverToBeMoved
	aMarsRoverToBeMoved moveForwardWest. ! !

!West methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:26:46'!
left
	^South new.! !

!West methodsFor: 'accessing' stamp: 'VM 5/28/2022 18:25:46'!
right
	^North new.! !
