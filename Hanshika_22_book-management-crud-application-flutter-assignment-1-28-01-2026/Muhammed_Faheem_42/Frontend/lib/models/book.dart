// import 'package:flutter/material.dart';

class Book{
  String id;
  String name;
  String author;
  String numberOfCopies;
  String genre;
  String price;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.numberOfCopies,
    required this.genre,
    required this.price,
  });

  factory Book.fromJson(Map<String,dynamic> map){
    return Book(id: map['_id'], name: map['name'], author: map['author'], numberOfCopies: map['numberOfCopies'], genre: map['genre'], price: map['price']);
  }

  Map <String,dynamic> toJson(){
    return {
      'name':name,
      'author':author,
      'numberOfCopies':numberOfCopies,
      'genre':genre,
      'price':price,
    };
  }
}