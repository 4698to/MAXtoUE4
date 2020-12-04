
import sys
import MaxPlus
from PySide2 import QtWidgets,QtCore
try:
	script = "(getDir #scripts) + \"\MaxSendUnreal\""
	temp = MaxPlus.Core.EvalMAXScript(script).Get()
	if not temp in sys.path:
		sys.path.append(temp)
	script_filein = "filein ((getDir #scripts) + \"\MaxSendUnreal\FbxExporter_struat.ms\")"
	MaxPlus.Core.EvalMAXScript(script_filein)#.Get()
	
	import sdsMaxSendUnreal_dialog_V21
	
except BaseException:
	print("No Folder scripts\MaxSendUnreal")



if __name__=='__main__':
	app = QtWidgets.QApplication.instance()
	ui_maxsendtoue = sdsMaxSendUnreal_dialog_V21.Ui_Dialog()
	ui_maxsendtoue.show()
	#app.exec_()