import 'package:flutter/material.dart';
import 'package:fly/pages/home/home_controller.dart';
import 'package:fly/pages/home/issue_details/issue_details.dart';
import 'package:fly/pages/home/issue_details/issue_details_controller.dart';
import 'package:fly/pages/theme/theme_controller.dart';
import 'package:fly/utility/animation/animated_test.dart';
import 'package:fly/utility/animation/rotate.dart';
import 'package:fly/utility/navigate.dart';
import 'package:fly/utility/responsive/ud_design.dart';
import 'package:provider/provider.dart';

import 'filter/filter.dart';
import 'widget/issue_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        var provider = Provider.of<HomeController>(context, listen: false);
        if (provider.isHaveMore) {
          Provider.of<HomeController>(context, listen: false).fetchOldIssue();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeController>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              theme.toggleTheme();
            },
            icon: context.watch<ThemeController>().currentTheme == 'light'
                ? Icon(Icons.nights_stay_outlined)
                : Icon(Icons.wb_sunny_outlined),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: UdDesign.pt(25),
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: UdDesign.fontSize(16),
                      fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        RotateAnimatedText('Fly'),
                        RotateAnimatedText('Git'),
                      ]),
                ),
              ),
              Text(
                'hub',
                style: TextStyle(fontSize: UdDesign.fontSize(16)),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Filter();
                      });
                },
                icon: Icon(Icons.filter_alt_outlined))
          ],
        ),
        body: Consumer<HomeController>(
          builder: (ctx, controller, child) {
            // return Text(controller.page.toString());
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  controller: scrollController,
                  itemCount: controller.issueList.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        IssueItem(
                          onTap: () {
                            Provider.of<IssueDetailsController>(context,
                                    listen: false)
                                .setLoading(true);
                            push(
                                context: context,
                                screen: IssueDetails(
                                    issue: controller.issueList[index]));
                          },
                          issueItem: controller.issueList[index],
                        ),
                        if (index == controller.issueList.length - 1 &&
                            controller.isHaveMore)
                          CircularProgressIndicator()
                      ],
                    );    
                  });
            }
          },
        ));
  }
}
