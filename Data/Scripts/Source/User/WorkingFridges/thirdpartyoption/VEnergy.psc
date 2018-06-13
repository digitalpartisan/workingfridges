Scriptname WorkingFridges:ThirdPartyOption:VEnergy extends WorkingFridges:ThirdPartyOption Conditional

Int Property VEnergyWarmID Auto Const Mandatory
Potion Property WorkingFridges_VEnergy_Drink_Cold Auto Const Mandatory

Function buildRecipesLogic()
	Potion vEnergyWarm = Plugin.lookupForm(VEnergyWarmID) as Potion
	
	if (vEnergyWarm)
		addRecipe(RecipeContainer:Utility.createRecipe(vEnergyWarm, WorkingFridges_VEnergy_Drink_Cold))
	endif
EndFunction
