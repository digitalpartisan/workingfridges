Scriptname WorkingFridges:ThirdPartyOption extends RecipeContainer:CrossPluginIntegrator Conditional

Chronicle:Package Property MyPackage Auto Const Mandatory

Chronicle:Package Function getPackage()
	return MyPackage
EndFunction

RecipeContainer:Logic:Local Function getContainerType()
	return WorkingFridges:Dependencies.getInstance().getContainerType()
EndFunction

Function retrofit()
	if ("" != GetState())
		return
	endif
	
	Bool bStart = hasRun()
	goToWaiting()
	
	if (bStart)
		Start()
	endif
EndFunction
