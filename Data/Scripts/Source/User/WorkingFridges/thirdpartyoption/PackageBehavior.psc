Scriptname WorkingFridges:ThirdPartyOption:PackageBehavior extends Chronicle:Package:CustomBehavior

WorkingFridges:ThirdPartyOption[] Property ThirdPartyOptions = None Auto Const

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
	handleThirdPartyOptions()
	return true
EndFunction

Bool Function postloadBehavior()
	handleThirdPartyOptions()
	return true
EndFunction

Bool Function uninstallBehavior()
	handleThirdPartyOptions(false)
	return true
EndFunction
