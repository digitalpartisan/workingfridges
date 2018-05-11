;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:UninstallProcess Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_EngineDetails.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WorkingFridges:EngineDetails Property WorkingFridges_EngineDetails Auto Const
