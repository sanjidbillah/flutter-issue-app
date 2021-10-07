import 'package:flutter/material.dart';
import 'package:fly/pages/home/filter/widget/radio_item.dart';
import 'package:fly/pages/home/home_controller.dart';
import 'package:fly/utility/extension/widget.dart';
import 'package:fly/utility/navigate.dart';
import 'package:fly/utility/responsive/ud_design.dart';
import 'package:provider/provider.dart';

import 'widget/selectionButton.dart';

// ignore: must_be_immutable
class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: UdDesign.pt(8),
          ),
          RadioItem(
            name: "Newest",
            icon: controller.isNewest
                ? Icons.radio_button_on_outlined
                : Icons.radio_button_off,
            color: controller.isNewest ? Colors.green : Colors.grey,
            onTap: () {
              if (controller.isNewest) {
                pop(context: context);
              } else {
                pop(context: context);
                controller.filterIssue(isNewestValue: true);
              }
            },
          ),
          RadioItem(
            name: "Oldest",
            color: controller.isNewest ? Colors.grey : Colors.green,
            icon: controller.isNewest
                ? Icons.radio_button_off
                : Icons.radio_button_on_outlined,
            onTap: () {
              if (controller.isNewest) {
                pop(context: context);
                controller.filterIssue(isNewestValue: false);
              } else {
                pop(context: context);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              state.length,
              (index) => Expanded(
                  child: SelectionButton(
                name: state[index],
                onTap: () {
                  pop(context: context);
                  controller.changeState(state[index].toString().toLowerCase());
                  controller.filterIssue(isNewestValue: controller.isNewest);
                },
                color: controller.state == state[index].toString().toLowerCase()
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              )),
            ),
          ).paddingSymmetric(horizontal: UdDesign.pt(20))
        ],
      ),
    );
  }

  List state = ['Open', 'Closed', 'All'];
}
