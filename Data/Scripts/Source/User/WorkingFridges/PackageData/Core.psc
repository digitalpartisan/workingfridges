Scriptname WorkingFridges:PackageData:Core extends RecipeContainer:ChroniclePackage:Data

RecipeContainer:Logic:Local Property WorkingFridges_FridgeType Auto Const Mandatory

RecipeContainer:Logic:Local Function getFridgeType()
	return WorkingFridges_FridgeType
EndFunction
