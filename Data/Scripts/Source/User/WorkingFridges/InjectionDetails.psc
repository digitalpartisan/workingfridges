Scriptname WorkingFridges:InjectionDetails extends Quest Conditional

InjectTec:Injector myInjector = None

Bool bCanLoadSource = false Conditional
Bool bCanLoadTarget = false Conditional
Bool bHasRun = false Conditional

Function resetState()
	bCanLoadSource = false
	bCanLoadTarget = false
	bHasRun = false
EndFunction

Function examineState()
	InjectTec:Injector injector = getInjector()
	bCanLoadSource = injector.canLoadSource()
	bCanLoadTarget = injector.canLoadTarget()
	bHasRun = injector.getHasRun()
EndFunction

InjectTec:Injector Function getInjector()
	return myInjector
EndFunction

Function setInjector(InjectTec:Injector newInjector)
	myInjector = newInjector
	examineState()
EndFunction

Function run()
	getInjector().inject()
EndFunction

Function forceRun()
	getInjector().forceInject()
EndFunction
