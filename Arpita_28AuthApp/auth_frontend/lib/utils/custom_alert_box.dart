import 'package:flutter/material.dart';

class CustomAlertBox {

  // 🔹 Simple Alert
  static void showAlert(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = "OK",
    VoidCallback? onPressed,
  }) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title),
          content: Text(message),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onPressed != null) {
                  onPressed();
                }
              },
              child: Text(buttonText),
            ),

          ],
        );
      },
    );
  }


  // 🔹 Confirm Alert (Cancel + OK)
  static void showConfirmAlert(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onOk,
  }) {

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title),
          content: Text(message),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (onOk != null) {
                  onOk();
                }
              },
              child: const Text("OK"),
            ),

          ],
        );
      },
    );
  }

}
