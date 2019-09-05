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

Bool Function logThirdPartyOptionCheckingState(WorkingFridges:ThirdPartyOption optionRef) Global
	return log(optionRef + " third party option is checking its state")
EndFunction

Bool Function logThirdPartyOptionSettingUp(WorkingFridges:ThirdPartyOption optionRef) Global
	return log(optionRef + " third party option is setting up")
EndFunction

Bool Function logThirdPartyOptionTearingDown(WorkingFridges:ThirdPartyOption optionRef) Global
	return log(optioNRef + " third party option is tearing down")
EndFunction
