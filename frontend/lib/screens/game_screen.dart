import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider.dart';
import 'package:frontend/widgets/game/game_area_widget.dart';
import 'package:frontend/widgets/game/ground_widget.dart';
import 'package:frontend/widgets/game/score_widget.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.read<GameProvider>();
    return Listener(
      onPointerDown: (_) {
        if (!game.gameStarted) {
          game.startGame();
        }
        game.startHolding();
      },
      onPointerUp: (_) {
        game.stopHolding();
      },
      /*onTapDown: (_) {
        if (!game.gameStarted) {
          game.startGame();
        }

          game.jump();

      },*/
      child: const Scaffold(
        body: Column(
          children: [
            ScoreWidget(),
            Expanded(flex: 5, child: GameArea()),
            GroundWidget()
          ],
        ),
      ),
    );
  }
}