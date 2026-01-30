# Authentication Backend

A Node.js/Express backend API for user authentication with MongoDB.

## Features

- User signup with name, username, email, and password
- User login with JWT authentication
- Password hashing with bcrypt
- Protected routes with JWT verification

## Prerequisites

- Node.js (v14 or higher)
- MongoDB (running locally or connection string)

## Installation

1. Install dependencies:

```bash
cd backend
npm install
```

2. Configure environment variables:
   Edit `.env` file and update:

- `MONGODB_URI` - Your MongoDB connection string
- `JWT_SECRET` - A secure secret key for JWT tokens
- `PORT` - Server port (default: 3000)

3. Start MongoDB:

```bash
# On macOS with Homebrew
brew services start mongodb-community

# Or manually
mongod
```

4. Start the server:

```bash
npm start

# Or for development with auto-reload
npm run dev
```

The server will run on http://localhost:3000

## API Endpoints

### POST /api/auth/signup

Create a new user account.

**Request Body:**

```json
{
  "name": "John Doe",
  "username": "johndoe",
  "email": "john@example.com",
  "password": "password123"
}
```

**Response:**

```json
{
  "message": "User created successfully",
  "token": "jwt_token_here",
  "user": {
    "id": "user_id",
    "name": "John Doe",
    "username": "johndoe",
    "email": "john@example.com"
  }
}
```

### POST /api/auth/login

Login with username/email and password.

**Request Body:**

```json
{
  "username": "johndoe", // Can be username or email
  "password": "password123"
}
```

**Response:**

```json
{
  "message": "Login successful",
  "token": "jwt_token_here",
  "user": {
    "id": "user_id",
    "name": "John Doe",
    "username": "johndoe",
    "email": "john@example.com"
  }
}
```

### GET /api/auth/profile

Get user profile (requires authentication).

**Headers:**

```
Authorization: Bearer <jwt_token>
```

**Response:**

```json
{
  "user": {
    "id": "user_id",
    "name": "John Doe",
    "username": "johndoe",
    "email": "john@example.com"
  }
}
```
