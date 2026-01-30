# Authentication App

A full-stack authentication application with a Flutter frontend and Node.js/Express backend.

## Features

- **User Registration**: Sign up with name, username, email, and password
- **User Login**: Login with username/email and password
- **JWT Authentication**: Secure token-based authentication
- **Password Security**: Passwords hashed with bcrypt
- **Modern UI**: Clean and responsive Flutter interface

## Project Structure

```
auth_apis/
├── backend/          # Node.js/Express API server
│   ├── models/       # Mongoose models
│   ├── routes/       # API routes
│   ├── index.js      # Server entry point
│   └── .env          # Environment variables
│
└── frontend/         # Flutter mobile app
    ├── lib/
    │   ├── screens/  # UI screens (login, signup, home)
    │   ├── services/ # API services
    │   └── main.dart # App entry point
    └── pubspec.yaml  # Flutter dependencies
```

## Getting Started

### Backend Setup

1. Navigate to the backend directory:

   ```bash
   cd auth_apis/backend
   ```

2. Install Node.js dependencies:

   ```bash
   npm install
   ```

3. Make sure MongoDB is running:

   ```bash
   # On macOS with Homebrew
   brew services start mongodb-community

   # Or manually
   mongod
   ```

4. Start the backend server:

   ```bash
   npm start
   ```

   The API will run on `http://localhost:3000`

### Frontend Setup

1. Navigate to the frontend directory:

   ```bash
   cd auth_apis/frontend
   ```

2. Install Flutter dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## User Fields

The app collects the following user information:

- **Name**: Full name of the user
- **Username**: Unique username (lowercase, min 3 characters)
- **Email**: Valid email address (unique)
- **Password**: Minimum 6 characters

## API Endpoints

### Signup

- **POST** `/api/auth/signup`
- Creates a new user account

### Login

- **POST** `/api/auth/login`
- Authenticates user and returns JWT token

### Profile

- **GET** `/api/auth/profile`
- Returns user profile (requires authentication)

## Technologies Used

### Backend

- Node.js
- Express.js
- MongoDB with Mongoose
- JWT for authentication
- bcryptjs for password hashing

### Frontend

- Flutter
- Dart
- HTTP package for API calls
- SharedPreferences for token storage

## Notes

- Make sure to change the `JWT_SECRET` in `.env` for production use
- Update the API base URL in `auth_service.dart` if deploying to a different server
- For iOS simulator, use `http://localhost:3000`
- For Android emulator, use `http://10.0.2.2:3000`

## License

MIT
