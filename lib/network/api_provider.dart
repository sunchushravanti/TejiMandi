import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/utils/api_header_collection.dart';
import 'package:teji_mandi/utils/base_urls.dart';
import 'package:teji_mandi/utils/internet_connection.dart';
import 'package:teji_mandi/utils/message.dart';

class ApiProvider {
  late final InternetConnection _internetConnection = InternetConnection();
  late var _internetStatus;

  Future<NewsModel> getNewsModelList() async {
    try {
      bool isCacheExist =
          await APICacheManager().isAPICacheKeyExist("API_NEWS_DATA");
      if (isCacheExist == false) {
        Response? apiResponse;

        Map<String, String> headers = HeaderCollection().getApiHeader();

        _internetStatus = await _internetConnection.checkInternet();
        if (_internetStatus) {
          apiResponse = await get(BaseUrls().headlinesUrl, headers: headers);
          if (apiResponse.statusCode == 200) {
            APICacheDBModel cacheDBModel = APICacheDBModel(
                key: "API_NEWS_DATA", syncData: apiResponse.body);
            await APICacheManager().addCacheData(cacheDBModel);
            return NewsModel.fromJson(jsonDecode(apiResponse.body));
          } else {
            return NewsModel.withError(
                "${jsonDecode(apiResponse.body)["data"]["message"]}");
          }
        } else {
          return NewsModel.withError("Internet Connection Issue!");
        }
      } else {
        var cacheData = await APICacheManager().getCacheData("API_NEWS_DATA");
        return NewsModel.fromJson(jsonDecode(cacheData.syncData));
      }
    } on Exception {
      return NewsModel.withError("Something went wrong!");
    }
  }
}
