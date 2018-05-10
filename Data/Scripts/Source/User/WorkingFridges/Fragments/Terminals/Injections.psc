;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:Injections Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_InjectionDetails.setInjector(WorkingFridges_MK_MenuInjection)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WorkingFridges:InjectionDetails Property WorkingFridges_InjectionDetails Auto Const

InjectTec:Injector Property WorkingFridges_MK_MenuInjection Auto Const
