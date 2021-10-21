import 'package:flutter/material.dart';

class Producto{

  final String image, title, descripcion;
  final int precio, size, id;
  final Color color;

  Producto({
    this.id,
    this.image,
    this.title,
    this.precio,
    this.descripcion,
    this.size,
    this.color
  });
  
}


List<Producto> products = [
  Producto(
      id: 1,
      title: "Office Code",
      precio: 234,
      size: 12,
      descripcion: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Producto(
      id: 2,
      title: "Belt Bag",
      precio: 234,
      size: 8,
      descripcion: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Producto(
      id: 3,
      title: "Hang Top",
      precio: 234,
      size: 10,
      descripcion: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Producto(
      id: 4,
      title: "Old Fashion",
      precio: 234,
      size: 11,
      descripcion: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Producto(
      id: 5,
      title: "Office Code",
      precio: 234,
      size: 12,
      descripcion: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Producto(
    id: 6,
    title: "Office Code",
    precio: 234,
    size: 12,
    descripcion: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
