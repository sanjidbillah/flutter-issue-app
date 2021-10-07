
import 'package:flutter/material.dart';

void push({BuildContext context, Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void pushReplacement({BuildContext context, Widget screen}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void pushAndRemoveUntil({BuildContext context, Widget screen}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false);
}

void pop({BuildContext context}) {
  Navigator.pop(context);
}

void popWith({BuildContext context, bool value}) {
  Navigator.pop(context, value);
}

