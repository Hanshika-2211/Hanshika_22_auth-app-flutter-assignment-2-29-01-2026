import 'package:flutter/material.dart';
import '../models/book.dart';

class ViewbookScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Book book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text("View Book Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Name: ${book.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Author: ${book.author}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Number of Copies: ${book.numberOfCopies}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Genre: ${book.genre}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Price: ${book.price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
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
  