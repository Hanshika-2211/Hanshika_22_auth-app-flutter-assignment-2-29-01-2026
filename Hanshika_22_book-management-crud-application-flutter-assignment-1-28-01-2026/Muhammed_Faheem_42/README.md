# 📚 Book Management CRUD Application

A full-stack Book Management Application built with **Node.js**, **Express.js**, **Flutter**, and **MongoDB**. This application allows users to perform Create, Read, Update, and Delete (CRUD) operations on books.

---

## 📝 Project Description

This project demonstrates hands-on experience in full-stack application development. It includes:
- A **Backend** REST API server
- A **Frontend** mobile application
- A **Database** for persistent storage

All components are properly integrated to provide a seamless book management experience.

---

## 🛠️ Technology Stack

### 🔹 Backend
| Technology | Purpose |
|------------|---------|
| Node.js | Runtime Environment |
| Express.js | Web Framework |
| RESTful API | API Architecture |

### 🔹 Frontend
| Technology | Purpose |
|------------|---------|
| Flutter | Mobile Application Framework |
| HTTP Package | API Integration |

### 🔹 Database
| Technology | Purpose |
|------------|---------|
| MongoDB | NoSQL Database |
| Mongoose | ODM (Object Data Modeling) |

---

## 📂 Project Structure

```
book_management/
├── Backend/
│   ├── server.js          # Main server entry point
│   ├── db.js              # Database connection configuration
│   ├── package.json       # Node.js dependencies
│   ├── models/
│   │   └── Books.js       # Book schema/model
│   └── routes/
│       └── bookRouter.js  # API routes for books
│
└── Frontend/
    ├── lib/
    │   ├── main.dart              # App entry point
    │   ├── models/
    │   │   └── book.dart          # Book data model
    │   ├── screens/
    │   │   ├── book_list.dart     # Display all books
    │   │   ├── add_book.dart      # Add new book form
    │   │   ├── edit_book.dart     # Edit existing book
    │   │   └── view_book.dart     # View book details
    │   └── services/
    │       └── book_service.dart  # API service layer
    ├── pubspec.yaml               # Flutter dependencies
    └── ...
```

---

## 📚 Application Features

### 1️⃣ Book Data Fields

Each book contains the following details:

| Field | Description |
|-------|-------------|
| 📖 Book Title | Name of the book |
| ✍️ Author Name | Author of the book |
| 🏷️ Genre / Category | Book genre or category |
| 💰 Price | Price of the book |
| 📅 Published Year | Year the book was published |
| 🕐 Created Date | Record creation timestamp |

### 2️⃣ Backend API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/books` | Add a new book |
| `GET` | `/api/books` | Retrieve all books |
| `GET` | `/api/books/:id` | Retrieve a single book by ID |
| `PUT` | `/api/books/:id` | Update book details |
| `DELETE` | `/api/books/:id` | Delete a book |

#### Backend Features:
- ✅ MongoDB connected using Mongoose
- ✅ Proper project structure (models, routes)
- ✅ All API responses in JSON format

### 3️⃣ Frontend Screens

| Screen | Description |
|--------|-------------|
| 📄 Book List Screen | Display all books in a list |
| ➕ Add Book Screen | Form to add a new book |
| ✏️ Edit Book Screen | Update existing book details |
| 👁️ View Book Screen | View detailed book information |
| 🗑️ Delete Functionality | Option to remove a book |

#### Frontend Features:
- ✅ Proper integration with backend APIs
- ✅ Loading indicators and basic error handling
- ✅ Clean and user-friendly UI

---

## 🚀 Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v14 or higher)
- [MongoDB](https://www.mongodb.com/) (Local or Atlas)
- [Flutter](https://flutter.dev/) (Latest stable version)

### Backend Setup

1. Navigate to the Backend directory:
   ```bash
   cd Backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure MongoDB connection in `db.js`

4. Start the server:
   ```bash
   node server.js
   ```

   The server will run on `http://localhost:3000` (or configured port)

### Frontend Setup

1. Navigate to the Frontend directory:
   ```bash
   cd Frontend
   ```

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Update the API base URL in `lib/services/book_service.dart` to match your backend server

4. Run the application:
   ```bash
   flutter run
   ```

---

## 📸 Screenshots

*Add screenshots of your application here*

| Book List | Add Book | Edit Book | View Book |
|-----------|----------|-----------|-----------|
| ![List](assets/screenshots/list.png) | ![Add](assets/screenshots/add.png) | ![Edit](assets/screenshots/edit.png) | ![View](assets/screenshots/view.png) |

---

## 🎯 Learning Outcomes

After completing this project, you will be able to:

| Skill | Description |
|-------|-------------|
| 🔧 REST APIs | Build REST APIs using Node.js and Express.js |
| 💾 CRUD Operations | Perform CRUD operations using MongoDB |
| 📱 API Integration | Integrate Flutter applications with backend APIs |
| 🏗️ Full-Stack Architecture | Understand real-world full-stack application architecture |

---

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is for educational purposes.

---

## 👨‍💻 Author

**Muhammed Faheem**

*Software Engineer*

---

⭐ If you found this project helpful, please give it a star!
