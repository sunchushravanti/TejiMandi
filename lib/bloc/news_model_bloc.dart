import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/repository/repository_model.dart';

class NewsDataBloc {
  final _repository = Repository();
  final _newsDataFetcher = PublishSubject<NewsModel>();

  Stream<NewsModel> get fetchAllData => _newsDataFetcher.stream;

  fetchAllNewsData() async {
    NewsModel newsDataModel = await _repository.getNewsModelRepo();
    _newsDataFetcher.sink.add(newsDataModel);
  }

  dispose() {
    _newsDataFetcher.close();
  }
}

final newsDatabloc = NewsDataBloc();
