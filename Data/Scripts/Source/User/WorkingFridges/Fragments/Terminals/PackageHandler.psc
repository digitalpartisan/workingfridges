;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:PackageHandler Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
OptionData.setData( (PackageHandler.getPackage().GetCustomizations() as WorkingFridges:PackageCustomizations).ThirdPartyOptions as Form[] )
OptionPaginator.init(akTerminalRef, OptionData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
PackageHandler.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Chronicle:Package:Handler Property PackageHandler Auto Const

DynamicTerminal:ListWrapper:DynamicArray Property OptionData Auto Const

WorkingFridges:ThirdPartyOption:Paginator Property OptionPaginator Auto Const
