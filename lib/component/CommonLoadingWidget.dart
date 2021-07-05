import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_skeleton/constants/Constants.dart';

class CommonLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Constants.appAccentColor,
      ),
    );
  }
}
