Scriptname WorkingFridges:PackageCustomizations:Core extends WorkingFridges:PackageCustomizations

InjectTec:Injector:Bulk[] Property DLCPatches = None Auto Const
Vault111ExitDetector Property WorkingFridges_Vault111ExitDetector Auto Const Mandatory
HolotapeRetainer Property WorkingFridges_HolotapeRetainer Auto Const Mandatory
RecipeContainer:Logic:Fridge Property WorkingFridges_FridgeType Auto Const Mandatory

RecipeContainer:Logic:Fridge Function getFridgeType()
	return WorkingFridges_FridgeType
EndFunction

Function handleDLCPatches(Bool bInject = true)
	if (!DLCPatches)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < DLCPatches.Length)
		if (bInject)
			DLCPatches[iCounter].inject()
		else
			DLCPatches[iCounter].revert()
		endif
		iCounter += 1
	endWhile
EndFunction

Bool Function installBehavior()
	handleDLCPatches()
	return parent.installBehavior()
EndFunction

Bool Function postloadBehavior()
	handleDLCPatches()
	Bool bResult = parent.postloadBehavior()
	
	getFridgeType().cleanData() ; this needs to happen after all the other normal package behavior
	
	return bResult
EndFunction

Bool Function uninstallBehavior()
	WorkingFridges_Vault111ExitDetector.Stop()
	WorkingFridges_HolotapeRetainer.Stop()
	
	handleDLCPatches(false)
	
	return parent.uninstallBehavior()
EndFunction
