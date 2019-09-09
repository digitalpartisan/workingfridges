Scriptname WorkingFridges:Update:v1_4_0_Retrofit extends Chronicle:Package:Update

Function updateLogic()
	(getPackage().getCustomData() as WorkingFridges:PackageData:Core).getFridgeType().Start()
	parent.updateLogic()
EndFunction
