const express = require("express");
const cors = require("cors"); // Import CORS middleware
const app = express();
const PORT = 5001;

const mongoURI = process.env.MONGODB_URI || 'mongodb://mongodb:27017/testdb'; // Use your connection string
const mongoose = require("mongoose");


// Enable CORS for all origins
app.use(cors());

app.get("/api/data", (req, res) => {
	res.json({ message: "Hello from the Node.js backend!" });
});

app.listen(PORT, () => {
	console.log(`Server is running on port ${PORT}`);
});

// Connect to MongoDB
mongoose.connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log("MongoDB connected successfully");
    })
    .catch(err => {
        console.error("MongoDB connection error:", err);
    });
