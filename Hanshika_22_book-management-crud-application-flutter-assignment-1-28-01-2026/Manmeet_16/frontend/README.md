# Book Management Flutter App

A Flutter application for managing books with full CRUD (Create, Read, Update, Delete) functionality.

## Features

- **Book List Screen**: Display all books with their details
- **Add Book Screen**: Form to add new books with validation
- **Edit Book Screen**: Update existing book details
- **Delete Functionality**: Remove books with confirmation dialog
- **Pull to Refresh**: Refresh the book list by pulling down
- **Error Handling**: Proper error messages and retry options
- **Loading States**: Visual feedback during API operations

## Prerequisites

- Flutter SDK (3.38.6 or higher)
- Dart SDK (3.10.7 or higher)
- A running backend API server (Node.js/Express)

## Installation

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
flutter pub get
```

## Configuration

Before running the app, configure the backend API URL in `lib/services/api_service.dart`:

- **iOS Simulator**: Use `http://localhost:3000`
- **Android Emulator**: Use `http://10.0.2.2:3000`
- **Real Device**: Use `http://YOUR_COMPUTER_IP:3000`

Example:
```dart
static const String baseUrl = 'http://localhost:3000/api';
```

## Running the App

### Option 1: Using Command Line

```bash
flutter run
```

### Option 2: Using VS Code
1. Open the project in VS Code
2. Press F5 or click "Run and Debug"
3. Select your target device

### Option 3: Using Android Studio
1. Open the project in Android Studio
2. Select your target device from the dropdown
3. Click the Run button

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   └── book.dart               # Book data model
├── providers/
│   └── book_provider.dart      # State management using Provider
├── screens/
│   ├── book_list_screen.dart   # Display all books
│   ├── add_book_screen.dart    # Add new book form
│   └── edit_book_screen.dart   # Edit book form
└── services/
    └── api_service.dart        # API communication layer
```

## API Endpoints Used

- `GET /api/books` - Fetch all books
- `GET /api/books/:id` - Fetch single book
- `POST /api/books` - Create new book
- `PUT /api/books/:id` - Update book
- `DELETE /api/books/:id` - Delete book

## Dependencies

- **flutter**: SDK
- **provider**: State management (^6.1.1)
- **http**: HTTP client (^1.1.0)
- **cupertino_icons**: iOS icons (^1.0.8)

## Usage

### Adding a Book
1. Tap the floating action button (+) on the home screen
2. Fill in the book details:
   - Title (required)
   - Author (required)
   - ISBN (required)
   - Published Year (required, must be a valid year)
3. Tap "Add Book"

### Editing a Book
1. Tap the edit icon (pencil) on any book card
2. Update the desired fields
3. Tap "Update Book"

### Deleting a Book
1. Tap the delete icon (trash) on any book card
2. Confirm deletion in the dialog
3. The book will be removed

### Refreshing the List
- Pull down on the book list to refresh

## Troubleshooting

### Connection Issues
- Ensure the backend server is running
- Check that the API URL is correctly configured
- Verify your device/emulator can reach the backend server
- For real devices, ensure both device and computer are on the same network

### Build Issues
```bash
flutter clean
flutter pub get
flutter run
```

## Testing

Run tests with:
```bash
flutter test
```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## License

This project is created for educational purposes.
