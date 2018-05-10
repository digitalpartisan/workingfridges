Scriptname WorkingFridges:PackageCustomizations extends Chronicle:Package:CustomBehavior

InjectTec:Injector:Bulk[] Property DLCPatches = None Auto Const Mandatory
InjectTec:Injector[] Property Injections = None Auto Const Mandatory

Vault111ExitDetector Property WorkingFridges_Vault111ExitDetector Auto Const Mandatory
HolotapeRetainer Property WorkingFridges_HolotapeRetainer Auto Const Mandatory

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

Function handleInjections(Bool bInject = true)
	if (!Injections)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < Injections.Length)
		if (bInject)
			Injections[iCounter].inject()
		else
			Injections[iCounter].revert()
		endif
		iCounter += 1
	endWhile
EndFunction

Function runInjections()
	handleDLCPatches()
	handleInjections()
EndFunction	

Function revertInjections()
	handleDLCPatches(false)
	handleInjections(false)
EndFunction

Bool Function installBehavior()
	runInjections()
	return true
EndFunction

Bool Function postloadBehavior()
	runInjections()
	return true
EndFunction

Bool Function uninstallBehavior()
	revertInjections()
	
	WorkingFridges_Vault111ExitDetector.Stop()
	WorkingFridges_HolotapeRetainer.Stop()
	
	return true
EndFunction
