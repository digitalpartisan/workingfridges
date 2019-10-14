;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname WorkingFridges:Fragments:Terminals:PackageHandler Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
RecipeContainer:CrossPluginIntegrator:PackageBehavior integratorBehavior = WorkingFridges:Dependencies.getInstance().getIntegratorSearcher().searchOneCrossPluginIntegrator(WorkingFridges_Package_Handler.getPackage())
if (integratorBehavior)
	OptionData.setData(integratorBehavior.Integrators as Form[])
else
	OptionData.setData(None)
endif
OptionPaginator.init(akTerminalRef, OptionData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
WorkingFridges_Package_Handler.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Chronicle:Package:Handler Property WorkingFridges_Package_Handler Auto Const

DynamicTerminal:ListWrapper:FormArray:Dynamic Property OptionData Auto Const

RecipeContainer:CrossPluginIntegrator:Paginator Property OptionPaginator Auto Const
