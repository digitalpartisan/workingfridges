Scriptname WorkingFridges:Dependencies extends Quest Const

RecipeContainer:CrossPluginIntegrator:PackageBehavior:Search Property WorkingFridges_ThirdPartyOption_Searcher Auto Const Mandatory
RecipeContainer:Logic:Local Property WorkingFridges_FridgeType Auto Const Mandatory

WorkingFridges:Dependencies Function getInstance() Global
	return Game.GetFormFromFile(0x0000CC5F, "WorkingFridges.esp") as WorkingFridges:Dependencies
EndFunction

RecipeContainer:CrossPluginIntegrator:PackageBehavior:Search Function getIntegratorSearcher()
	return WorkingFridges_ThirdPartyOption_Searcher
EndFunction

RecipeContainer:Logic:Local Function getContainerType()
	return WorkingFridges_FridgeType
EndFunction
