Here's a README file template for your Flutter package:


## normal_flutter_dialog

A Flutter package for displaying a simple dialog with customizable buttons.

## Installation

Add `normal_flutter_dialog_box` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  normal_flutter_dialog_box: ^1.0.0
```

Import the package in your Dart code:

```dart
import 'package:normal_flutter_dialog_box/normal_flutter_dialog.dart';
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:normal_flutter_dialog_box/normal_flutter_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Normal Flutter Dialog Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              DialogClass.showNormalAlertBox(
                context: context,
                alertBox: NormalFlutterDialog(
                  title: 'Dialog Title',
                  content: 'Dialog Content',
                  closeButtonText: CustomButton.textButton(
                    text: 'Close',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  actionButtonText: CustomButton.elevatedTextButton(
                    text: 'Action',
                    onPressed: () {
                      // Add your action logic here
                    },
                  ),
                ),
              );
            },
            child: Text('Show Dialog'),
          ),
        ),
      ),
    );
  }
}
```

## API Reference

### `DialogClass`

#### `showNormalAlertBox`

```dart
static Future showNormalAlertBox({
  required BuildContext context,
  required NormalFlutterDialog alertBox,
})
```

Displays a normal alert dialog box with customizable content.

### `NormalFlutterDialog`

A customizable alert dialog widget.

| Parameter               | Description                              |
|-------------------------|------------------------------------------|
| `title`                 | Title of the dialog.                     |
| `content`               | Content of the dialog.                   |
| `closeButtonText`       | Button to close the dialog.              |
| `actionButtonText`      | Button to perform an action.             |
| `backgroundColor`       | Background color of the dialog.          |
| `elevation`             | Elevation of the dialog.                 |
| `shadowColor`           | Color of the dialog shadow.              |
| `surfaceTintColor`      | Surface color of the dialog.             |
| `insetAnimationDuration`| Duration of the inset animation.         |
| `insetAnimationCurve`   | Curve of the inset animation.            |
| `insetPadding`          | Padding of the dialog.                   |
| `clipBehavior`          | Clip behavior of the dialog.             |
| `shape`                 | Shape of the dialog.                     |
| `alignment`             | Alignment of the dialog.                 |

### `CustomButton`

A customizable button widget.

| Parameter     | Description                                  |
|---------------|----------------------------------------------|
| `type`        | Type of button (`text`, `elevated`, `outlined`). |
| `text`        | Text displayed on the button.               |
| `onPressed`   | Callback function for button press event.   |
| `color`       | Color of the button.                        |
| `style`       | Style of the button.                        |
```

