Scriptname WorkingFridges:EngineAliasRepair extends Quest

Chronicle:Engine Property WorkingFridges_Engine Auto Const Mandatory
ReferenceAlias Property PlayerAlias Auto Const Mandatory

Event OnInit()
	if (WorkingFridges_Engine.IsRunning() && !PlayerAlias.GetReference())
		PlayerAlias.ForceRefTo(Game.GetPlayer())
		WorkingFridges_Engine.gameLoaded()
	endif
	
	Stop()
EndEvent
