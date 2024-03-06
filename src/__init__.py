from pathlib import Path
from os import fspath
from PySide6.QtQml import QQmlApplicationEngine


def init(engine: QQmlApplicationEngine) -> None:
    import_path = Path(__file__).parent
    engine.addImportPath(fspath(import_path))
    engine.rootContext().setContextProperty("featherIconsModuleDir",
                                            fspath(import_path / "FeatherIconsModule"))
