import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/icon_widgets.dart';
import 'package:project/utils.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({super.key});

  @override
  State<PlayGround> createState() => PlayGroundState();
}

class PlayGroundState extends State<PlayGround> {
  double? height;
  double? width;
  String state = "";
  int total_index = 9;
  List<int> user_input = [];
  List<int> computer_input = [];
  late Stream<int> userinputStream;
  late Stream<int> computerinputStream;
  String? current_input;
  int selectedindex = 0;
  late Stream<int> user_inputStream;

  @override
  void initState() {
    super.initState();
  }

  void box_selection(int index) {
    users_choice(index);
    Future.delayed(Duration(seconds: 2));
    // computers_choice(index);
  }

  void clear() {
    user_input.clear();
    computer_input.clear();
    setState(() {});
  }

  Widget draw_widget() {
    print(current_input);
    if (current_input == null) {
      return Container(
        width: 30,
        height: 50,
      );
    } else if (current_input == Utils.user) {
      return CloseIcon();
    } else {
      return RoundedIcon();
    }
  }

  void users_choice(int index) {
    print("here");
    if (user_input.length >= 9) {
      print("userinput full");
    } else {
      user_input.add(index);
    }
    current_input = Utils.user;
    setState(() {});
    print(user_input);
    // print(" user inputs $user_input");
  }

  void computers_choice(int index) {
    print("computer choice");
    List<int> remaining_in_order =
        []; // find the remaining elements for pc to choose

    for (var i = 1; i <= total_index; i++) {
      if (user_input.contains(i)) {
        null;
      } else {
        remaining_in_order.add(i);
      }
    }

    current_input = Utils.computer;
    computer_input.add(computer_choice_without_dup(remaining_in_order));
    setState(() {});
    print(computer_input);
  }

  int findLargest(List<int> list) {
    int maxvalue = list.first;
    list.forEach((element) {
      if (element == list.first) {
        null;
      } else if (element > maxvalue) {
        maxvalue = element;
      }
    });

    return maxvalue;
  }

  bool check_if_index_already_there(int index) {
    setState(() {});
    if (user_input.contains(index) || computer_input.contains(index)) {
      print(index);
      return true;
    } else {
      return false;
    }
  }

  int computer_choice_without_dup(List<int> remaining_order) {
    var random = Random();
    int random_selected_value = random.nextInt(findLargest(remaining_order));
    if (check_if_index_already_there(random_selected_value)) {
      computer_choice_without_dup(remaining_order);
    } else if (random_selected_value == 0) {
      computer_choice_without_dup(remaining_order);
    }
    setState(() {});
    return random_selected_value;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width / 3;
    height = MediaQuery.of(context).size.height / 3;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "TIC TAC TOE",
              style: TextStyle(fontSize: 50),
            ),
            // Row(
            //   children: [
            //     Text(
            //       "status :",
            //       style: TextStyle(fontSize: 50),
            //     ),
            //     Text(
            //       "$state",
            //       style: TextStyle(fontSize: 50),
            //     ),
            //   ],
            // ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  state = "play";
                  setState(() {});
                },
                icon: Icon(Icons.play_arrow),
                label: Text("play")),
            SizedBox(
              width: 50,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  state = "pause";
                  setState(() {});
                },
                icon: Icon(Icons.pause),
                label: Text("pause")),
            SizedBox(
              width: 50,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  clear();
                },
                icon: Icon(Icons.pause),
                label: Text("reset"))
          ],
        ),
        if (state == "play") ...[
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
                width: 500,
                height: 500,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("selected index $index");
                        box_selection(index + 1);
                        selectedindex = index;
                      },
                      child: Stack(
                        key: ValueKey(selectedindex),
                        alignment: Alignment.center,
                        children: [
                          index == selectedindex ? draw_widget() : SizedBox(),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                                border: Border(bottom: (() {
                              if (index == 6 || index == 7 || index == 8) {
                                return BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.none);
                              } else {
                                return BorderSide();
                              }
                            })(), left: (() {
                              if (index == 0 || index == 3 || index == 6) {
                                return BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.none);
                              } else {
                                return BorderSide();
                              }
                            })(), right: (() {
                              if (index == 2 || index == 5 || index == 8) {
                                return BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.none);
                              } else {
                                return BorderSide();
                              }
                            })(), top: (() {
                              if (index == 0 || index == 1 || index == 2) {
                                return BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.none);
                              } else {
                                return BorderSide();
                              }
                            })())),
                          )
                        ],
                      ),
                    );
                  }),
                )),
          ),
        ] else if (state == "pause") ...[
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              "paused",
              style: TextStyle(fontSize: 80),
            ),
          )
        ]
      ],
    );
  }
}
