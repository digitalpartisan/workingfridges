Scriptname WorkingFridges:ThirdPartyContainer extends Quest

Import DialogueDrinkingBuddyScript

ObjectReference Property ContainerRef Auto Const Mandatory
GlobalVariable Property WorkingFridges_Testing_AddAmount Auto Const Mandatory

Function addDrink(Potion drinkForm)
	ContainerRef.AddItem(drinkForm, WorkingFridges_Testing_AddAmount.GetValueInt())
EndFunction

Function removeDrink(Potion drinkForm)
	ContainerRef.RemoveItem(drinkForm, -1)
EndFunction

Function handleRecipes(BrewingRecipe[] recipes, Bool bAdd = true)
	Int iCounter = 0
	Potion drink = None
	while (iCounter < recipes.Length)
		drink = recipes[iCounter].WarmDrinkVariant
		if (bAdd)
			addDrink(drink)
		else
			removeDrink(drink)
		endif
		iCounter += 1
	endWhile
EndFunction
