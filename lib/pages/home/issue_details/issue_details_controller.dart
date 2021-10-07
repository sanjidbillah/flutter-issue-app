import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fly/api_services/api_services.dart';
import 'package:fly/models/issue_details_model.dart';

class IssueDetailsController with ChangeNotifier {
  ApiServices _apiServices = ApiServices();
  bool isLoading = true;
  var issueDetails = IssueDetailsModel();
  int status = 200;
  setStatus(value) {
    status = value;
    notifyListeners();
  }

  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future getIssueDetails({id}) async {
    await _apiServices.fetchIssueDetails(id: id).then((value) {
      issueDetails = issueDetailsModelFromJson(jsonEncode(value));
      isLoading = false;
      setStatus(200);
      return issueDetails;
    }).catchError((onError) {
      setStatus(400);
      throw onError;
    });
    notifyListeners();
  }
}
