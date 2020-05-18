Scriptname WorkingFridges:Update:v1_4_0_Retrofit extends Chronicle:Package:Update

Group DiamondCityRetrofit
	ObjectReference Property DiamondCityFridge Auto Const Mandatory
	ObjectReference Property DuggoutInnFridge Auto Const Mandatory
	ObjectReference[] Property DisabledFridgeParts Auto Const Mandatory
EndGroup

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

Function fixDiamondCityReferences()
	DiamondCityFridge.RemoveAllItems(DuggoutInnFridge)
	DiamondCityFridge.Disable()
	DiamondCityFridge.Delete()
	
	Int iCounter = 0
	while (iCounter < DisabledFridgeParts.Length)
		DisabledFridgeParts[iCounter].Enable()
		iCounter += 1
	endWhile
EndFunction

Function updateLogic()
	startFridge()
	retrofitThirdPartyOptions()
	sendSuccess()
EndFunction
