import 'package:flutter/cupertino.dart';
import 'package:frontend/widgets/game/background_widget.dart';
import 'package:frontend/widgets/game/barrier_widget.dart';
import 'package:frontend/widgets/game/bird_widget.dart';
import 'package:frontend/widgets/game/game_over_listener.dart';

class GameArea extends StatelessWidget {
  const GameArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundWidget(),
        BirdWidget(),
        BarrierWidget(),
        GameOverListener() // 화면에 보이지 않는 위젯, 게임이 종료되면 다이얼로그
        // bird와 barrier에 따라 바뀌는 위젯이므로 이 위치
      ],
    );
  }
}
