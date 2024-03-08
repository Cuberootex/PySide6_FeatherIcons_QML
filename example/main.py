from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6 import QtCore
import FeatherIconsQML
from sys import exit

app = QGuiApplication()
engine = QQmlApplicationEngine()

QtCore.qInstallMessageHandler(lambda mode, context, msg: print(f"[qml] {msg}"))
FeatherIconsQML.register(engine)

engine.quit.connect(app.quit)
engine.load("view.qml")

if not engine.rootObjects():
    exit(-1)

exit(app.exec())
