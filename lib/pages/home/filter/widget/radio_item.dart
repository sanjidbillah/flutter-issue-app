import 'package:flutter/material.dart';
import 'package:fly/utility/extension/widget.dart';
import 'package:fly/utility/responsive/ud_design.dart';

// ignore: must_be_immutable
class RadioItem extends StatelessWidget {
  String name;
  IconData icon;
  Color color;
  Function onTap;
  RadioItem({this.name, this.icon, this.color = Colors.grey, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: UdDesign.fontSize(17)),
          ),
          Icon(
            icon,
            color: color,
          )
        ],
      ).paddingSymmetric(horizontal: UdDesign.pt(20),vertical: UdDesign.pt(10)),
    );
  }
}
