Scriptname WorkingFridges:ThirdPartyOption:SodaHeaven extends WorkingFridges:ThirdPartyOption

Import DialogueDrinkingBuddyScript

InjectTec:Plugin Property WorkingFridges_FarHarbor_Plugin Auto Const Mandatory
RemoteRecipeDefinition[] Property FarHarborDefinitions = None Auto Const

Bool Function couldRun()
	return parent.couldRun() && WorkingFridges_FarHarbor_Plugin.isInstalled()
EndFunction

Potion Function getFarHarborUnprocessedPotion(RemoteRecipeDefinition dataSet)
	return getPotion(WorkingFridges_FarHarbor_Plugin, dataSet.UnprocessedForm, dataSet.UnprocessedID)
EndFunction

BrewingRecipe Function buildFarHarborRecipe(RemoteRecipeDefinition dataSet)
	Potion unprocessedForm = getFarHarborUnprocessedPotion(dataSet)
	Potion processedForm = getProcessedPotion(dataSet)
	
	if (!unprocessedForm || !processedForm)
		return None
	endif
	
	return RecipeContainer:Utility.createRecipe(unprocessedForm, processedForm)
EndFunction

BrewingRecipe[] Function buildFarHarborRecipes()
	BrewingRecipe[] results = new BrewingRecipe[0]
	Int iCounter = 0
	BrewingRecipe newRecipe = None
	
	while (iCounter < FarHarborDefinitions.Length)
		newRecipe = buildFarHarborRecipe(FarHarborDefinitions[iCounter])
		if (!newRecipe)
			return None
		endif
		
		results.Add(newRecipe)
		iCounter += 1
	endWhile
	
	return results
EndFunction

BrewingRecipe[] Function buildRecipes()
	BrewingRecipe[] baseRecipes = parent.buildRecipes()
	if (!baseRecipes)
		return None
	endif
	
	BrewingRecipe[] farHarborRecipes = buildFarHarborRecipes()
	if (!farHarborRecipes)
		return None
	endif
	
	Int iCounter = 0
	while (iCounter < farHarborRecipes.Length)
		baseRecipes.Add(farHarborRecipes[iCounter])
		iCounter += 1
	endWhile
	
	return baseRecipes
EndFunction
