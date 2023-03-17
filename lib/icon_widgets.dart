import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - 100,
      height: MediaQuery.of(context).size.width / 4 - 100,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 10),
          shape: BoxShape.circle),
    );
  }
}

class CloseIcon extends StatelessWidget {
  const CloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - 100,
      height: MediaQuery.of(context).size.width / 4 - 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              color: Colors.black,
              width: (MediaQuery.of(context).size.width / 4 - 100) / 4,
              height: (MediaQuery.of(context).size.height / 4 - 100)),
          Container(
              color: Colors.black,
              width: (MediaQuery.of(context).size.width / 4 - 100),
              height: (MediaQuery.of(context).size.width / 4 - 100) / 4)
        ],
      ),
    );
  }
}
