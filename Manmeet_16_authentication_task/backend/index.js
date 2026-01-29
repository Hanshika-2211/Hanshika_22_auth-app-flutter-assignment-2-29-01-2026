import express from "express";
import connectDB from "./db.js";
import userRouter from "./routes/userRouter.js";
import cors from "cors"

const app = express();

app.use(cors("*"));
app.use(express.json());

connectDB();

app.use("/auth", userRouter);

app.listen(3000, () => {
    console.log("Server is running on port 3000");
});