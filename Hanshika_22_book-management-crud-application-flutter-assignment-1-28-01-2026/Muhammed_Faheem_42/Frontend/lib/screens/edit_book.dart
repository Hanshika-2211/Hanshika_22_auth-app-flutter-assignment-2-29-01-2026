import '../models/book.dart';
import 'package:flutter/material.dart';
import '../services/book_service.dart';

class EditbookScreen extends StatefulWidget {
  EditbookScreenState createState() => EditbookScreenState();
}

class EditbookScreenState extends State<EditbookScreen> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final authorController = TextEditingController();
  final numberOfCopiesController = TextEditingController();
  final genreController = TextEditingController();
  final priceController = TextEditingController();

  void handleSubmit() async {
    Book book = Book(
      id: idController.text,
      name: nameController.text,
      author: authorController.text,
      numberOfCopies: numberOfCopiesController.text,
      genre: genreController.text,
      price: priceController.text,
    );
    await BookService.updateBook(book);
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    Book book = ModalRoute.of(context)!.settings.arguments as Book;

    idController.text = book.id;
    nameController.text = book.name;
    authorController.text = book.author;
    numberOfCopiesController.text = book.numberOfCopies;
    genreController.text = book.genre;
    priceController.text = book.price;

    return Scaffold(
      appBar: AppBar(title: Text('Edit Book')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Book Name'),
          ),
          TextField(
            controller: authorController,
            decoration: InputDecoration(labelText: 'Author'),
          ),
          TextField(
            controller: numberOfCopiesController,
            decoration: InputDecoration(labelText: 'Number of Copies'),
          ),
          TextField(
            controller: genreController,
            decoration: InputDecoration(labelText: 'Genre'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          TextButton(
            child: Text('Update Book'),
            onPressed: handleSubmit,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.close),
      ),
    );
  }
}