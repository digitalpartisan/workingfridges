Scriptname WorkingFridges:Update:v1_4_0_Retrofit extends Chronicle:Package:Update

Function startFridge()
	WorkingFridges:Dependencies.getInstance().getContainerType().Start()
EndFunction

Function retrofitThirdPartyOptions()
	WorkingFridges:ThirdPartyOption[] integrators = WorkingFridges:Dependencies.getInstance().getIntegratorSearcher().searchOneIntegrator(getPackage()).getIntegrators() as WorkingFridges:ThirdPartyOption[]
	if (!integrators || !integrators.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < integrators.Length)
		integrators[iCounter] && integrators[iCounter].retrofit()
		iCounter += 1
	endWhile
EndFunction

Function updateLogic()
	startFridge()
	retrofitThirdPartyOptions()
	sendSuccess()
EndFunction
