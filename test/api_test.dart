import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teji_mandi/bloc/news_model_bloc.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/network/api_provider.dart';
import 'package:teji_mandi/utils/api_header_collection.dart';
import 'package:teji_mandi/utils/base_urls.dart';

@GenerateMocks([http.Client])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MockApiProvider _mockApiProvider;
  late MockBuildContext _mockContext;
  late MockNewsModelBloc _mockNewsModelBloc;

  setUp(() {
    _mockApiProvider = MockApiProvider();
    _mockContext = MockBuildContext();
    _mockNewsModelBloc = MockNewsModelBloc();
  });
  group('getNewsResponse', () {
    test('returns news response when http response is successful',
        () async {
      NewsModel newsModel = NewsModel();
      Response apiResponse = await get(BaseUrls().headlinesUrl,
          headers: HeaderCollection().getApiHeader());
      if (apiResponse.statusCode == 200) {
        newsModel = NewsModel.fromJson(jsonDecode(apiResponse.body));
      }

      expect(newsModel.status, "ok");
      expect(newsModel.totalResults, 10);
      expect(newsModel.articles?.isNotEmpty, newsModel.articles?.isNotEmpty);
      expect(newsModel.articles?.first.source?.id,"techcrunch");
      expect(newsModel.articles?.first.source?.name,"TechCrunch");
      
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}

class MockApiProvider extends Mock implements ApiProvider {}

class MockNewsModelBloc extends Mock implements NewsDataBloc {}
