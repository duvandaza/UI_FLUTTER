import 'package:meta/meta.dart';

class Book {
  
  final String title;
  final String author;
  final String image;

  Book({
    @required this.title, 
    @required this.author, 
    @required this.image
  });

}

const _bookAppAsset = 'assets/Book';
final bookAppBackground = '$_bookAppAsset/Bg.png';

final books = [

  Book(
    title: 'Wink Poppy Midnight',
    author: 'April Genevieve Tucholke',
    image: '$_bookAppAsset/book1.jpg'
  ),
  Book(
    title: 'Walking with Miss Millie',
    author: 'Tamara Bundy',
    image: '$_bookAppAsset/book2.jpg'
  ),
  Book(
    title: 'Trio',
    author: 'Sarah Tolmie',
    image: '$_bookAppAsset/book3.jpg'
  ),
  Book(
    title: 'The Jungle Book',
    author: 'Rudyard Kiplling',
    image: '$_bookAppAsset/book4.jpg'
  ),
  Book(
    title: 'The makerof Swans',
    author: 'Paraig O\'Donnel',
    image: '$_bookAppAsset/book5.jpg'
  ),
];