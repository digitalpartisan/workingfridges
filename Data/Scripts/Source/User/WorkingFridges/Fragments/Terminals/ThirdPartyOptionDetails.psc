;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:ThirdPartyOptionDetails Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_InjectionDetails.run()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_InjectionDetails.forceRun()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WorkingFridges:InjectionDetails Property WorkingFridges_InjectionDetails Auto Const
