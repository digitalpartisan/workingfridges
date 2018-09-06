Scriptname WorkingFridges:ThirdPartyOption extends RecipeContainer:RemoteRecipes Conditional

Import DialogueDrinkingBuddyScript

InjectTec:Injector:Bulk Property Injections = None Auto Const
RecipeContainer:Logic:Fridge Property WorkingFridges_FridgeType Auto Const Mandatory
WorkingFridges:ThirdPartyContainer Property WorkingFridges_Testing_ThirdPartyLocker Auto Const Mandatory

Bool bHasRun = false Conditional
BrewingRecipe[] recipeList = None

Bool function hasRun()
	return bHasRun
EndFunction

Bool Function couldRun()
	return Plugin.isInstalled()
EndFunction

Bool Function needsSetup()
	return !hasRun() && couldRun()
EndFunction

Bool Function needsTeardown()
	return hasRun() && !couldRun()
EndFunction

RecipeContainer:Logic:Fridge Function getFridgeType()
	return WorkingFridges_FridgeType
EndFunction

BrewingRecipe[] Function getRecipes()
	return recipeList
EndFunction

Function resetRecipeList()
	recipeList = new BrewingRecipe[0]
EndFunction

Function buildRecipesLogic()
{Written to be overriden in child scripts based on unpredictable needs.}
	recipeList = buildRecipes()
EndFunction

Function buildRecipeList()
	resetRecipeList()
	buildRecipesLogic()
EndFunction

Function handleRecipes(Bool bAdd = true)
	BrewingRecipe[] recipeData = getRecipes()
	if (0 == recipeData.Length)
		return
	endif

	WorkingFridges_Testing_ThirdPartyLocker.handleRecipes(recipeData, bAdd)
	
	if (bAdd)
		getFridgeType().addRecipes(recipeData)
	else
		getFridgeType().removeRecipes(recipeData)
		resetRecipeList() ; pure paranoia, but that never hurt anyone
	endif
EndFunction

Function handleInjections(Bool bInject = true, Bool bForce = false)
	if (!Injections)
		return
	endif

	if (bInject)
		Injections.inject(bForce)
	else
		Injections.revert(bForce)
	endif
EndFunction

Function setup()
	if (hasRun())
		return
	endif

	WorkingFridges:Logger.logThirdPartyOptionSettingUp(self)
	
	buildRecipeList()
	handleInjections()
	handleRecipes()
	
	bHasRun = true
EndFunction

Function teardown()
	if (!hasRun())
		return
	endif

	WorkingFridges:Logger.logThirdPartyOptionTearingDown(self)
	
	handleRecipes(false)
	handleInjections(false)
	
	bHasRun = false
EndFunction

Function stateCheck()
	WorkingFridges:Logger.logThirdPartyOptionCheckingState(self)

	if (needsSetup())
		setup()
		return
	endif
	
	if (needsTeardown())
		teardown()
		return
	endif
EndFunction
