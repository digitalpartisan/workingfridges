Scriptname WorkingFridges:TestingContainer:Refresher extends ObjectReference

WorkingFridges:TestingContainer Property ContainerHandler Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	ContainerHandler.refreshContainer()
EndEvent
