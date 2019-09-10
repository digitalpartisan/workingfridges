Scriptname WorkingFridges:ThirdPartyOption extends RecipeContainer:CrossPluginIntegrator Conditional

Chronicle:Package Property MyPackage Auto Const Mandatory

Chronicle:Package Function getPackage()
	return MyPackage
EndFunction

RecipeContainer:Logic:Local Function getContainerType()
	Chronicle:Package:CustomData customData = getPackage().getEngine().getCorePackage().getCustomData()
	if (!customData)
		WorkingFridges:Logger.logNoCorePackageData(self)
		return None
	endif
	
	WorkingFridges:PackageData:Core coreData = customData as WorkingFridges:PackageData:Core
	if (!customData)
		WorkingFridges:Logger.logCorePackageDataWrongType(self)
		return None
	endif
	
	RecipeContainer:Logic:Local result = coreData.getFridgeType()
	WorkingFridges:Logger.logCorePackageFridgeType(self, result)
	return result
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
