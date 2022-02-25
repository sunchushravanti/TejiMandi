//@dart=2.9
import 'package:flutter/material.dart';
import 'package:teji_mandi/bloc/news_model_bloc.dart';
import 'package:teji_mandi/constants.dart/constant_data.dart';
import 'package:teji_mandi/dynamic_widgets/card_widget.dart';
import 'package:teji_mandi/model/news_model.dart';
import 'package:teji_mandi/ui/detail_screen.dart';
import 'package:teji_mandi/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TejiMandi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MyHomePage> {
  final NewsDataBloc _newsDataBloc = NewsDataBloc();
  @override
  void initState() {
    super.initState();
    _newsDataBloc.fetchAllNewsData(context);
  }

  @override
  void dispose() {
    super.dispose();
    _newsDataBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.appBarColor,
          title: Center(child: Text(ConstantsData().headline)),
        ),
        backgroundColor: ColorUtils.aapBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
          stream: _newsDataBloc.fetchAllData,
          builder: (context, AsyncSnapshot<NewsModel> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          imageUrl: snapshot
                                              .data.articles[index].urlToImage,
                                          date: snapshot
                                              .data.articles[index].publishedAt,
                                          title: snapshot
                                              .data.articles[index].title,
                                          subTitle: snapshot
                                              .data.articles[index].author,
                                          description: snapshot
                                              .data.articles[index].description,
                                        )),
                              ),
                          child: CardWidget(
                            imageUrl: snapshot.data.articles[index].urlToImage,
                            date: snapshot.data.articles[index].publishedAt,
                            title: snapshot.data.articles[index].title,
                            subTitle: snapshot.data.articles[index].author,
                          ));
                    },
                  ))
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
