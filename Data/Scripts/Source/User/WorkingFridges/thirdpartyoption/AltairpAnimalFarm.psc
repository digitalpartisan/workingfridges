Scriptname WorkingFridges:ThirdPartyOption:AltairpAnimalFarm extends WorkingFridges:ThirdPartyOption

Int Property BrahminMilkWarmID Auto Const Mandatory
Potion Property WorkingFridges_AltairpAnimalFarm_BrahminMilk_Cold Auto Const Mandatory

Int Property CatMilkWarmID Auto Const Mandatory
Potion Property WorkingFridges_AltairpAnimalFarm_CatMilk_Cold Auto Const Mandatory

Int Property MoleratMilkWarmID Auto Const Mandatory
Potion Property WorkingFridges_AltairpAnimalFarm_MoleratMilk_Cold Auto Const Mandatory

Function buildRecipesLogic()
	Potion brahminMilkWarm = Plugin.lookupForm(BrahminMilkWarmID) as Potion
	Potion catMilkWarm = Plugin.lookupForm(CatMilkWarmID) as Potion
	Potion moleratMilkWarm = Plugin.lookupForm(MoleratMilkWarmID) as Potion
	
	if (brahminMilkWarm && catMilkWarm && moleratMilkWarm)
		addRecipe(RecipeContainer:Utility.createRecipe(brahminMilkWarm, WorkingFridges_AltairpAnimalFarm_BrahminMilk_Cold))
		addRecipe(RecipeContainer:Utility.createRecipe(catMilkWarm, WorkingFridges_AltairpAnimalFarm_CatMilk_Cold))
		addRecipe(RecipeContainer:Utility.createRecipe(moleratMilkWarm, WorkingFridges_AltairpAnimalFarm_MoleratMilk_Cold))
	endif
EndFunction
