!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:48:01'!
test01WhenEmptyHasZeroBalance
	| portfolio |
		
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:47:46'!
test02HasCorrectBalanceWithOneAccount
	| portfolio account|
		
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 10*peso on: account. 
	
	portfolio addNewAsset: account.
	
	self assert: portfolio balance equals: 10*peso. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:47:36'!
test03HasCorrectBalanceWithMoreThanOneAccount
	| mainPortfolio portfolio account1 account2 |
		
	mainPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	Deposit register: 10*peso on: account1.
	Deposit register: 10*peso on: account2.  

	portfolio addNewAsset: account1.
	portfolio addNewAsset: account2.
	
	mainPortfolio addNewAsset: portfolio. 
	
	self assert: mainPortfolio balance equals: 20*peso. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:51:47'!
test04TransactionsOfAnAccountOnPortfolioAreRight
	| portfolio accountToWithdraw accountToDeposit money |
		
	portfolio := Portfolio new.
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 100 * peso.
	
	Deposit register: money on: accountToWithdraw.
	accountToWithdraw transferMoney: money to: accountToDeposit. 
	
	portfolio addNewAsset: accountToWithdraw.
	
	self assert: (portfolio transactionsOf: accountToWithdraw) equals: (accountToWithdraw transactions). ! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/9/2022 12:30:05'!
test05TransactionsOfMultipleAccountsOnPortfolioAreRight
	| mainPortfolio portfolio accountToWithdraw accountToDeposit money |
		
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 100 * peso.
	
	Deposit register: money on: accountToWithdraw.
	accountToWithdraw transferMoney: money to: accountToDeposit. 
	
	portfolio addNewAsset: accountToWithdraw. 
	portfolio addNewAsset: accountToDeposit. 
	mainPortfolio addNewAsset: portfolio.
	
	self assert: (mainPortfolio transactionsOf: portfolio) equals: ((accountToWithdraw transactions), (accountToDeposit transactions)). ! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 13:38:31'!
test06CannotAddAccountAlreadyUnderPortfolio
	| portfolio account|
		
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addNewAsset: account.
	
		self
		should: [portfolio addNewAsset: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountIsAlreadyUnderPortfolioErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 13:32:41'!
test07CannotAddAccountAlreadyUnderPortfolioInsideOfMainPortfolio
	| mainPortfolio account portfolio|
		
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	portfolio addNewAsset: account.
	mainPortfolio addNewAsset: portfolio.
	self
		should: [mainPortfolio addNewAsset: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountIsAlreadyUnderPortfolioErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 13:34:26'!
test08CannotAddHimself
	| mainPortfolio account portfolio|
		
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	portfolio addNewAsset: account.
	mainPortfolio addNewAsset: portfolio.
	self
		should: [mainPortfolio addNewAsset: mainPortfolio]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountIsAlreadyUnderPortfolioErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 13:35:35'!
test09CannotAddPortfolioWithAccountAlreadyInMainPortfolio
	| mainPortfolio account portfolio|
		
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	portfolio addNewAsset: account.
	mainPortfolio addNewAsset: account.
	self
		should: [mainPortfolio addNewAsset: portfolio.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountIsAlreadyUnderPortfolioErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 14:35:13'!
test10CannotAddAnAccountInPortfolioUnderMainPortfolioWithSameAccount
	| mainPortfolio account portfolio|
		
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	mainPortfolio addNewAsset: portfolio.
	mainPortfolio addNewAsset: account.
	
	self
		should: [portfolio addNewAsset: account.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountIsAlreadyUnderPortfolioErrorDescription].! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 14:48:51'!
test11HasTransactionThatAccountUnderHas
	| aPortfolio anAccount aDeposit |
		
	aPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	aDeposit := Deposit register: 10*peso on: anAccount. 
	
	aPortfolio addNewAsset: anAccount.
	
	self assert: (aPortfolio hasTransaction: aDeposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'VM 6/8/2022 14:55:01'!
test12CanFindAccountWithTransaction
	| aPortfolio anAccount aDeposit |
		
	aPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	aDeposit := Deposit register: 10*peso on: anAccount. 
	
	aPortfolio addNewAsset: anAccount.
	
	self assert: (aPortfolio accountWithTransaction: aDeposit) equals: anAccount.
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:40:00'!
test01TransferAffectsBalanceOfBothAccounts

	| accountToWithdraw accountToDeposit money |
	
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 100 * peso.
	
	Deposit register: money on: accountToWithdraw.
	accountToWithdraw transferMoney: money to: accountToDeposit. 
		
	self assert: 100 * peso equals: accountToDeposit balance.
	self assert: 0 equals: accountToWithdraw balance.
! !

!TransferenceTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:40:21'!
test02CannotTransferToNilAccount

	| accountToWithdraw accountToDeposit money |
	
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := nil.
	money := 100 * peso.
	
	Deposit register: money on: accountToWithdraw.
	
	self
		should: [accountToWithdraw transferMoney: money to: accountToDeposit.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount cannotTransferToNonExistenAccountErrorDescription].
! !

!TransferenceTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:41:02'!
test03CanTransferWithZeroBalance

	| accountToWithdraw accountToDeposit money |
	
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 100* peso.
		
	accountToWithdraw transferMoney: money to: accountToDeposit.
	
	self assert: money equals: accountToDeposit balance.
	self assert: (money negated) equals: accountToWithdraw balance.

! !

!TransferenceTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:41:39'!
test04CannotTransferZeroPesos

	| accountToWithdraw accountToDeposit money |
	
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 0 * peso.
	self
		should: [accountToWithdraw transferMoney: money to: accountToDeposit.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount cannotTransferZeroPesosErroDescription].
	
! !

!TransferenceTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:42:53'!
test05DepositTransferPartIsIndeedTheDepositAccount

	| accountToWithdraw accountToDeposit money transference |
	
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 100 * peso.
	
	transference := accountToWithdraw transferMoney: money to: accountToDeposit. 
		
	self assert: ((transference depositLeg) depositAccount) equals: accountToDeposit.
	self assert: ((transference withdrawLeg) withdrawAccount) equals: accountToWithdraw.! !

!TransferenceTest methodsFor: 'tests' stamp: 'VM 6/7/2022 17:43:49'!
test06TransferCounterpartsKnowEachother

	| accountToWithdraw accountToDeposit money transference |
	
	accountToWithdraw := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	money := 100 * peso.
	
	transference := accountToWithdraw transferMoney: money to: accountToDeposit. 
		
	self assert: (transference depositLeg) counterpart equals: transference withdrawLeg.
	self assert: (transference withdrawLeg ) counterpart equals: transference depositLeg.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions parentAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'VM 6/8/2022 14:02:40'!
initialize
	self subclassResponsibility.! !


!Account methodsFor: 'accesing' stamp: 'VM 6/8/2022 14:04:52'!
becomesChildOf: aParentAccount
	parentAccount := aParentAccount.! !

!Account methodsFor: 'accesing' stamp: 'VM 6/8/2022 14:23:35'!
parentAccount
	^parentAccount.! !


!Account methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:01:14'!
allAccountsUnder
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'VM 6/8/2022 13:43:37'!
balance
	self subclassResponsibility.
	! !

!Account methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:01:18'!
compareAccountsWith: anAccountToCompare
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'VM 6/8/2022 13:42:43'!
transactions
	self subclassResponsibility. ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'adding' stamp: 'VM 6/8/2022 14:25:22'!
addNewAsset: anAccountToBeAdded 
	
	anAccountToBeAdded compareAccountsWith: parentAccount.
	
	accounts add: anAccountToBeAdded. 
	
	anAccountToBeAdded becomesChildOf: self.! !


!Portfolio methodsFor: 'initialization' stamp: 'VM 6/8/2022 14:25:22'!
initialize
	accounts := OrderedCollection new.
	transactions := OrderedCollection new.
	parentAccount := self.
	 ! !


!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:58:31'!
accountWithTransaction: aTransactionToFind
	| allAccounts |
	
	allAccounts := self allAccountsUnder.
	
	allAccounts detect: [:anAccount | anAccount transactions includes: aTransactionToFind] 
				ifFound: [:anAccount | ^anAccount] 
				ifNone: []. 
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:27:52'!
allAccountsUnder

	| accountsUnderPorfolio |
	
	accountsUnderPorfolio := OrderedCollection new.
	
	accounts do: [ :anAccount | accountsUnderPorfolio addAll: (anAccount allAccountsUnder)].

	
	^accountsUnderPorfolio. ! !

!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:25:22'!
balance 
	^accounts sum: [ :anAsset | anAsset balance] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/9/2022 12:17:26'!
compareAccountsWith: aPortfolioToBeCompare

	| accountsUnderSelf accountsUnderPorfolioToBeCompare |
	
	(aPortfolioToBeCompare parentAccount = aPortfolioToBeCompare) ifFalse: [^self compareAccountsWith: aPortfolioToBeCompare parentAccount].
	
	accountsUnderSelf := self allAccountsUnder.
	accountsUnderPorfolioToBeCompare  := aPortfolioToBeCompare allAccountsUnder.
	
	accountsUnderSelf do:[:anAccount | (accountsUnderPorfolioToBeCompare includes: anAccount) ifTrue:[self error: self class accountIsAlreadyUnderPortfolioErrorDescription ]].
	
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:43:29'!
hasTransaction: aTransaction
	^self transactions includes: aTransaction.! !

!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/9/2022 12:19:37'!
transactions

	| allTransactionsUnderAccount |
	
	allTransactionsUnderAccount := OrderedCollection new.
	
	accounts do: [:anAsset | allTransactionsUnderAccount addAll: anAsset transactions].
	
	^allTransactionsUnderAccount. ! !

!Portfolio methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:25:22'!
transactionsOf: anAsset

	(accounts includes: anAsset) ifTrue: [^anAsset transactions]. 
	
	^self error: self class accountIsNotInPortfolioErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'TG 6/5/2022 12:56:23'!
accountIsAlreadyUnderPortfolioErrorDescription

	^'Account is already under Portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'VM 6/5/2022 11:56:40'!
accountIsNotInPortfolioErrorDescription
	^'Account is not in Portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'asserting' stamp: 'vm 6/6/2022 20:09:09'!
verifyThatICanTransferMoney: moneyToTransfer toAccount: anAccountToDeposit
	moneyToTransfer = (0 * peso) ifTrue:[self error: self class cannotTransferZeroPesosErroDescription].
	anAccountToDeposit = nil ifTrue: [self error: self class cannotTransferToNonExistenAccountErrorDescription].! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'VM 6/8/2022 14:03:02'!
initialize
	transactions := OrderedCollection new.
	parentAccount := self.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'VM 6/8/2022 14:37:00'!
allAccountsUnder
	 ^OrderedCollection with: self! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'VM 6/7/2022 17:29:31'!
balance
	^transactions sum: [ :aTransaction | aTransaction valueToBalance] ifEmpty: [ 0 ].
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'vm 6/6/2022 20:06:24'!
compareAccountsWith: aPortfolio

	(aPortfolio allAccountsUnder includes: self) ifTrue:[ self error: Portfolio accountIsAlreadyUnderPortfolioErrorDescription].
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'vm 6/6/2022 21:18:10'!
depositMoney: moneyToBeDeposited

	Deposit register: moneyToBeDeposited on: self.
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'vm 6/6/2022 19:55:31'!
transactions 

	^transactions copy.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'VM 6/9/2022 12:33:15'!
transferMoney: moneyToTransfer to: anAccountToDeposit 

	| transference |
	
	self verifyThatICanTransferMoney: moneyToTransfer toAccount: anAccountToDeposit.

	transference := Transference new initializeWithaReceptiveAccount: anAccountToDeposit aTransferAcount: self andMoneyToTransfer: moneyToTransfer.
	transference  transferMoney.

	^transference! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'VM 6/5/2022 11:57:06'!
cannotTransferIfAccountHasNoMoneyErrorDescription
	^'Account has no money to transfer'! !

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'VM 6/5/2022 11:57:40'!
cannotTransferToNonExistenAccountErrorDescription
	^'Cannot transfer to non existen account'! !

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'VM 6/5/2022 11:57:30'!
cannotTransferZeroPesosErroDescription
	^'Cannot Transfer Zero Pesos'! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'vm 6/2/2022 21:26:33'!
valueToBalance
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'VM 6/3/2022 13:46:33'!
valueToBalance

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'jms 6/2/2022 21:18:30'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'VM 6/3/2022 13:46:33'!
valueToBalance

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'depositLeg withdrawLeg value mainTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:14:31'!
counterpart
	self subclassResponsibility.! !

!Transference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:09:02'!
depositLeg
	^depositLeg.! !

!Transference methodsFor: 'accessing' stamp: 'vm 6/6/2022 20:45:35'!
value
	^value.! !

!Transference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:09:08'!
withdrawLeg
	^withdrawLeg.! !


!Transference methodsFor: 'initialization' stamp: 'vm 6/6/2022 20:59:39'!
initializeWithaReceptiveAccount: aReceptiveAccount aTransferAcount: aTransferAccount andMoneyToTransfer: anAmountOfMoney
	depositLeg := DepositSideTransference new initializeWithAccount: aReceptiveAccount andMainTransference: self.
	withdrawLeg := WithdrawSideTransference new initializeWithAccount: aTransferAccount andMainTransference: self.
	value := anAmountOfMoney. ! !


!Transference methodsFor: 'main protocol' stamp: 'VM 6/7/2022 17:36:40'!
transferMoney
	
	(withdrawLeg withdrawAccount) register: withdrawLeg.
	(depositLeg depositAccount ) register: depositLeg.! !


!classDefinition: #DepositSideTransference category: 'ServiciosFinancieros-Ejercicio'!
Transference subclass: #DepositSideTransference
	instanceVariableNames: 'depositAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositSideTransference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:15:40'!
counterpart
	^mainTransference withdrawLeg.! !

!DepositSideTransference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:09:19'!
depositAccount
	^depositAccount.! !


!DepositSideTransference methodsFor: 'initialization' stamp: 'vm 6/6/2022 20:43:17'!
initializeWithAccount: anAccount andMainTransference: aTransference 
	depositAccount := anAccount.
	mainTransference  := aTransference.! !


!DepositSideTransference methodsFor: 'value' stamp: 'VM 6/7/2022 17:29:53'!
valueToBalance

	^ mainTransference value.! !


!classDefinition: #WithdrawSideTransference category: 'ServiciosFinancieros-Ejercicio'!
Transference subclass: #WithdrawSideTransference
	instanceVariableNames: 'withdrawAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawSideTransference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:15:57'!
counterpart
	^mainTransference depositLeg.! !

!WithdrawSideTransference methodsFor: 'accessing' stamp: 'vm 6/6/2022 21:09:30'!
withdrawAccount
	^withdrawAccount.! !


!WithdrawSideTransference methodsFor: 'initialization' stamp: 'vm 6/6/2022 20:39:21'!
initializeWithAccount: anAccount andMainTransference: aTransference 
	withdrawAccount := anAccount.
	mainTransference := aTransference ! !


!WithdrawSideTransference methodsFor: 'value' stamp: 'VM 6/7/2022 17:30:14'!
valueToBalance

	^ (mainTransference value) negated.! !
