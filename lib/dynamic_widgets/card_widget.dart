import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImageProvider;
import 'package:flutter/material.dart';
import 'package:teji_mandi/constants.dart/constant_data.dart';
import 'package:teji_mandi/dynamic_widgets/title_text.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String subTitle;
  String date;

  CardWidget(
      {Key? key,
      required this.imageUrl,
      required this.date,
      required this.subTitle,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (imageUrl != null && date != null && title != null && subTitle != null) {
      return Column(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1.0),
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(imageUrl),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TitleText(
                        title: title,
                        screenName: ConstantsData().homeScreen,
                      ),
                      SubTitleText(
                        title: subTitle,
                        date: date,
                        screenName: ConstantsData().homeScreen,
                      )
                    ],
                  ),
                ),
              )),
        ],
      );
    } else {
      return const Center();
    }
  }
}
