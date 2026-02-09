const mongoose = require('mongoose');

const bookSchema = {
    name: {
        type: String,
        required: true,
    },
    author: {
        type: String,
        required: true,
        unique: true,
    },
    numberOfCopies: {
        type: String,
        required: true,
    },
    genre: {
        type: String,
        required: true,
    },
    price: {
        type: String,
        required: true,
    }
};

const Book = new mongoose.model('Book', bookSchema);
module.exports = Book;