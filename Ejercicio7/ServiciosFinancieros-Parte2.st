!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #ReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:22:28'!
test09AccountWithNoTransactionsReportsCorrectly
	| account reports |
	
	account := ReceptiveAccount new.
	reports := TransferNet new showReport: account.
	
	self assert: reports equals: 0.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:28:17'!
test10AccountWithDepositOrWithdrawDoesNotReport
	| account reports |
	
	account := ReceptiveAccount new.
	Deposit register: 10*peso on: account. 
	Withdraw register: 20*peso on: account. 
	reports := TransferNet new showReport: account.
	
	self assert: reports equals: 0.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:23:43'!
test11AccountWithTransferWithdrawReportsCorrectly
	| account account2 reports |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 10*peso from: account to: account2. 
	reports := TransferNet new showReport: account.
	
	self assert: reports equals: -10 * peso.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:24:01'!
test12AccountWithTransferDepositReportsCorrectly
	| account account2 reports |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 10*peso from: account2 to: account. 
	reports := TransferNet new showReport: account.
	
	self assert: reports equals: 10 * peso.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:24:21'!
test13AccountWithMultipleTransferReportsCorrectly
	| account account2 reports |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 10*peso from: account to: account2. 
	Transfer amount: 30*peso from: account2 to: account. 
	reports := TransferNet new showReport: account.
	
	self assert: reports equals: 20 * peso.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:27:32'!
test14AccountWithMultipleTransactionsButOnlyTransferencesReport
	| account account2 reports |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 10*peso on: account. 
	Transfer amount: 10*peso from: account to: account2. 
	Withdraw register: 20*peso on: account.
	Transfer amount: 30*peso from: account2 to: account. 
	reports := TransferNet new showReport: account.
	
	self assert: reports equals: 20 * peso.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:29:33'!
test15PortfolioWithNoTransactionsReportsCorrectly
	| reports portfolio |

	portfolio := Portfolio new.
	
	reports := TransferNet new showReport: portfolio.
	
	self assert: reports equals: 0 * peso.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:28:59'!
test16PortfolioWithMultipleTransactionsButOnlyTransferencesReport
	| account account2 reports portfolio|
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio := Portfolio new.
	Deposit register: 10*peso on: account. 
	Transfer amount: 10*peso from: account to: account2. 
	Withdraw register: 20*peso on: account.
	Transfer amount: 30*peso from: account2 to: account. 
	
	portfolio add: account.
	reports := TransferNet new showReport: portfolio.
	
	self assert: reports equals: 20 * peso.
	! !

!ReportsTest methodsFor: 'testTransferNet' stamp: 'VM 6/16/2022 08:30:23'!
test17PortfolioWithMultipleAccountsOnlyTransferencesReports
	| account account2 reports portfolio mainPortfolio|
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio := Portfolio new.
	mainPortfolio := Portfolio new.
	Deposit register: 10*peso on: account. 
	Withdraw register: 20*peso on: account.
	Transfer amount: 10*peso from: account to: account2. 
	Transfer amount: 30*peso from: account2 to: account. 
	
	portfolio add: account.
	mainPortfolio add: account2.
	mainPortfolio add: portfolio.
	
	reports := TransferNet new showReport: mainPortfolio.
	
	self assert: reports equals: 0 * peso.
	! !


!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:22:15'!
test01AccountWithNoTransactionsReportsCorrectly
	| account reports |
	
	account := ReceptiveAccount new.
	reports := AccountSummary new showReport: account.
	
	self assert:  (OrderedCollection with: 'Balance = 0 * pesos') equals: reports.
	! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:22:06'!
test02AccountWithDepositReportsCorrectly
	| account reports |
	
	account := ReceptiveAccount new.
	Deposit register: 10*peso on: account. 
	reports := AccountSummary new showReport: account.
	
	self assert: (OrderedCollection with: 'Deposito por 10 * pesos' with: 'Balance = 10 * pesos') equals: reports.! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:21:54'!
test03AccountWithWithdrawReportsCorrectly
	| account reports |
	
	account := ReceptiveAccount new.
	Withdraw register: 10*peso on: account. 
	reports := AccountSummary new showReport: account.
	
	self assert: (OrderedCollection with: 'Extraccion por 10 * pesos' with: 'Balance = -10 * pesos') equals: reports.! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:21:41'!
test04AccountWithTransferWithdrawReportsCorrectly
	| account reports accountToDeposit|
	
	account := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	Transfer amount: 20*peso from: account to: accountToDeposit. 
	reports := AccountSummary new showReport: account.
	
	self assert: (OrderedCollection with: 'Salida por transferencia por 20 * pesos' with: 'Balance = -20 * pesos') equals: reports.! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:21:30'!
test05AccountWithTransferDepositReportsCorrectly
	| account reports accountToWithdraw|
	
	account := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Transfer amount: 20*peso from: accountToWithdraw to: account. 
	reports := AccountSummary new showReport: account.
	
	self assert: (OrderedCollection with: 'Entrada por transferencia por 20 * pesos' with: 'Balance = 20 * pesos') equals: reports.! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:21:21'!
test06AccountWithMultipleTransactionsReportsCorrectly
	| account accountToDeposit reports |
	
	account := ReceptiveAccount new.
	accountToDeposit := ReceptiveAccount new.
	Deposit register: 10*peso on: account. 
	Withdraw register: 5*peso on: account. 
	Deposit register: 20*peso on: account.
	Transfer amount: 2 * peso from: account to: accountToDeposit.
	
	reports := AccountSummary new showReport: account.
	
	self assert: (OrderedCollection with: 'Deposito por 10 * pesos' with: 'Extraccion por 5 * pesos' with: 'Deposito por 20 * pesos' with: 'Salida por transferencia por 2 * pesos' with: 'Balance = 23 * pesos') equals: reports.! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:21:06'!
test07PortfolioWithOneAccountWithMultipleTransactionsReportsCorrectly
	| account portfolio reports |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	Deposit register: 10*peso on: account. 
	Withdraw register: 5*peso on: account. 
	
	portfolio add: account.
	
	reports := AccountSummary new showReport: portfolio.
	
	self assert: (OrderedCollection with: 'Deposito por 10 * pesos' with: 'Extraccion por 5 * pesos' with: 'Balance = 5 * pesos') equals: reports.! !

!ReportsTest methodsFor: 'testSummary' stamp: 'VM 6/16/2022 09:20:54'!
test08PortfolioWithMoreAccountsReportsCorrectly
	| account account2 portfolio reports |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio := Portfolio new.
	Deposit register: 10*peso on: account. 
	Withdraw register: 5*peso on: account2. 
	
	portfolio add: account.
	portfolio add: account2.
	
	reports := AccountSummary new showReport: portfolio.
	
	self assert: (OrderedCollection with: 'Deposito por 10 * pesos' with: 'Extraccion por 5 * pesos' with: 'Balance = 5 * pesos') equals: reports.! !


!ReportsTest methodsFor: 'testTreePrinter' stamp: 'VM 6/16/2022 08:32:08'!
test18PortfolioWithZeroAccountsReportsCorrectly
	| aPortfolio reports|
	
	aPortfolio := Portfolio named: 'Familia'.
	reports := PortfolioTreePrinter new showReport: aPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Familia') equals: reports.
	
	! !

!ReportsTest methodsFor: 'testTreePrinter' stamp: 'VM 6/16/2022 08:32:36'!
test19PortfolioWithOneAccountReportsCorrectly
	| aPortfolio reports anAccount|
	
	anAccount := ReceptiveAccount named: 'Carlita'. 
	aPortfolio := Portfolio named: 'Familia'.
	aPortfolio add: anAccount. 
	reports := PortfolioTreePrinter new showReport: aPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Familia' with: 'Cuenta de Carlita') equals: reports.
	
	! !

!ReportsTest methodsFor: 'testTreePrinter' stamp: 'VM 6/16/2022 08:51:35'!
test20PortfolioWithPortfolioReportsCorrectly
	| aMainPortfolio reports aPortfolio|
	
	aPortfolio := Portfolio named: 'Hijo'. 
	aMainPortfolio := Portfolio named: 'Familia'.
	aMainPortfolio add: aPortfolio. 
	reports := PortfolioTreePrinter new showReport: aMainPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Familia' with: 'Portafolio de Hijo') equals: reports.
	
	! !

!ReportsTest methodsFor: 'testTreePrinter' stamp: 'VM 6/16/2022 09:06:26'!
test21PortfolioWithPortfolioAndAccountsReportsCorrectly
	| aMainPortfolio portfolio reports anAccount accountInPortfolio|
	
	anAccount := ReceptiveAccount named: 'Carlita'. 
	accountInPortfolio := ReceptiveAccount named: 'Juansito'.
	portfolio := Portfolio named: 'Hijo'.
	aMainPortfolio := Portfolio named: 'Familia'.
	portfolio add: accountInPortfolio.
	aMainPortfolio add: anAccount. 
	aMainPortfolio add: portfolio. 
	reports := PortfolioTreePrinter new showReport: aMainPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Familia' with: 'Cuenta de Carlita' with: 'Portafolio de Hijo' with: 'Cuenta de Juansito') equals: reports.
	
	! !


!ReportsTest methodsFor: 'testDetailedTreePrinter' stamp: 'VM 6/16/2022 08:34:46'!
test22PortfolioWithZeroAccountsReportsCorrectly
	| aPortfolio reports|
	
	aPortfolio := Portfolio named: 'Familia'.
	reports := PortfolioDetailedTreePrinter new showReport: aPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Familia') equals: reports.
	! !

!ReportsTest methodsFor: 'testDetailedTreePrinter' stamp: 'VM 6/16/2022 09:17:11'!
test23PortfolioWithAccountReportsCorrectly
	| aPortfolio reports anAccount|
	
	anAccount := ReceptiveAccount named: 'Dua Lipa'.
	Deposit register: 20*peso on: anAccount.
	
	aPortfolio := Portfolio named: 'Familia'.
	aPortfolio add: anAccount. 
	reports := PortfolioDetailedTreePrinter new showReport: aPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Familia' with: 'Cuenta de Dua Lipa' with: 'Deposito por 20 * pesos' with: 'Balance = 20 * pesos') equals: reports.
	! !

!ReportsTest methodsFor: 'testDetailedTreePrinter' stamp: 'VM 6/16/2022 09:20:22'!
test24PortfolioWithPortfolioAndAccountReportsCorrectly
	| aMainPortfolio reports aPortfolio anAccount|
	
	anAccount := ReceptiveAccount named: 'Dua Lipa'.
	aPortfolio := Portfolio named: 'Famosas'.
	
	Deposit register: 20*peso on: anAccount.
	Withdraw register: 10*peso on: anAccount. 
	
	aPortfolio add: anAccount. 
	aMainPortfolio := Portfolio named: 'Lollapalooza'.
	aMainPortfolio add: aPortfolio. 
	reports := PortfolioDetailedTreePrinter new showReport: aMainPortfolio.
	
	self assert: (OrderedCollection with: 'Portafolio de Lollapalooza' with: 'Portafolio de Famosas' with: 'Cuenta de Dua Lipa' with:  'Deposito por 20 * pesos' with: 'Extraccion por 10 * pesos' with: 'Balance = 10 * pesos') equals: reports.
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'VM 6/14/2022 18:37:31'!
name
	^name.! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'execution' stamp: 'VM 6/16/2022 10:08:51'!
executeReport: aReport IntoCollection: aCollection 
	self subclassResponsibility.
	
! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'VM 6/14/2022 18:07:46'!
initialize

	self initializeWithName: 'unnamed'.
	! !

!Portfolio methodsFor: 'initialization' stamp: 'VM 6/14/2022 18:07:44'!
initializeWithName: aName

	name := aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'vm 6/13/2022 19:52:07'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'execution' stamp: 'VM 6/16/2022 09:18:41'!
executeReport: aReport IntoCollection: aCollection 
	
	aReport messageForPortfolio: self IntoCollection: aCollection.
	
	accounts do: [:anAccount | (anAccount executeReport: aReport IntoCollection: aCollection)].
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'VM 6/14/2022 18:12:51'!
named: aName
	^self new initializeWithName: aName.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'VM 6/14/2022 18:03:28'!
initialize
	self initializeWithName: 'unnamed'.
	
	! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'VM 6/14/2022 18:07:37'!
initializeWithName: aName
	
	name := aName.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'vm 6/13/2022 19:51:49'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'execution' stamp: 'VM 6/16/2022 09:13:34'!
executeReport: aReport IntoCollection: aCollection 
	aReport messageForAccount: self IntoCollection: aCollection! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'VM 6/14/2022 18:21:17'!
named: aName 
	^self new initializeWithName: aName! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'execution' stamp: 'VM 6/16/2022 08:16:46'!
executeReport: aReport
	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'execution' stamp: 'VM 6/14/2022 17:37:51'!
executeReport: aReport
	^aReport executeForDeposit: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'VM 6/13/2022 13:54:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'execution' stamp: 'VM 6/16/2022 10:09:54'!
executeReport: aReport
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'VM 6/13/2022 13:54:14'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'execution' stamp: 'VM 6/14/2022 17:41:35'!
executeReport: aReport
	^aReport executeForTransferDeposit: self. ! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'execution' stamp: 'VM 6/14/2022 17:41:52'!
executeReport: aReport
	^aReport executeForTransferWithdraw: self. ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'execution' stamp: 'VM 6/14/2022 17:42:02'!
executeReport: aReport
	^aReport executeForWithdraw: self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Reports category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Reports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Reports methodsFor: 'main protocol' stamp: 'vm 6/13/2022 20:42:30'!
showReport: anAccount
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'main protocol' stamp: 'VM 6/14/2022 17:46:55'!
showReport: anAccount
	| collection |
	collection := OrderedCollection new.
	anAccount transactions collect: [ :aTransaction | collection add: (aTransaction executeReport: self)].
	collection add: ('Balance = ', anAccount balance asString).
	^collection.
	 ! !


!AccountSummary methodsFor: 'executions' stamp: 'VM 6/14/2022 17:40:24'!
executeForDeposit: aDeposit
	^('Deposito por ', aDeposit value asString).! !

!AccountSummary methodsFor: 'executions' stamp: 'VM 6/14/2022 17:43:28'!
executeForTransferDeposit: aTransferDeposit
	^('Entrada por transferencia por ', aTransferDeposit value asString)! !

!AccountSummary methodsFor: 'executions' stamp: 'VM 6/14/2022 17:43:39'!
executeForTransferWithdraw: aTransferDeposit
	^('Salida por transferencia por ', aTransferDeposit value asString)! !

!AccountSummary methodsFor: 'executions' stamp: 'VM 6/14/2022 17:43:52'!
executeForWithdraw: aTransferDeposit
	^('Extraccion por ', aTransferDeposit value asString)! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'VM 6/16/2022 09:15:51'!
messageForAccount: anAccount IntoCollection: aCollection
	
	aCollection add: ('Cuenta de ', anAccount name).
	
	(AccountSummary new showReport: anAccount) do: [:each | aCollection add: each].
! !

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'VM 6/16/2022 10:11:57'!
messageForPortfolio: aPortfolio IntoCollection: aCollection.

	aCollection add: ('Portafolio de ', aPortfolio name).! !

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'VM 6/16/2022 09:08:56'!
showReport: aPortfolio 
	| aCollection |
	
	aCollection := OrderedCollection new.
	
	aPortfolio executeReport: self IntoCollection: aCollection.
	
	^aCollection. ! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'VM 6/16/2022 09:19:41'!
messageForAccount: anAccount IntoCollection: aCollection
	aCollection add: ('Cuenta de ', anAccount name).! !

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'VM 6/16/2022 09:19:26'!
messageForPortfolio: aPortfolio IntoCollection: aCollection.
	aCollection add: ('Portafolio de ', aPortfolio name).! !

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'VM 6/16/2022 08:54:40'!
showReport: aPortfolio
	| aCollection |
	
	aCollection := OrderedCollection new.
	
	aPortfolio executeReport: self IntoCollection: aCollection. 
	
	^aCollection. 
	! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'main protocol' stamp: 'VM 6/14/2022 17:49:03'!
showReport: anAccount
	
	^anAccount transactions inject: 0 into: [ :iterator :aTransaction | iterator + (aTransaction executeReport: self)].
	
! !


!TransferNet methodsFor: 'execution' stamp: 'VM 6/14/2022 17:40:33'!
executeForDeposit: aDeposit
	^0.! !

!TransferNet methodsFor: 'execution' stamp: 'VM 6/14/2022 17:44:38'!
executeForTransferDeposit: aDeposit
	^aDeposit value.! !

!TransferNet methodsFor: 'execution' stamp: 'VM 6/14/2022 17:44:47'!
executeForTransferWithdraw: aDeposit
	^aDeposit value negated.! !

!TransferNet methodsFor: 'execution' stamp: 'VM 6/14/2022 17:44:21'!
executeForWithdraw: aDeposit
	^0.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
