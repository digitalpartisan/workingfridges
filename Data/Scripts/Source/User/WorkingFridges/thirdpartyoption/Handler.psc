Scriptname WorkingFridges:ThirdPartyOption:Handler extends DynamicTerminal:Basic Conditional

Message Property InvalidOptionMessage Auto Const Mandatory

Bool bIsValid = false Conditional
Bool bHasRun = false Conditional
Bool bNeedsSetup = false Conditional
Bool bNeedsTeardown = false Conditional

WorkingFridges:ThirdPartyOption myOption

WorkingFridges:ThirdPartyOption Function getOption()
	return myOption
EndFunction

Bool Function isValid()
	return bIsValid
EndFunction

Function setOption(WorkingFridges:ThirdPartyOption newOption)
	myOption = newOption
	updateState()
EndFunction

Function updateState()
	bIsValid = false
	bHasRun = false
	bNeedsSetup = false
	bNeedsTeardown = false
	
	WorkingFridges:ThirdPartyOption option = getOption()
	if (!option)
		return
	endif
	
	bIsValid = true
	bHasRun = option.hasRun()
	bNeedsSetup = option.needsSetup()
	bNeedsTeardown = option.needsTeardown()
EndFunction

Function rerun(ObjectReference akTerminalRef)
	myOption.teardown()
	myOption.setup()
	updateState()
	draw(akTerminalRef)
EndFunction

Function teardown(ObjectReference akTerminalRef)
	myOption.teardown()
	updateState()
	draw(akTerminalRef)
EndFunction

Function forceInjections(ObjectReference akTerminalRef)
	myOption.handleInjections(true, true)
	updateState()
	draw(akTerminalRef)
EndFunction

Function tokenReplacementLogic()
	if (isValid())
		replace("SelectedOption", getOption())
	else
		replace("SelectedOption", InvalidOptionMessage) ; The terminal shouldn't show a replacement field in this case, but caution never hurt
	endif
EndFunction
