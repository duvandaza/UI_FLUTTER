import 'package:flutter/material.dart';

import 'package:ui_flutter/constants/constants.dart';


class CategoriasState extends StatefulWidget {

  @override
  __CategoriasStateState createState() => __CategoriasStateState();
}

class __CategoriasStateState extends State<CategoriasState> {

  List<String> categoria = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
        child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoria.length,
          itemBuilder: (context, index) => buildTextCategoria(index) ,
        ),
      ),
    );
  }

  Widget buildTextCategoria(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoria[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextoLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  } 
}