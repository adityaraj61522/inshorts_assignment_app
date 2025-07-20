# Flutter Movies App (TMDB)

A modern Flutter application that showcases movies using TMDB API with a Netflix-inspired UI, offline support, and seamless user experience.

## 🎬 Features

- **Home Screen**
  - Trending Movies Carousel
  - Now Playing Movies Section
  - Netflix-style UI with horizontal scrolling lists
  - Smooth animations and transitions

- **Search Experience**
  - Real-time search with debouncing(500ms)
  - Search results update as you type
  - Beautiful movie cards with posters and details
  - Loading states and error handling

- **Movie Details**
  - Comprehensive movie information
  - High-resolution backdrop images
  - Rating and release information
  - Sharing functionality with deep linking support

- **Offline Support**
  - Local data persistence using Hive
  - Works without internet connection
  - Automatic sync when online

- **Bookmarking**
  - Save favorite movies
  - Dedicated bookmarks page
  - Persistent across app restarts

## 🛠 Technical Implementation

### Architecture
- GetX for state management and navigation
- Clean Architecture principles
- Repository pattern for data handling

### API Integration
- TMDB API v3
- Retrofit for API calls
- Dio for HTTP client
- JSON serialization

### Local Storage
- Hive for offline data storage
- Efficient data caching
- Type adapters for movie models

### UI/UX
- Material Design components
- Custom animations
- Responsive layout
- Dark theme

## 📱 Screenshots

<img width="988" height="1852" alt="image" src="https://github.com/user-attachments/assets/161047d1-c792-4f0f-b37b-6b31f045fb66" />

<img width="1004" height="1822" alt="image" src="https://github.com/user-attachments/assets/75874147-3d2b-440c-9246-2cb5b75c431b" />

<img width="1006" height="1788" alt="image" src="https://github.com/user-attachments/assets/2f564fc5-d37c-4e77-a935-1308ab18523b" />


## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- TMDB API Key
- Android Studio / VS Code

### Installation

1. Clone the repository
```bash
git clone https://github.com/adityaraj61522/inshorts_assignment_app.git
```

2. Get dependencies
```bash
flutter pub get
```

3. Add your TMDB API key in `lib/common/api_service/dio_client.dart`

4. Run the app
```bash
flutter run
```

### Building

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```


---
