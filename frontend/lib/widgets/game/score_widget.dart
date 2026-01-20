import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider.dart';
import 'package:provider/provider.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.blue[300],
          child: Center(
            child: game.gameStarted ?Column(
              children: [Text('점수 : ${game.score}',
                style: const TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 4),
                Text("시간 : ${game.remainingTime.toStringAsFixed(1)}초"),
                Text("목표 : ${game.targetScore}점"),
                ]) :const Text("탭하여 시작")
          )
        ));
  }
}
