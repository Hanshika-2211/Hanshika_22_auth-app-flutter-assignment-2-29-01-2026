import mongoose from "mongoose";

const bookSchema = new mongoose.Schema({
    title: {
        type: String,
        required: [true, "Title is required"],
        trim: true
    },
    author: {
        type: String,
        required: [true, "Author is required"],
        trim: true
    },
    coverImage: {
        type: String,
        trim: true,
        default: ""
    },
    description: {
        type: String,
        trim: true,
        default: ""
    },
    genre: {
        type: String,
        trim: true,
        default: ""
    }
}, {
    timestamps: true
});

const Book = mongoose.model("Book", bookSchema);

export default Book;
