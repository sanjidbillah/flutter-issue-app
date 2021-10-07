
import 'package:flutter/material.dart';
import 'package:fly/pages/home/home_controller.dart';
import 'package:fly/pages/home/issue_details/issue_details_controller.dart';
import 'package:fly/pages/theme/theme_controller.dart';
import 'package:fly/waiting_screen.dart';
import 'package:provider/provider.dart';

import 'utility/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeController(),
      ),
      ChangeNotifierProvider(
        create: (_) => HomeController(),
      ),
      ChangeNotifierProvider(
        create: (_) => IssueDetailsController(),
      ),
    ],
    child: Consumer<ThemeController>(
        builder: (_, controller, widget) => InitialScreen()),
  ));
}


class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    DioSingleton.instance.create();

    ThemeController.initTheme(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeController>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      home: WaitingScreen(),
    );
  }
}
