import 'package:flutter/material.dart';
import 'package:project/draw_screen.dart';
import 'package:project/gameover_screen.dart';
import 'package:project/icon_widgets.dart';
import 'package:project/utils.dart';
import 'package:project/win_screen.dart';

Future<Widget?> showTiCTaCalert(
    {dynamic context, Widget? widget, Winner? winner}) async {
  return await showDialog<Widget>(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget!,
                if (winner!.computer != null) ...[
                  Text(winner.computer.toString())
                ] else if (winner.user != null) ...[
                  Text(winner.user.toString())
                ] else ...[
                  // ((){})()
                  Text(winner.draw.toString())
                ]
              ],
            ),
          ),
        );
      });
}
