Scriptname WorkingFridges:ThirdPartyOption extends Quest Conditional

Import DialogueDrinkingBuddyScript

InjectTec:Plugin Property Plugin Auto Const Mandatory
InjectTec:Injector:Bulk Property Injections Auto Const Mandatory
Chronicle:Package Property MyPackage Auto Const Mandatory

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
	(MyPackage.getEngine().getCorePackage().getCustomizations() as WorkingFridges:PackageCustomizations:Core).getFridgeType()
EndFunction

BrewingRecipe[] Function getRecipes()
	return recipeList
EndFunction

Function resetRecipeList()
	recipeList = new BrewingRecipe[0]
EndFunction

Function addRecipe(BrewingRecipe newRecipe)
	recipeList.Add(newRecipe)
EndFunction

Function buildRecipeList()
	resetRecipeList()
EndFunction

Function handleRecipes(Bool bAdd = true)
	if (bAdd)
		getFridgeType().addRecipes(getRecipes())
	else
		getFridgeType().removeRecipes(getRecipes())
		resetRecipeList() ; pure paranoia, but that never hurt anyone
	endif
EndFunction

Function handleInjections(Bool bInject = true, Bool bForce = false)
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
