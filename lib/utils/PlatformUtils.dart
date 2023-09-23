import 'package:flutter/cupertino.dart';

bool isAndroid(BuildContext context) {
  return MediaQuery.of(context).size.width<600;
}
