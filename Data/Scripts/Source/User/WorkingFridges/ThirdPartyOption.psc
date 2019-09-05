Scriptname WorkingFridges:ThirdPartyOption extends RecipeContainer:Recipe:Builder:Definitions Conditional

Import DialogueDrinkingBuddyScript

Chronicle:Package Property MyPackage Auto Const Mandatory
InjectTec:Plugin Property Plugin Auto Const Mandatory
InjectTec:Injector:Bulk Property Injections = None Auto Const

RecipeContainer:Logic:Local Function getFridgeType()
	return (MyPackage.getEngine().getCorePackage().getCustomData() as WorkingFridges:PackageData:Core).getFridgeType()
EndFunction

Bool Function customCouldBuildLogic()
	return Plugin.isInstalled()
EndFunction

Bool Function needsSetup()
	return !hasBuilt() && couldBuild()
EndFunction

Bool Function needsTeardown()
	return getHasRun() && !couldBuild()
EndFunction

Function handleFridgeType(Bool bAdd = true)
	
EndFunction

Function handleInjections(Bool bInject = true, Bool bForce = false)
	if (!Injections)
		return
	endif

	if (bInject)
		Injections.inject(bForce)
	else
		Injections.revert(bForce)
	endif
EndFunction

Function setup()
	if (!needsSetup())
		return
	endif
	
	WorkingFridges:Logger.logThirdPartyOptionSettingUp(self)
	
	Start()
	handleInjections()
EndFunction

Function teardown()
	if (!hasBuilt())
		return
	endif
	
	WorkingFridges:Logger.logThirdPartyOptionTearingDown(self)
	
	handleInjections(false)
	Stop()
EndFunction

Function stateCheck()
	WorkingFridges:Logger.logThirdPartyOptionCheckingState(self)

	if (needsSetup())
		setup()
		return
	endif
	
	if (needsTeardown())
		teardown()
		return
	endif
EndFunction

Function handle(Bool bCheck = true)
	if (bCheck)
		stateCheck()
		return
	endif
	
	teardown()
EndFunction

Function handleBulk(WorkingFridges:ThirdPartyOption[] options, Bool bCheck = true) Global
	if (!options || options.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < options.Length)
		if (options[iCounter])
			options[iCounter].handle(bCheck)
		endif
	endWhile
EndFunction
