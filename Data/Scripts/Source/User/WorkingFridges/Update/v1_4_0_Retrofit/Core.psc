Scriptname WorkingFridges:Update:v1_4_0_Retrofit:Core extends WorkingFridges:Update:v1_4_0_Retrofit

Function updateLogic()
	(getPackage().getCustomData() as WorkingFridges:PackageData:Core).getFridgeType().Start()
	parent.updateLogic()
EndFunction
