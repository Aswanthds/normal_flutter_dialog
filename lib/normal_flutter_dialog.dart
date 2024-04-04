library normal_flutter_dialog;

import 'package:flutter/material.dart';

class DialogClass {
  static Future showNormalAlertBox({
    required BuildContext context,
    required NormalFlutterDialog alertBox,
  }) {
    return showDialog(
      context: context,
      builder: (context) => alertBox,
    );
  }
}

class NormalFlutterDialog extends StatelessWidget {
  final String title;
  final String content;
  final CustomButton closeButtonText;
  final CustomButton actionButtonText;
  final Color? backgroundColor;

  final double elevation;

  final Color? shadowColor;

  final Color? surfaceTintColor;

  final Duration insetAnimationDuration;

  final Curve insetAnimationCurve;

  final EdgeInsets? insetPadding;

  final Clip clipBehavior;

  final ShapeBorder? shape;

  final AlignmentGeometry? alignment;

  NormalFlutterDialog({
    super.key,
    required this.title,
    required this.content,
    required this.closeButtonText,
    required this.actionButtonText,
    this.backgroundColor,
    this.elevation = 0.0,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetAnimationDuration = Duration.zero,
    this.insetAnimationCurve = Curves.decelerate,
    this.insetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
  }) : assert(title.isNotEmpty || content.isNotEmpty || elevation >= 0.0);

  @override
  Widget build(BuildContext context) {
    final dialogTheme = Theme.of(context).dialogTheme;
    return Dialog(
      alignment: alignment ?? dialogTheme.alignment,
      clipBehavior: clipBehavior,
      insetAnimationCurve: insetAnimationCurve,
      insetAnimationDuration: insetAnimationDuration,
      insetPadding: insetPadding ?? EdgeInsets.all(20),
      shadowColor: shadowColor ?? dialogTheme.shadowColor,
      surfaceTintColor: surfaceTintColor ?? dialogTheme.surfaceTintColor,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      elevation: 0.0,
      backgroundColor: backgroundColor ?? dialogTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              content,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                closeButtonText,
                const SizedBox(width: 10.0),
                actionButtonText,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum CustomButtonType { text, elevated, outlined }

class CustomButton extends StatelessWidget {
  final CustomButtonType type;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final ButtonStyle? style;

  const CustomButton({
    super.key,
    required this.type,
    required this.text,
    this.onPressed,
    this.color,
    required this.style,
  });

  factory CustomButton.textButton({
    required String text,
    VoidCallback? onPressed,
    ButtonStyle? style,
  }) =>
      CustomButton(
        type: CustomButtonType.text,
        text: text,
        onPressed: onPressed,
        style: style,
      );

  factory CustomButton.elevatedTextButton(
          {required String text,
          VoidCallback? onPressed,
          Color? color,
          ButtonStyle? style}) =>
      CustomButton(
        type: CustomButtonType.elevated,
        text: text,
        onPressed: onPressed,
        color: color,
        style: style,
      );

  factory CustomButton.outlinedTextButton({
    required String text,
    VoidCallback? onPressed,
    Color? color,
    ButtonStyle? style,
  }) =>
      CustomButton(
        type: CustomButtonType.outlined,
        text: text,
        onPressed: onPressed,
        color: color,
        style: style,
      );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CustomButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: style,
          child: Text(text),
        );
      case CustomButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: Text(text),
        );
      case CustomButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: Text(text),
        );
      default:
        throw ArgumentError('Invalid CustomButtonType: $type');
    }
  }
}
