Scriptname WorkingFridges:Update:v1_4_0_Retrofit extends Chronicle:Package:Update

Function retrofitThirdPartyOption(WorkingFridges:ThirdPartyOption option)
	if (option && option.getHasRun() && option.couldBuild()) ; if the option's conditional variable state indicates it has been setup, but the new logic says it has not, then force start the option to make it compliant with new logic
		option.Start()
	endif
EndFunction

Function retrofitThirdPartyOptions()
	WorkingFridges:PackageData packageData = getPackage().getCustomData() as WorkingFridges:PackageData
	if (!packageData)
		return
	endif
	
	WorkingFridges:ThirdpartyOption[] options = packageData.getThirdPartyOptions()
	
	Int iCounter = 0
	while (iCounter < options.Length)
		retrofitThirdPartyOption(options[iCounter])
		iCounter += 1
	endWhile
EndFunction

Function updateLogic()
	retrofitThirdPartyOptions()
	sendSuccess()
EndFunction
