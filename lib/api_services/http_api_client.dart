import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/app_config.dart';
import '../constants/app_exceptions.dart';
import '../repository/shared_preference_repository.dart';
import '../widgets/popup/show_loader.dart';
import '../widgets/popup/show_snack_bar.dart';

String? authToken;
List<int> statusCodes = [200, 400, 401, 422];
Map<String, String> authHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

Future<bool> checkInternetConnectivity() async {
  // var connectivityResult = await Connectivity().checkConnectivity();
  // print('connectivityResult $connectivityResult');

  return true;
  // return connectivityResult!=ConnectivityResult.none;
}

enum HttpMethod { post, patch, get, delete }

Future httpRequest({
  required String urlAddress,
  required Map<String, dynamic> requestBody,
  required HttpMethod httpMethod,
  bool isAuthApi = false,
  bool isTestApi = false,
  bool isShowLoader = true,
  bool isShowSnackBar = true,
  bool isShowSuccessSnackBar = false,
}) async {
  debugPrint(
      '============= start $httpMethod $urlAddress  \n $requestBody===============');
  try {
    if (isShowLoader) {
      showLoader();
    }
    if (await checkInternetConnectivity()) {
      Map<String, String> headers = {'Accept': 'application/json'};
      if (isAuthApi) {
        headers.addAll({
          'Content-Type': 'application/json',
        });
      }
      if (authToken == null) {
        authToken = await SharedPreferenceRepository.getToken();
      }
      if (authToken != null) {
        headers.addAll({'Authorization': 'Bearer $authToken'});
        authHeaders.addAll({'Authorization': 'Bearer $authToken'});
      }
      final uri = Uri.parse(AppConfig.apiAddress + urlAddress);
      late http.Response response;
      if (httpMethod == HttpMethod.post) {
        response = await http.post(uri,
            body: isAuthApi ? jsonEncode(requestBody) : requestBody,
            headers: headers);
      }
      if (httpMethod == HttpMethod.get) {
        response = await http.get(uri, headers: headers);
      }
      if (httpMethod == HttpMethod.patch) {
        response = await http.patch(uri,
            body: isAuthApi ? jsonEncode(requestBody) : requestBody,
            headers: headers);
      }
      if (httpMethod == HttpMethod.delete) {
        response = await http.delete(uri,
            body: isAuthApi ? jsonEncode(requestBody) : requestBody,
            headers: headers);
      }
      if (statusCodes.contains(response.statusCode)) {
        var responseBody = jsonDecode(response.body);
        debugPrint(
            '============= end $httpMethod  $urlAddress \n $responseBody======');
        if (isAuthApi &&
            responseBody['status'] != null &&
            responseBody['status'] == true) {
          if (isShowLoader) {
            hideLoader();
          }
          return responseBody;
        } else if (!isAuthApi &&
            responseBody['status'] != null &&
            responseBody['status']) {
          if (isShowLoader) {
            hideLoader();
          }
          if (isShowSuccessSnackBar && responseBody['message'] != null) {
            showSnackBar(responseBody['message'] ?? '');
          }
          return responseBody['data'] != null
              ? responseBody['data']
              : responseBody;
        } else if (isTestApi) {
          var responseBody = jsonDecode(response.body);
          return responseBody;
        } else {
          if (responseBody['message'] != null) {
            String message = responseBody['message'];

            if (responseBody['errors'] != null) {
              String errorMessage = '';
              try {
                Map<String, dynamic> errorsMap = responseBody['errors'];
                errorMessage = errorsMap.entries.first.value[0];
              } catch (e) {
                debugPrint('No error messages in api response');
              }
              throw Exception('$message $errorMessage');
            } else {
              throw Exception(message);
            }
          } else {
            throw AppExceptions.somethingWentWrong;
          }
        }
      } else if (response.statusCode == 403) {
        var responseBody = jsonDecode(response.body);
        throw responseBody['message'];
      } else {
        debugPrint(
            '============= fail statusCode  $httpMethod  $urlAddress  ${response.statusCode} ${response.body}');
        throw AppExceptions.somethingWentWrong;
      }
    } else {
      throw AppExceptions.noInternet;
    }
  } catch (e) {
    debugPrint(
        '============= fail $httpMethod  $urlAddress  api =============== \n error $e');

    String message = e.toString();

    if (isShowLoader) {
      hideLoader();
    }
    if (isShowSnackBar) {
      showSnackBar(message);
    }
    rethrow;
  }
}
