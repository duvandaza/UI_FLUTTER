import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:ui_flutter/constants/constants.dart';
import 'package:ui_flutter/bagShop/widgets/body.dart';



class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed:()=> Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: kTextColor,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: kTextColor,
            ),
            onPressed: (){},
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      );
  }
}