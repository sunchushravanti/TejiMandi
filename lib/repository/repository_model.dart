import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/network/api_provider.dart';

class Repository {
  late BuildContext context;

  final ApiProvider _apiProvider = ApiProvider();

  Future<NewsModel> getNewsModelRepo() =>
      _apiProvider.getNewsModelList();
}
