Scriptname WorkingFridges:ThirdPartyOption:SodaHeaven extends WorkingFridges:ThirdPartyOption

Import DialogueDrinkingBuddyScript

InjectTec:Plugin Property WorkingFridges_DLCPatch_FarHarbor Auto Const Mandatory
RemoteRecipeDefinition[] Property FarHarborDefinitions = None Auto Const

Bool Function customCouldBuildLogic()
	return parent.customCouldBuildLogic() && WorkingFridges_DLCPatch_FarHarbor.isInstalled()
EndFunction
