import 'package:flutter/material.dart';
import 'package:fly/models/issue_model.dart';
import 'package:fly/pages/theme/theme_controller.dart';
import 'package:fly/utility/constants/keys.dart';
import 'package:fly/utility/custom_widget.dart';
import 'package:fly/utility/extension/widget.dart';
import 'package:fly/utility/responsive/ud_design.dart';
import 'package:fly/utility/shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class IssueItem extends StatelessWidget {
  IssueModel issueItem;
  Function onTap;
  IssueItem({this.issueItem, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.play_circle_outline_outlined,
                    color:
                        issueItem.state.index == 0 ? Colors.green : Colors.red,
                  ).paddingOnly(right: UdDesign.pt(10)),
                  Text(
                    "flutter #${issueItem.number}",
                    style: TextStyle(fontSize: UdDesign.fontSize(16)),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(CustomWidget.convertDateToAgo(issueItem.createdAt)),
              )
            ],
          ).paddingSymmetric(horizontal: UdDesign.pt(10)),
          Text(
            issueItem.title.trim(),
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: UdDesign.fontSize(17)),
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).paddingSymmetric(horizontal: UdDesign.pt(41)),
          Wrap(
            children: issueItem.labels.map((e) {
              if (e.color == "ffffff") {
                return SizedBox.shrink();
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                      right: UdDesign.pt(5), bottom: UdDesign.pt(2)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(UdDesign.pt(7)),
                      color: Color(int.parse("0xFF${e.color}")),
                    ),
                    child: Text(
                      e.name,
                      style: TextStyle(
                          color: CustomWidget.colorDecission(
                              context: context, value: e.color)),
                    ).paddingSymmetric(
                        horizontal: UdDesign.pt(5), vertical: UdDesign.pt(2)),
                  ),
                );
              }
            }).toList(),
          ).paddingSymmetric(horizontal: UdDesign.pt(41)),
          Divider()
        ],
      ).paddingSymmetric(vertical: UdDesign.pt(5)),
    );
  }
}
