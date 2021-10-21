import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/bagShop/models/producto.dart';


import 'package:ui_flutter/constants/constants.dart';
import 'package:ui_flutter/bagShop/widgets/color_size.dart';
import 'package:ui_flutter/bagShop/widgets/titulo_imagen.dart';

class DetallePage extends StatelessWidget {

  final Producto producto;
  const DetallePage({Key key, this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: producto.color,
      appBar: buildAppBar(context),
      body: Body(producto: producto,),
    );
  }
  
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: producto.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg', color: Colors.white),
        onPressed: ()=> Navigator.pop(context),
      ),
      actions: [
        IconButton(icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: (){}
        ),
        IconButton(icon: SvgPicture.asset('assets/icons/cart.svg'),
          onPressed: (){}
        ),
        SizedBox( width: kDefaultPaddin /2 )
      ],
    );
  }
}

class Body extends StatelessWidget {

  final Producto producto;

  const Body({Key key, this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox( height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.34),
                  padding: EdgeInsets.only(top: size.height * 0.14, left: kDefaultPaddin, right: kDefaultPaddin),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)
                    )
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(producto: producto),
                      Padding(
                        padding: EdgeInsets.symmetric( vertical: kDefaultPaddin ),
                        child: Text(
                          producto.descripcion,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                ProductoTituloConImagen(producto: producto)
              ],
            ),
          )
        ],
      ),
    );
  }
}



