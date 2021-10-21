import 'package:flutter/material.dart';
import 'package:ui_flutter/bagShop/models/producto.dart';

import 'package:ui_flutter/constants/constants.dart';


class ProductoTituloConImagen extends StatelessWidget {

  final Producto producto;

  const ProductoTituloConImagen({Key key, this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( 'Aristocratic Hand Bag',
           style: TextStyle(color:Colors.white),
          ),
          Text( producto.title,
            style: Theme.of(context).textTheme.headline4.copyWith(
             color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: kDefaultPaddin,),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan( text: 'Precio\n'),
                    TextSpan( text: '\$${producto.precio}',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Image.asset(producto.image,
                  fit: BoxFit.fill,
                )
              )
            ],
          )
        ],
      ),
    );
  }
}