import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AsyncWidget<T> extends StatelessWidget {
  final Future<T> Function() fetchData;
  final Widget loadingWidget;
  final Widget Function(T data) successData; // Changed to a function
  final Widget errorWidget;

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
              return errorWidget;
            } else {
              return successData(snapshot.data!); // Pass the data to the widget function
            }
        }
      },
    );
  }
}
