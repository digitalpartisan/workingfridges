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
WorkingFridges_EngineDetails.examineState()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WorkingFridges:EngineDetails Property WorkingFridges_EngineDetails Auto Const

Chronicle:Engine:PackageList Property PackageData Auto Const

Chronicle:Package:Paginator Property PackagePaginator Auto Const
