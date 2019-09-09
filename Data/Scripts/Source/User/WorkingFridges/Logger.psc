Scriptname WorkingFridges:Logger Hidden Const DebugOnly

String Function getName() Global
	return "WorkingFridges"
EndFunction

Bool Function log(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.log(getName(), sMessage, tags)
EndFunction

Bool Function warn(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.warn(getName(), sMessage, tags)
EndFunction

Bool Function error(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.error(getName(), sMessage, tags)
EndFunction

Bool Function logNoCorePackageData(WorkingFridges:ThirdPartyOption option) Global
	return error(option + " detects no core package custom data")
EndFunction

Bool Function logCorePackageDataWrongType(WorkingFridges:ThirdPartyOption option) Global
	return error(option + " find core package custom data is wrong type")
EndFunction

Bool Function logCorePackageFridgeType(WorkingFridges:ThirdPartyOption option, RecipeContainer:Logic:Local containerType) Global
	return log(option + " found fridge type " + containerType)
EndFunction
