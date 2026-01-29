import express from "express";
import bcrypt from "bcryptjs";
const router = express.Router();
import User from "../models/User.js";
import jwt from "jsonwebtoken";

router.post("/register", async (req, res) => {
    try{
        const {name, username, email, password} = req.body;

        const existingUsername = await User.findOne({username: username});

        if(existingUsername)
        {
            return res.status(400).json({message: "Username already exists"});

        }

        const existingEmail = await User.findOne({email:email});
        if(existingEmail)
        {
            return res.status(400).json({message:"Email already exists"});

        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = {
            name,
            username,
            email,
            password: hashedPassword
        }

        const user = new User(newUser);
        await user.save();

        res.status(201).json({message: "User registered successfully"});

    }
    catch(error){
        console.log(error);
        res.status(500).json({message: "Internal server error"});
    }
});

router.post("/login", async (req, res) => {
    try{
        const {username, password} = req.body;

        const user = await User.findOne({username:username});

        if(!user)
        {
            return res.status(400).json({message: "Invalid Username"});
        }

        const isMatch = await bcrypt.compare(password,user.password);

        if(!isMatch)
        {
            return res.status(400).json({message: "Invalid password"})
        }

        const token = jwt.sign({userId: user._id, name: user.name, username: user.username, email: user.email},
            "ITM",
            {expiresIn: "1h"}
        );

        res.status(200).json({message: "Login successful", token});

    }catch(error)
    {
       console.log(error);
       res.status(500).json({message: "Internal server error"}); 
    }
});

export default router;
