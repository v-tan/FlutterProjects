import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        radius: 20,
      );
    } else if (Platform.isAndroid) {
      return CircularProgressIndicator();
    }
  }
}
