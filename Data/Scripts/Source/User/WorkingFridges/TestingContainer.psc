Scriptname WorkingFridges:TestingContainer extends Quest

Import RecipeContainer:Utility:Recipe

RecipeContainer:Recipe:Builder:List Property BuilderList Auto Const Mandatory
ObjectReference Property ContainerRef Auto Const Mandatory
GlobalVariable Property WorkingFridges_Testing_AddAmount Auto Const Mandatory

Function clearContainer()
	ContainerRef.RemoveAllItems()
EndFunction

Function handleRecipe(SimpleRecipe recipe)
	if (!recipe)
		return
	endif
	
	ContainerRef.AddItem(recipe.unprocessed, WorkingFridges_Testing_AddAmount.GetValueInt())
EndFunction

Function handleBuilder(RecipeContainer:Recipe:Builder builder)
	if (!builder || !builder.hasData())
		return
	endif
	
	Int iCounter = 0
	while (iCounter < builder.getSize())
		handleRecipe(builder.getRecipe(iCounter))
		iCounter += 1
	endWhile
EndFunction

Function refreshContainer()
	clearContainer()
	
	if (!BuilderList.hasData())
		return
	endif
EndFunction

Event RecipeContainer:Recipe:Builder:List.RebuildRequired(RecipeContainer:Recipe:Builder:List akSender, Var[] akArgs)
	if (BuilderList == akSender)
		refreshContainer()
	endif
EndEvent

Event OnQuestInit()
	clearContainer()
	RegisterForCustomEvent(BuilderList, "RebuildRequired")
EndEvent

Event OnQuestShutdown()
	UnregisterForCustomEvent(BuilderList, "RebuildRequired")
	clearContainer()
EndEvent
