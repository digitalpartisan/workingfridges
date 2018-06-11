Scriptname WorkingFridges:PackageCustomizations extends Chronicle:Package:CustomBehavior

InjectTec:Injector[] Property Injections = None Auto Const
WorkingFridges:ThirdPartyOption[] Property ThirdPartyOptions = None Auto Const

Function handleInjections(Bool bInject = true)
	if (!Injections)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < Injections.Length)
		if (bInject)
			Injections[iCounter].inject()
		else
			Injections[iCounter].revert()
		endif
		iCounter += 1
	endWhile
EndFunction

Function handleThirdPartyOptions(Bool bCheck = true)
	Int iCounter = 0
	while (iCounter < ThirdPartyOptions.Length)
		if (bCheck)
			ThirdPartyOptions[iCounter].stateCheck()
		else
			ThirdPartyOptions[iCounter].teardown()
		endif
		
		iCounter += 1
	endWhile
EndFunction

Bool Function installBehavior()
	handleInjections()
	handleThirdPartyOptions()
	return parent.installBehavior()
EndFunction

Bool Function postloadBehavior()
	handleInjections()
	handleThirdPartyOptions()
	return parent.postloadBehavior()
EndFunction

Bool Function uninstallBehavior()
	handleInjections(false)
	handleThirdPartyOptions(false)
	return parent.uninstallBehavior()
EndFunction
