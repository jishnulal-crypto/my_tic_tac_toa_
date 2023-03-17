import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/icon_widgets.dart';

class Draw_Screen extends StatelessWidget {
  const Draw_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CloseIcon(), RoundedIcon()],
          ),
        ],
      ),
    );
  }
}
