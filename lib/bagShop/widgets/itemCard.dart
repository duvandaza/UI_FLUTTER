import 'package:flutter/material.dart';

import 'package:ui_flutter/constants/constants.dart';
import 'package:ui_flutter/bagShop/models/producto.dart';


class ItemCard extends StatelessWidget {

  final Producto product;
  final Function press;

  const ItemCard({
    Key key,
    this.product,
    this.press
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextoLightColor),
            ),
          ),
          Text(
            '${product.precio}', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }
}