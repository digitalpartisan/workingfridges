Scriptname WorkingFridges:PackageHandler extends Chronicle:Package:Handler Conditional

WorkingFridges:ThirdPartyOption:PackageBehavior Function getThirdPartyOptionCustomization()
	Chronicle:Package:CustomBehavior[] customizations = getPackage().Customizations
	Int iCounter = 0
	WorkingFridges:ThirdPartyOption:PackageBehavior currentBehavior = None
	while (iCounter < customizations.Length)
		currentBehavior = customizations[iCounter] as WorkingFridges:ThirdPartyOption:PackageBehavior
		if (currentBehavior)
			return currentBehavior
		endif
		
		iCounter += 1
	endWhile
	
	return None
EndFunction

Form[] Function getThirdPartyOptions()
	WorkingFridges:ThirdPartyOption:PackageBehavior thirdPartyOptions = getThirdPartyOptionCustomization()
	if (!thirdPartyOptions)
		return None
	endif
	
	return thirdPartyOptions.ThirdPartyOptions as Form[]
EndFunction
