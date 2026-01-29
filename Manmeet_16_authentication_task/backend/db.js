import mongoose from "mongoose";

const connectDB = async () => {
    try {
        const db = await mongoose.connect(
            "mongodb://localhost:27017/auth_flutter",
        );
        console.log("Connected to MongoDB");
    } catch (error) {
        console.log(error);
    }
};

export default connectDB;
