import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fly/api_services/api_services.dart';
import 'package:fly/models/issue_model.dart';

class HomeController with ChangeNotifier {
  bool isLoading = true;
  int page = 1;
  bool isNewest = true;
  String state = 'open';
  ApiServices _apiServices = ApiServices();
  bool isHaveMore = true;

  var issueList = <IssueModel>[];

  setHaveMore(bool value) {
    isHaveMore = value;
    notifyListeners();
  }

  changeState(value) {
    state = value;
    notifyListeners();
  }

  Future fetchOldIssue() async {
    await _apiServices
        .fetchIssue(page: page + 1, isNewest: isNewest, state: state)
        .then((value) {
      var data = jsonDecode(jsonEncode(value));
      if (data.length != 30) {
        setHaveMore(false);
      }
      issueList.addAll(issueModelFromJson(jsonEncode(value)));

      isLoading = false;
      page += 1;
    }).catchError((onError) {});
    notifyListeners();
  }

  filterIssue({isNewestValue}) async {
    issueList = [];
    page = 1;
    isNewest = isNewestValue;

    isLoading = true;
    notifyListeners();
    await _apiServices
        .fetchIssue(page: page, isNewest: isNewestValue, state: state)
        .then((value) {
      issueList.addAll(issueModelFromJson(jsonEncode(value)));

      isLoading = false;

      notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }

  Future getIssue() async {
    await _apiServices
        .fetchIssue(page: page, isNewest: isNewest, state: state)
        .then((value) {
      issueList = issueModelFromJson(jsonEncode(value));
      isLoading = false;
      return issueList;
    }).catchError((onError) {
      throw onError;
    });
    notifyListeners();
  }
}
