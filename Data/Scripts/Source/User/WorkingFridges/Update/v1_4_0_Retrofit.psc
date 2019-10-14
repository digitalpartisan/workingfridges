Scriptname WorkingFridges:Update:v1_4_0_Retrofit extends Chronicle:Package:Update

Function startFridge()
	WorkingFridges:Dependencies.getInstance().getContainerType().Start()
EndFunction

Function retrofitThirdPartyOptions()
	WorkingFridges:ThirdPartyOption[] integrators = WorkingFridges:Dependencies.getInstance().getIntegratorSearcher().searchOneCrossPluginIntegrator(getPackage()).Integrators as WorkingFridges:ThirdPartyOption[]
	if (!integrators || !integrators.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < integrators.Length)
		if (integrators[iCounter])
			integrators[iCounter].retrofit()
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function updateLogic()
	startFridge()
	retrofitThirdPartyOptions()
	sendSuccess()
EndFunction
