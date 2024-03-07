from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import FeatherIconsQML
from sys import exit

app = QGuiApplication()
engine = QQmlApplicationEngine()
FeatherIconsQML.register(engine)
engine.quit.connect(app.quit)
engine.load("view.qml")
if not engine.rootObjects():
    exit(-1)
exit(app.exec())
