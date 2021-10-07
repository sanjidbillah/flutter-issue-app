// import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:fly/models/issue_model.dart' as issueModel;
import 'package:fly/pages/home/issue_details/issue_details_controller.dart';
import 'package:fly/utility/custom_widget.dart';
import 'package:fly/utility/extension/widget.dart';
import 'package:fly/utility/responsive/ud_design.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class IssueDetails extends StatefulWidget {
  issueModel.IssueModel issue;
  IssueDetails({this.issue});

  @override
  _IssueDetailsState createState() => _IssueDetailsState();
}

class _IssueDetailsState extends State<IssueDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<IssueDetailsController>(context, listen: false)
          .getIssueDetails(id: widget.issue.number);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter/flutter${widget.issue.number}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.issue.title,
              style: TextStyle(
                  fontSize: UdDesign.fontSize(18), fontWeight: FontWeight.bold),
            ).paddingOnly(top: UdDesign.pt(5)),
            Container(
              color: widget.issue.state.index == 0
                  ? Colors.green[600].withOpacity(0.5)
                  : Colors.red[600].withOpacity(0.5),
              child: Text(
                widget.issue.state.index == 0 ? 'Open' : 'Closed',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).paddingAll(UdDesign.pt(10)),
            ),
            Divider(),
            Consumer<IssueDetailsController>(
              builder: (_, controller, child) {
                if (controller.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.status == 400) {
                  return Center(
                    child: Text("Something went wrong!"),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: UdDesign.pt(40),
                            width: UdDesign.pt(40),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(controller
                                        .issueDetails.user.avatarUrl))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.issueDetails.user.login,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: UdDesign.fontSize(16)),
                              ),
                              Text(controller.issueDetails.createdAt
                                  .toString()
                                  .split(" ")[0])
                            ],
                          ).paddingOnly(left: UdDesign.pt(10))
                        ],
                      ).paddingOnly(bottom: UdDesign.pt(20)),
                      Text(controller.issueDetails.body),
                      SizedBox(
                        height: UdDesign.pt(10),
                      ),
                      Divider(),
                      Wrap(
                        children: controller.issueDetails.labels.map((e) {
                          if (e.color == "ffffff") {
                            return SizedBox.shrink();
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: UdDesign.pt(5),
                                  bottom: UdDesign.pt(2)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(UdDesign.pt(7)),
                                  color: Color(int.parse("0xFF${e.color}")),
                                ),
                                child: Text(
                                  e.name,
                                  style: TextStyle(
                                      color: CustomWidget.colorDecission(
                                          context: context, value: e.color)),
                                ).paddingSymmetric(
                                    horizontal: UdDesign.pt(5),
                                    vertical: UdDesign.pt(2)),
                              ),
                            );
                          }
                        }).toList(),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Icon(Icons.comment),
                          Text(controller.issueDetails.comments.toString()),
                          Icon(Icons.add_reaction),
                          Text(controller.issueDetails.reactions.totalCount
                              .toString())
                        ],
                      )
                    ],
                  );
                }
              },
            ),
            SizedBox(
              height: UdDesign.pt(20),
            )
          ],
        ).paddingSymmetric(horizontal: UdDesign.pt(20)),
      ),
    );
  }
}
