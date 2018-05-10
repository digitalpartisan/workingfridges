Scriptname WorkingFridges:EngineDetails extends Quest Conditional

Chronicle:Engine Property MyEngine Auto Const Mandatory

Bool bCanUninstall = false Conditional

Function examineState()
	bCanUninstall = MyEngine.canUninstall()
EndFunction

Bool Function canUninstall()
	return bCanUninstall
EndFunction

Function uninstall()
	MyEngine.uninstall()
	bCanUninstall = false
EndFunction
