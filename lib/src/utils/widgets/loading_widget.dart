import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.72,
      child: Center(
        child: CupertinoActivityIndicator(
          animating: true,
          radius: 15.0,
        ),
      ),
    );
  }
}
