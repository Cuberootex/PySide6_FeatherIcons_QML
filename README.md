# PySide6 Feather Icons 

A PySide6 library for integrating Feather icons into QML.

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FCuberootex%2FPySide6_FeatherIcons_QML&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23404040&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

## Installation

In your Python project, if you are using a virtual environment, source it, then run
```
pip install PySide6-FeatherIcons-QML
```

Your app's `QQmlApplicationEngine` first needs to be registered before any icons can be used. This is done with the `FeatherIconsQML.register(e: QQmlApplicationEngine)` method.

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

```qml
// view.qml
import FeatherIcons
```

## Usage



### 1. FeatherIcon QML object


The `FeatherIcon` QML object is used to display icons.

#### Properties

| Name        | Type   | Required | Default | Notes                                                                                              |
| ----------- | ------ | -------- | ------- | -------------------------------------------------------------------------------------------------- |
| icon        | string | **true**     |         | A valid Feather icon name. All possible Feather icons can be found here: https://feathericons.com/ |
| iconSize    | real   | false    | 24      |                                                                                                    |
| strokeWidth | real   | false    | 2.0     | Accepted values are: 0.5, 1.0, 1.5, 2.0, 2.5, 3.0                                                  |
| color       | color | false    | "black" |                                                                                                    |
|shadowEnabled|bool|false|false|This and other shadow/blur-related properties are passed to a `MultiEffect` QML object (https://doc.qt.io/qt-6/qml-qtquick-effects-multieffect.html)|
|shadowColor|color|false|"black"||
|shadowHorizontalOffset|real|false|2||
|shadowVerticalOffset|real|false|2||
|shadowBlur|real|false|0.6|Value ranges from 0.0 to 1.0|
|shadowOpacity|real|false|0.6|Value ranges from 0.0 to 1.0|
|shadowScale|real|false|1.0||
|blurEnabled|bool|false|false||
|blur|real|false|0.0|Value ranges from 0.0 to 1.0|
|blurMax|int|false|32|Affects both blur and shadow effects.|
|blurMultiplier|real|false|1.0|Affects both blur and shadow effects.|


Because a `FeatherIcon` is first and foremost a QML `Item` under the hood, it also supports the properties listed here: https://doc.qt.io/qt-6/qml-qtquick-item.html

#### Example 

```qml
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

```qml
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







