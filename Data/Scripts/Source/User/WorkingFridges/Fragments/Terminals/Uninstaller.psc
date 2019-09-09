;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:Uninstaller Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_Engine_Handler.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Chronicle:Engine:Handler Property WorkingFridges_Engine_Handler Auto Const
