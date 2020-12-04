import sys
import MaxPlus
from PySide import QtGui,QtCore
try:
	script = "(getDir #scripts) + \"\MaxSendUnreal\""
	temp = MaxPlus.Core.EvalMAXScript(script).Get()
	#temp = r"D:\Git_Python\Unreal\MaxSendUnreal\MaxSendUnreal"
	sys.path.append(temp)
	script_filein = "filein ((getDir #scripts) + \"\MaxSendUnreal\FbxExporter_struat.ms\")"
	MaxPlus.Core.EvalMAXScript(script_filein)#.Get()
	import sdsMaxSendUnreal_dialog_V2 as sdsMaxSendUnreal_dialog
except BaseException:
	print("No Folder scripts\MaxSendUnreal")

if __name__=='__main__':
	app = QtGui.QApplication.instance()
	ui_maxsendtoue = sdsMaxSendUnreal_dialog.Ui_Dialog()
	ui_maxsendtoue.show()
	#app.exec_()