Scriptname WorkingFridges:PackageData:Core extends WorkingFridges:PackageData

RecipeContainer:Logic:Local Property WorkingFridges_FridgeType Auto Const Mandatory

RecipeContainer:Logic:Local Function getFridgeType()
	return WorkingFridges_FridgeType
EndFunction
