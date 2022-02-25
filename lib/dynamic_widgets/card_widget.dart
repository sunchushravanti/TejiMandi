import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String description;
  String date;

  CardWidget(
      {Key? key,
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Center(
            child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
            child: SizedBox(
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
                      image: DecorationImage(
                          fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(imageUrl),
                          ),
                    ),
                    child: Stack(
                        alignment: Alignment.centerLeft,
                        children: const <Widget>[
                          Text("Welcome"),
                          Text("someText"),
                        ]),
                  ),
                )),
          ))
        : const Center();
  }
}
