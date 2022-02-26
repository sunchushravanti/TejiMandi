import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teji_mandi/constants.dart/constant_data.dart';
import 'package:teji_mandi/dynamic_widgets/title_text.dart';
import 'package:teji_mandi/utils/colors.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  String imageUrl;
  String title;
  String subTitle;
  String date;
  String description;

  DetailScreen(
      {Key? key,
      required this.imageUrl,
      required this.date,
      required this.subTitle,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.50),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(imageUrl),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 42, left: 24),
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.45),
                              radius: 25,
                              child: const Icon(
                                Icons.arrow_back,
                                color: ColorUtils.appBarTitleColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TitleText(
                          title: title,
                          screenName: ConstantsData().detailScreen,
                        ),
                        SubTitleText(
                          title: subTitle,
                          date: date,
                          screenName: ConstantsData().detailScreen,
                        ),
                        DescriptionText(
                          title: description,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
