import 'package:flutter/material.dart';

class CounterActionButton extends StatelessWidget {
  CounterActionButton({this.iconData, this.onPressed});
  final VoidCallback onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 12,
      minWidth: 12,
      child: RaisedButton(
          color: Colors.blue,
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            iconData,
            size: 20,
            color: Colors.white,
          )),
    );
  }
}
