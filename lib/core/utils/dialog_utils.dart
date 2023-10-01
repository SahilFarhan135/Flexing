import 'package:flutter/material.dart';

class DialogUtil {
  static Future<void> showAlert(
    BuildContext context, {
    String title = 'Alert',
    String message = '',
    String buttonText = 'OK',
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showFullScreenDialog(
    BuildContext context, {
    required Widget content,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(0),
          child: content,
        );
      },
    );
  }

  static Future<void> showCustomSizedDialog(
    BuildContext context, {
    required Widget content,
    double widthPercentage = 0.7,
    double heightPercentage = 0.8,
  }) async {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double dialogWidth = screenWidth * widthPercentage;
    double dialogHeight = screenHeight * heightPercentage;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: dialogWidth,
            height: dialogHeight,
            child: content,
          ),
        );
      },
    );
  }

  static Future<void> showConfirmationDialog(
    BuildContext context, {
    String title = 'Confirmation',
    String message = '',
    String confirmButtonText = 'Confirm',
    String cancelButtonText = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(cancelButtonText),
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancel != null) onCancel();
              },
            ),
            TextButton(
              child: Text(confirmButtonText),
              onPressed: () {
                Navigator.of(context).pop();
                if (onConfirm != null) onConfirm();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showTextInputDialog(
    BuildContext context, {
    String title = 'Enter Text',
    String hintText = '',
    String confirmButtonText = 'OK',
    String cancelButtonText = 'Cancel',
    Function(String)? onTextEntered,
  }) async {
    TextEditingController textController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: hintText),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(cancelButtonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(confirmButtonText),
              onPressed: () {
                Navigator.of(context).pop();
                if (onTextEntered != null) {
                  onTextEntered(textController.text);
                }
              },
            ),
          ],
        );
      },
    );
  }

// Add more methods for other types of dialogs (e.g., confirmation, input, etc.)
}

// Create a custom Flutter dialog
Future<void> showFlutterDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Flutter Dialog'),
        content: Text('This is a Flutter dialog over a native activity.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
