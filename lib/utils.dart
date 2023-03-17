class Winner {
  String? computer = "computer";
  String? user = "user";
  String? draw = "draw";

  Winner({this.computer, this.user, this.draw});

  factory Winner.winner({String? computer, String? user, String? draw}) {
    if (computer != null) {
      return Winner(computer: computer);
    } else if (user != null) {
      return Winner(user: user);
    } else {
      return Winner(draw: draw);
    }
  }
}

class Utils {
  static String computer = "computer";
  static String user = "user";
  static String draw = "draw";
}
