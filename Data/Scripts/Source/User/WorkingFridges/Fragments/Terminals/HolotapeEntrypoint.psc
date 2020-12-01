;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:HolotapeEntrypoint Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
PackagePaginator.init(akTerminalRef, PackageData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_Engine_Handler.refreshStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().MoveTo(WorkingFridgesDebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Chronicle:Engine:Handler Property WorkingFridges_Engine_Handler Auto Const Mandatory

Chronicle:Package:ListWrapper Property PackageData Auto Const Mandatory

Chronicle:Package:Paginator Property PackagePaginator Auto Const Mandatory

ObjectReference Property WorkingFridgesDebugMarker Auto Const Mandatory
