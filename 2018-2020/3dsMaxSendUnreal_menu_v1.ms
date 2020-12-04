python.Init()
(
	if ((menuMan.findMenu "Send2Unreal") != undefined) then
	(
		menuMan.unRegisterMenu (menuMan.findMenu "Send2Unreal")
		menuMan.updateMenuBar()
	)


	macroScript SendtoUnrealEngine category:"Send2Unreal" buttonText: "Send2Unreal_v1"
	(
		--filein ((getDir #scripts) + @"\MaxSendUnreal\FbxExporter_struat.ms")
		python.ExecuteFile((getDir #scripts) + "\\MaxSendUnreal\\OpenSendToolUI.py")
	)

	macroScript SendtoUnrealEnginehelp category:"Send2Unrealhelp" buttonText: "Help"
	(
		ShellLaunch "explorer.exe" "http://121.207.250.90:81/"
	)

	Main = menuMan.getMainMenuBar()
	Menu = menuMan.createMenu "Send2Unreal"
	theSubMenu = menuMan.createSubMenuItem "Send2Unreal" Menu
	Main.addItem theSubMenu (Main.numItems()+1)

	Action = menuMan.createActionItem "SendtoUnrealEngine" "Send2Unreal"
	Menu.addItem Action (Menu.numItems() + 1 )

	Action2 = menuMan.createActionItem "SendtoUnrealEnginehelp" "Send2Unrealhelp"
	Menu.addItem Action2 (Menu.numItems() + 1 )
	menuMan.updateMenuBar()
)
