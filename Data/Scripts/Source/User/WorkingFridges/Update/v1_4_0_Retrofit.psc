Scriptname WorkingFridges:Update:v1_4_0_Retrofit extends Chronicle:Package:Update

Function startFridge()
	WorkingFridges:Dependencies.getInstance().getContainerType().Start()
EndFunction

Function retrofitThirdPartyOptions()
	FormList integrators = WorkingFridges:Dependencies.getInstance().getIntegratorSearcher().searchOneIntegrator(getPackage()).getIntegrators()
	if (!integrators || !integrators.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = integrators.GetSize()
	WorkingFridges:ThirdPartyOption currentOption = None
	while (iCounter < iSize)
		currentOption = integrators.GetAt(iCounter) as WorkingFridges:ThirdPartyOption
		currentOption && currentOption.retrofit()
		iCounter += 1
	endWhile
EndFunction

Function updateLogic()
	startFridge()
	retrofitThirdPartyOptions()
	sendSuccess()
EndFunction
