import '../models/book.dart';
import '../services/book_service.dart';
import 'package:flutter/material.dart';

class AddbooksScreen extends StatefulWidget {
  AddbooksScreenState createState() => AddbooksScreenState();
}

class AddbooksScreenState extends State<AddbooksScreen> {
  final nameController = TextEditingController();
  final authorController = TextEditingController();
  final numberOfCopiesController = TextEditingController();
  final genreController = TextEditingController();
  final priceController = TextEditingController();

  void handleSubmit() async {
    Book book = Book(
      id: "",
      name: nameController.text,
      author: authorController.text,
      numberOfCopies: numberOfCopiesController.text,
      genre: genreController.text,
      price: priceController.text,
    );
    await BookService.addBook(book);
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD BOOK")),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Book Name"),
          ),
          TextField(
            controller: authorController,
            decoration: InputDecoration(labelText: "Author"),
          ),
          TextField(
            controller: numberOfCopiesController,
            decoration: InputDecoration(labelText: "Number of Copies"),
          ),
          TextField(
            controller: genreController,
            decoration: InputDecoration(labelText: "Genre"),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: "Price"),
          ),
          TextButton(onPressed: handleSubmit, child: Text("Add Book"))
        ],
      ),
    );
  }
}
