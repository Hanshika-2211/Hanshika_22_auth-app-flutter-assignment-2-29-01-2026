import express from "express";
import cors from "cors";
import connectDB from "./db-connection.js";
import bookRoutes from "./routes/bookRoutes.js";

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Connect to Database
connectDB();

// Routes
app.use("/api/books", bookRoutes);

// Health check route
app.get("/", (req, res) => {
    res.json({
        success: true,
        message: "Book Management API is running"
    });
});

// Start server
app.listen(3000, () => {
    console.log("Server is running on port 3000");
});

export default app;
