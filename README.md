# PySide6 Feather Icons 

A PySide6 library for integrating Feather icons into QML.



## Installation


`QQmlApplicationEngine` first needs to be registered before any icons can be used. This is done with the `FeatherIconsQML.register(e: QQmlApplicationEngine)` method.

```python
# main.py

(...)

from PySide6.QtQml import QQmlApplicationEngine
import FeatherIconsQML

(...)

engine = QQmlApplicationEngine()
FeatherIconsQML.register(engine)

```

The `FeatherIcons` module can now be imported inside QML files:

```json
// view.qml
import FeatherIcons
```

## Usage



### 1. FeatherIcon QML object


The `FeatherIcon` QML object is used to display icons.

#### Properties

| Name        | Type   | Required | Default | Notes                                                                                              |
| ----------- | ------ | -------- | ------- | -------------------------------------------------------------------------------------------------- |
| icon        | string | true     |         | A valid Feather icon name. All possible Feather icons can be found here: https://feathericons.com/ |
| iconSize    | real   | false    | 24      |                                                                                                    |
| strokeWidth | real   | false    | 2.0     | Accepted values are: 0.5, 1.0, 1.5, 2.0, 2.5, 3.0                                                  |
| color       | string | false    | "black" |                                                                                                    |

#### Example 

```json
// view.qml
import FeatherIcons

(...)

FeatherIcon {
	icon: "feather"
}

FeatherIcon {
	icon: "activity"
	iconSize: 48
	color: "white"
	strokeWidth: 1.5
}
```


### 2. Icons in Qt Quick Controls

Buttons, item delegates and menu items can present an icon in addition to a text label with Qt Quick Controls. In order to use Feather icons with such components, this library exposes a `FeatherIconsVault` singleton class containing a `getSource` method. 

For more information regarding Icons in Qt Quick Controls, please see: https://doc.qt.io/qt-6/qtquickcontrols-icons.html

#### `getSource(featherIconName: string, strokeWidth?: number): string`


Returns the source URL of a Feather icon given its `featherIconName` and a `strokeWidth`, which can then be passed to the `icon.source` property (of a `Button`, for example).
|Arguments|Default value|Details|
|--|--|--|
|featherIconName||A valid Feather icon name.
|strokeWidth|2.0|Accepted values are: 0.5, 1.0, 1.5, 2.0, 2.5, 3.0| 

#### Example

```json
// view.qml
import QtQuick.Controls
import FeatherIcons

...

Button {
	text: "Increase"
	icon.source: FeatherIconsVault.getSource("plus")
	icon.color: "green"
}
```







