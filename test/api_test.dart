// ignore_for_file: unused_local_variable
//@dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/network/api_provider.dart';

void main() {
  group('checking the API request and response', () {
    test('fetching the data when the http response is successful',
        () async {
       final NewsModel _newModelData= await ApiProvider().getNewsModelList();
     
      expect(_newModelData.status,"ok");
      expect(_newModelData.totalResults,13570);
      expect(_newModelData.articles,_newModelData.articles.isNotEmpty);
    });
  
    test('error message when http response is unsuccessful', () async {
        
      // Mock the API call to return an 
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(await ApiProvider().getNewsModelList(),
          'Failed to fetch number trivia');
    });
  });
}