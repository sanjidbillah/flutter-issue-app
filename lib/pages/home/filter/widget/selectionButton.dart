import 'package:flutter/material.dart';
import 'package:fly/utility/extension/widget.dart';
import 'package:fly/utility/responsive/ud_design.dart';

// ignore: must_be_immutable
class SelectionButton extends StatelessWidget {
  String name;
  Function onTap;
  Color color;
  SelectionButton({this.name, this.onTap, this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          color: color,
          child: Center(child: Text(name).paddingAll(UdDesign.pt(10)))),
    ).paddingSymmetric(horizontal: UdDesign.pt(1));
  }
}
