import 'dart:developer';

import 'package:flutter/material.dart';

class AsyncWidget<T> extends StatelessWidget {
  final Future<T> Function() fetchData;
  final Widget loadingWidget;
  final Widget Function(T data) successData; // Changed to a function
  final Widget Function(String error) errorWidget;

  AsyncWidget({
    required this.fetchData,
    required this.loadingWidget,
    required this.errorWidget,
    required this.successData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return loadingWidget;
          case ConnectionState.done:
            if (snapshot.hasError) {
              log("Error in getting Async: ${successData.toString()} ${snapshot.error}");
              return errorWidget(snapshot.error.toString());
            } else {
              return successData(
                  snapshot.data!); // Pass the data to the widget function
            }
        }
      },
    );
  }
}
