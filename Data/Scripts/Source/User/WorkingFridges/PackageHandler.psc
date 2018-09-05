Scriptname WorkingFridges:PackageHandler extends Chronicle:Package:Handler Conditional

Form[] Function getThirdPartyOptions()
	WorkingFridges:PackageData packageData = getPackage().getCustomData() as WorkingFridges:PackageData
	if (!packageData)
		return None
	endif
	
	WorkingFridges:ThirdPartyOption:PackageBehavior thirdPartyOptions = packageData.getThirdPartyOptions()
	if (!thirdPartyOptions)
		return None
	endif
	
	return thirdPartyOptions.ThirdPartyOptions as Form[]
EndFunction
