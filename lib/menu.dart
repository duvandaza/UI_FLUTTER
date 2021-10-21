import 'package:flutter/material.dart';

import 'package:ui_flutter/constants/constants.dart';
import 'package:ui_flutter/routes/routes.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('MENU', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: size.height * 0.04),),
      ),
      body: BodyMenu(),
    );
  }

}

class BodyMenu extends StatelessWidget {
  const BodyMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin, vertical: 14),
        child: GridView.builder(
          itemCount: pageRoute.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            childAspectRatio: 1.1
          ),
          itemBuilder: (context, index) => _CardMenu(data: pageRoute[index],),
        ),
      ),
    );
  }
}

class _CardMenu extends StatelessWidget {
  
  final Rutas data;
  final String ruta;

  const _CardMenu({Key key, this.data, this.ruta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => data.page));
        },
        
          child: Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                Icon( data.icon, size: 80, color: data.color, ),
                SizedBox(height: 10,),
                Text( data.titulo, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14), )
              ],
            ),
          ),
      ),
    );
  }
}