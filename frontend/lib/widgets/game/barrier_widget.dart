import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';

class BarrierWidget extends StatelessWidget {
  const BarrierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          alignment: Alignment(game.barrierX, -1),
          child: Container(
            width: 80,
            height: game.barrierHeight,
            color: Colors.green,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          alignment: Alignment(game.barrierX, 1),
          child: Container(
            width: 80,
            height: game.barrierHeight,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
