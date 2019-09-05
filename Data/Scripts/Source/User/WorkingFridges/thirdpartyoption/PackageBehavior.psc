Scriptname WorkingFridges:ThirdPartyOption:PackageBehavior extends Chronicle:Package:CustomBehavior

WorkingFridges:ThirdPartyOption[] Property ThirdPartyOptions = None Auto Const

Function handle(Bool bCheck = true)
	WorkingFridges:ThirdPartyOption.handleBulk(ThirdPartyOptions, bCheck)
EndFunction

Bool Function installBehavior()
	handle()
	return true
EndFunction

Bool Function postloadBehavior()
	handle()
	return true
EndFunction

Bool Function uninstallBehavior()
	handle(false)
	return true
EndFunction
