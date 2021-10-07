import 'package:flutter/material.dart';
import 'package:fly/pages/home/home.dart';
import 'package:fly/utility/navigate.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_controller.dart';
import 'utility/animation/animated_test.dart';
import 'utility/animation/rotate.dart';
import 'utility/responsive/ud_design.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false)
            .getIssue()
            .then((value) {
          pushReplacement(context: context, screen: Home());
        }).catchError((onError) {
          showDialog(
              context: context,
              builder: ((builder) {
                return AlertDialog(
                  content: Text("Something went wrong!"),
                  actions: [TextButton(onPressed: () {}, child: Text("Ok"))],
                );
              }));
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UdDesign.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Github",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: UdDesign.fontSize(30)),
            ),
          )
        ],
      ),
    );
  }
}
