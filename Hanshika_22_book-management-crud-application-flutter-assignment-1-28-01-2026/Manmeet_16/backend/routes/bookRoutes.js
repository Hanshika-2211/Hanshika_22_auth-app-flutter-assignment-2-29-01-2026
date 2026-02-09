import express from "express";
import {
    createBook,
    getAllBooks,
    getBookById,
    updateBook,
    deleteBook
} from "../controllers/bookController.js";

const router = express.Router();

// POST - Create a new book
router.post("/", createBook);

// GET - Get all books
router.get("/", getAllBooks);

// GET - Get single book by ID
router.get("/:id", getBookById);

// PUT - Update book by ID
router.put("/:id", updateBook);

// DELETE - Delete book by ID
router.delete("/:id", deleteBook);

export default router;
