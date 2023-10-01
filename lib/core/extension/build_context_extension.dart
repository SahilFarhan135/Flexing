import 'package:flutter/material.dart';

extension CustomBuildContext on BuildContext {
  int getResponsiveColumnCount() => MediaQuery.of(this).size.width >= 1200
      ? 5
      : MediaQuery.of(this).size.width >= 600
          ? 4
          : 2;

  void showToast(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showAlertDialog(String title, String content) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> navigateToPage(Widget page) async {
    await Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

// Add more custom methods as needed
}
