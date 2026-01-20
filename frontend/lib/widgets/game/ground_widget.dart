import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroundWidget extends StatelessWidget {
  const GroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.brown,
        ));
  }
}
