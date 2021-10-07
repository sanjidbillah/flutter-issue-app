import 'package:fly/utility/dio.dart';

class ApiServices {
  // ignore: non_constant_identifier_names
  String BASE = "https://api.github.com/repos/flutter/flutter/";

  Future fetchIssue({page, isNewest = true, state}) async {
    int statusCode;
    var response;
    await getHttp(
            path: BASE +
                "issues?page=$page&direction=${isNewest ? "desc" : "asc"}&state=$state")
        .then((value) {
      statusCode = value.statusCode;
      response = value.data;
    }).catchError((onError) {
      response = onError.message;

      statusCode = onError.response.statusCode;
    });

    if (statusCode == 200 || statusCode == 201) {
      return response;
    } else {
      throw response;
    }
  }

  Future fetchIssueDetails({id}) async {
    int statusCode;
    var response;
    await getHttp(path: BASE + "issues/$id").then((value) {
      statusCode = value.statusCode;
      response = value.data;
    }).catchError((onError) {
      response = onError.message;

      statusCode = onError.response.statusCode;
    });

    if (statusCode == 200 || statusCode == 201) {
      return response;
    } else {
      throw response;
    }
  }
}
