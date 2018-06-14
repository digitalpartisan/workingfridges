Scriptname WorkingFridges:ThirdPartyOption:LimaDetachment extends WorkingFridges:ThirdPartyOption

Int Property PilsnerWarmID Auto Const Mandatory
Int Property PilsnerColdID Auto Const Mandatory

Function buildRecipesLogic()
	Potion pilsnerWarm = Plugin.lookupForm(PilsnerWarmID) as Potion
	Potion pilsnerCold = Plugin.lookupForm(PilsnerColdID) as Potion
	
	if (pilsnerWarm && pilsnerCold)
		addRecipe(RecipeContainer:Utility.createRecipe(pilsnerWarm, pilsnerCold))
	endif
EndFunction
