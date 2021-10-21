import 'package:flutter/material.dart';
import 'package:ui_flutter/bagShop/models/producto.dart';

import 'package:ui_flutter/constants/constants.dart';
import 'package:ui_flutter/bagShop/page/detalle_prodcuto.dart';
import 'package:ui_flutter/bagShop/widgets/categoria.dart';
import 'package:ui_flutter/bagShop/widgets/itemCard.dart';



class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        CategoriasState(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75
              ), 
              itemBuilder: (context, index) => ItemCard( 
                product: products[index],
                press: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetallePage(producto: products[index],))
                ),
              ), 
            ),
          )
        ),
      ],
    );
  }
}



