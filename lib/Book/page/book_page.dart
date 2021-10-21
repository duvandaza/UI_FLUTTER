import 'dart:math';

import 'package:flutter/material.dart';

import 'package:ui_flutter/Book/models/models_book.dart';

class BookPage extends StatefulWidget {

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {

  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  void _listener(){
    _notifierScroll.value = _controller.page;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() { 
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.45;
    final bookWidht = size.width * 0.6;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(bookAppBackground,
              fit: BoxFit.fill,
              )
            ),
            SizedBox(
              height: kToolbarHeight,
              child: AppBar(
                leadingWidth: 0,
                title: Text('Bookio', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            ),
            ValueListenableBuilder<double>(
              valueListenable: _notifierScroll,
              builder: (context, value, _){
                return PageView.builder(
                  itemCount: books.length,
                  controller: _controller,
                  itemBuilder: (context, index){
                    final book = books[index];
                    final porcentaje = index - value;
                    final rotation = porcentaje.clamp(0.0, 1.0);
                    final fixRotation = pow(rotation, 0.35);
                    return Padding(
                      padding: const EdgeInsets.all(23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  height: bookHeight,
                                  width: bookWidht,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20,
                                        offset: Offset(5.0,5.0),
                                        spreadRadius: 10,
                                      )
                                    ]
                                  ),
                                ),
                                Transform(
                                  alignment: Alignment.centerLeft,
                                  transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateY(1.8 * fixRotation)
                                  ..translate(-rotation * size.width * 0.8)
                                  ..scale(1 + rotation),
                                  child: Image.asset(
                                    book.image,
                                    fit: BoxFit.cover,
                                    height: bookHeight,
                                    width: bookWidht,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 90,),
                          Opacity(
                            opacity: 1 - rotation,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  'By ${book.author}',
                                  style: TextStyle(color: Colors.grey, fontSize: 20),
                                )
                              ],
                            ), 
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}