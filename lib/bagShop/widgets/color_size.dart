import 'package:flutter/material.dart';
import 'package:ui_flutter/bagShop/models/producto.dart';

import 'package:ui_flutter/constants/constants.dart';


class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.producto,
  }) : super(key: key);

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Color'),
              Row(
                children: [
                  ColorDisponible(color: Color(0xFF356C95), isSeleccted: true,),
                  ColorDisponible(color: Color(0xFFf8C078),),
                  ColorDisponible(color: Color(0xFFA29B9B),),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text:'Size\n'),
                TextSpan(
                  text: '${producto.size} Cm',
                  style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold)
                )
              ]
            )
          )
        )
      ],
    );
  }
}

class ColorDisponible extends StatelessWidget {
  
  final Color color;
  final bool isSeleccted;
  const ColorDisponible({
    Key key,
    this.color,
    this.isSeleccted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSeleccted ? color : Colors.transparent)
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}