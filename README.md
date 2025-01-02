# Rick and Morty Character Explorer

This project is a Flutter-based application that utilizes the **Rick and Morty API** to fetch and display characters from the popular TV show "Rick and Morty." It implements features such as infinite scrolling, a favorite character list, and detailed character profiles. The application uses **Provider** for state management to ensure smooth user interactions and maintainable code.

---

## Features

### 1. Fetch and Display Characters
- Characters are dynamically loaded from the Rick and Morty API.
- The app supports infinite scrolling, allowing users to seamlessly browse all available characters.

### 2. Add Characters to Favorites
- Users can double-tap a character card or click the heart icon to add the character to their favorites list.
- Favorite characters are visually highlighted and easily accessible.

### 3. View Detailed Character Profiles
- Tapping on a character displays detailed information about the character, including:
  - Name
  - Photo
  - Status
  - Gender
  - Species
  - Location
    
### 4. State Management
- The app uses **Provider** for state management, ensuring efficient data flow and UI updates.

---

## Project Structure

```
lib/
├── controller/
│   ├── controller.dart
├── model/
│   ├── user_model.dart
├── service/
│   └── user_service.dart
├── view/
│   ├── home_page.dart
│   ├── loading_widget.dart
│   └── login_view.dart
├── main.dart
```

### Key Components
- **controller/**: Contains logic to manage characters and favorites.
- **model/**: Data models representing characters, locations, and other API entities.
- **service/**: Handles API requests and responses.
- **view/**: UI components for displaying characters, details, and favorites.
- **main.dart**: Entry point of the application.

---

## Technologies Used

### Programming Language
- **Dart**: The primary language for Flutter application development.

### Framework
- **Flutter**: Used for building the cross-platform UI.

### State Management
- **Provider**: Efficient and lightweight state management.

### API
- **Rick and Morty API**: REST API used to fetch character data.

---

## How to Use
1. **Browse Characters**: Scroll through the list of characters loaded dynamically via infinite scroll.
2. **Add to Favorites**: Double-tap or click the heart icon to mark characters as favorites.
3. **View Details**: Tap a character to see detailed information about them.

---

## Contributions
Contributions are welcome! Feel free to submit a pull request or report issues.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Acknowledgments
- Thanks to the creators of the [Rick and Morty API](https://rickandmortyapi.com/) for providing a fantastic resource for developers.
- Inspired by the "Rick and Morty" TV series.
