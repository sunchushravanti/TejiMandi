import 'package:flutter/cupertino.dart';
import 'package:teji_mandi/constants.dart/constant_data.dart';
import 'package:teji_mandi/utils/colors.dart';

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  String title;
  String screenName;

  TitleText({Key? key, required this.title, required this.screenName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenName == ConstantsData().homeScreen
          ? const EdgeInsets.only(left: 12, right: 16, bottom: 0)
          : const EdgeInsets.only(left: 24, right: 24, bottom: 64),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            title,
            style:
                const TextStyle(fontSize: 20, color: ColorUtils.appTitleColor),
          )),
    );
  }
}

// ignore: must_be_immutable
class SubTitleText extends StatelessWidget {
  String title;
  String screenName;
  String date;
  SubTitleText(
      {Key? key,
      required this.title,
      required this.date,
      required this.screenName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenName == ConstantsData().homeScreen
          ? const EdgeInsets.only(left: 12, right: 16, bottom: 12, top: 12)
          : const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: screenName == ConstantsData().homeScreen
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, color: ColorUtils.appSubTitleColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            date,
            style: const TextStyle(
                fontSize: 12, color: ColorUtils.appSubTitleColor),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DescriptionText extends StatelessWidget {
  String title;

  DescriptionText({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 16, bottom: 12),
      child: Wrap(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, color: ColorUtils.appSubTitleColor),
          ),
        ],
      ),
    );
  }
}
