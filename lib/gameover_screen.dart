import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Game Over",
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}
