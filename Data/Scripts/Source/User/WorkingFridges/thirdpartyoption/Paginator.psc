Scriptname WorkingFridges:ThirdPartyOption:Paginator extends DynamicTerminal:Paginator Conditional

WorkingFridges:ThirdPartyOption:Handler Property OptionHandler Auto Const Mandatory

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	OptionHandler.setOption(getItem(iItem) as WorkingFridges:ThirdPartyOption)
	OptionHandler.draw(akTerminalRef)
EndFunction
