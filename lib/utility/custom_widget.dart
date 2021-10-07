import 'package:flutter/material.dart';

class CustomWidget {
  static String convertDateToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      if (diff.inDays > 31 && diff.inDays < 366) {
        return '${diff.inDays ~/ 30}mo';
      } else if (diff.inDays > 366) {
        return '${diff.inDays ~/ 365}y';
      } else {
        return '${diff.inDays}d';
      }
    } else if (diff.inHours >= 1) {
      return '${diff.inHours}h';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes}m';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds}s';
    } else {
      return 'just now';
    }
  }

  static loader(context) {
    showDialog(
        // barrierDismissible: f,
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Wrap(
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          );
        });
  }

 static showsnackBar({context, text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

 static  colorDecission({context, value}) {
    if (value == "000000" ||
        value == "003570" ||
        value == "770000" ||
        value == "550000" ||
        value == "e11d21" ||
        value == "ff28a5" ||
        value == "5319e7" ||
        value == "006b75" ||
        value == "900000" ||
        value == "330000" ||
        value == "931449") {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
