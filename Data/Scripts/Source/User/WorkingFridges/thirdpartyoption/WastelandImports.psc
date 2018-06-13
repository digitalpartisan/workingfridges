Scriptname WorkingFridges:ThirdPartyOption:WastelandImports extends WorkingFridges:ThirdPartyOption Conditional

Int Property SunsetSarsaparillaWarmID Auto Const Mandatory
Int Property SunsetSarsaparillaColdID Auto Const Mandatory

Function buildRecipesLogic()
	Potion sunsetWarm = Plugin.lookupForm(SunsetSarsaparillaWarmID) as Potion
	Potion sunsetCold = Plugin.lookupForm(SunsetSarsaparillaColdID) as Potion
	
	if (sunsetWarm && sunsetCold)
		addRecipe(RecipeContainer:Utility.createRecipe(sunsetWarm, sunsetCold))
	endif
EndFunction
