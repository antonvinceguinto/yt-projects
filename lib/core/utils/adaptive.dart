// Inspired by https://github.com/RedBrogdon/building_for_ios_IO19/blob/master/lib/adaptive_widgets.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdaptiveActivityIndicator extends StatelessWidget {
  const AdaptiveActivityIndicator({
    Key key,
    this.size = 20,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return theme.platform == TargetPlatform.iOS
        ? CupertinoActivityIndicator(
            radius: size / 2,
          )
        : Center(
            child: SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
            ),
          );
  }
}

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({
    Key key,
    this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  final List<Widget> actions;
  final Widget content;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoAlertDialog(
              title: title,
              content: content,
              actions: actions,
            )
          : AlertDialog(
              title: title,
              content: content,
              actions: actions.reversed.toList(),
              shape: theme.cardTheme.shape,
            ),
    );
  }
}

class AdaptiveDialogAction extends StatelessWidget {
  const AdaptiveDialogAction({
    Key key,
    @required this.child,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    @required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return theme.platform == TargetPlatform.iOS
        ? CupertinoDialogAction(
            child: child,
            onPressed: onPressed,
            isDestructiveAction: isDestructiveAction,
            isDefaultAction: isDefaultAction,
          )
        : FlatButton(
            textColor: isDestructiveAction
                ? theme.colorScheme.error
                : theme.buttonColor,
            shape: theme.buttonTheme.shape,
            child: child,
            onPressed: onPressed,
          );
  }
}

Future<T> showAdaptiveDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  @required WidgetBuilder builder,
}) {
  return Theme.of(context).platform == TargetPlatform.iOS
      ? showCupertinoDialog<T>(
          context: context,
          builder: builder,
        )
      : showDialog<T>(
          context: context,
          barrierDismissible: barrierDismissible,
          builder: builder,
        );
}

Future showLoadingIndicator(BuildContext context) async {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Center(
          child: AdaptiveActivityIndicator(),
        ),
      );
    },
  );
}

Future<T> showAdaptiveSimpleDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  @required WidgetBuilder builder,
}) {
  return Theme.of(context).platform == TargetPlatform.iOS
      ? showCupertinoModalPopup<T>(
          context: context,
          builder: builder,
        )
      : showDialog<T>(
          context: context,
          barrierDismissible: barrierDismissible,
          builder: builder,
        );
}

Future showAlertDialog(String title, String message,
    {bool barrierDismissible = true, Function onOk, String buttonTitle}) async {
  if (Get.context == null) {
    return;
  }

  try {
    await showAdaptiveDialog(
      context: Get.context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AdaptiveAlertDialog(
          title: title == null ? SizedBox() : Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            AdaptiveDialogAction(
              child: Text(buttonTitle ?? 'Close'),
              onPressed:
                  onOk == null ? () => Navigator.of(context).pop() : onOk,
            )
          ],
        );
      },
    );
  } on FlutterError catch (error) {
    print(error);
  }
}
