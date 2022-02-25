// ignore_for_file: prefer_typing_uninitialized_variables
//@dart=2.9
import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/utils/api_header_collection.dart';
import 'package:teji_mandi/utils/internet_connection.dart';
import 'package:teji_mandi/utils/message.dart';

class ApiProvider {
  final InternetConnection _internetConnection = InternetConnection();
  final ToastMsg _toastMsg = ToastMsg();
  var _internetStatus;
  final String _baseURL =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8aa62ff6ba6b43a19f776420e27cea68";

  Future<NewsModel> getNewsModelList({BuildContext context}) async {
    try {
      var isCacheExist =
          await APICacheManager().isAPICacheKeyExist("API_NEWS_DATA");
      if (isCacheExist == false) {
        String path = _baseURL;
        Response apiResponse;

        Map<String, String> headers = HeaderCollection().getApiHeader();

        _internetStatus = await _internetConnection.checkInternet(context);
        if (_internetStatus) {
          apiResponse = await get(path, headers: headers);
          if (apiResponse.statusCode == 200) {
            APICacheDBModel cacheDBModel = APICacheDBModel(
                key: "API_NEWS_DATA", syncData: apiResponse.body);
            await APICacheManager().addCacheData(cacheDBModel);
            return NewsModel.fromJson(jsonDecode(apiResponse.body));
          } else {
            _toastMsg.getFailureMsg(
                context, "${jsonDecode(apiResponse.body)["data"]["message"]}");
            return NewsModel.withError(
                "${jsonDecode(apiResponse.body)["data"]["message"]}");
          }
        } else {
          return _toastMsg.getInternetFailureMsg(context);
        }
      } else {
        var cacheData = await APICacheManager().getCacheData("API_NEWS_DATA");
        return NewsModel.fromJson(jsonDecode(cacheData.syncData));
      }
    } on Exception {
      return _toastMsg.getSomethingWentWrong(context);
    }
  }
}
