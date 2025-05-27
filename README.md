# 📱 LocalService+ — A Mini Service Booking App

> A compact but powerful Flutter project demonstrating advanced app architecture, native integrations, and professional practices.

---

## 🚀 Overview

LocalService+ is a Flutter-based mobile application that allows users to discover, view, and book local professionals (electricians, cleaners, etc.). It demonstrates solid app architecture, state management with BLoC, and integrations with third-party services like Firebase and Google Maps.

This app was developed to showcase a full range of production-ready skills, from GitFlow to native code manipulation in Kotlin and Swift.

Figma model: https://www.figma.com/design/jQZzUGs0LTMAEZtpXtyv8l/-FREE--Beautilly---Salon---wellness-app-UI-kit--Community-?node-id=207-11308&m=draw

---

## 🧩 Features

- 📍 Browse nearby professionals with Google Maps
- 🔐 Authenticate using Firebase Auth (Google or email)
- 📅 Book services with availability and confirmation
- 🔔 Push notifications after booking
- 🌗 Dark/light mode with system detection
- ⭐ Rate services after completion

---

## 🛠️ Tech Stack

| Area                     | Technology                     |
|--------------------------|--------------------------------|
| **Frontend**             | Flutter                        |
| **State Management**     | BLoC                           |
| **Auth & Push**          | Firebase Auth & Firebase Cloud Messaging |
| **Map Integration**      | `google_maps_flutter`          |
| **Native Code**          | Kotlin (Android), Swift (iOS) |
| **Testing**              | `flutter_test`, `integration_test`, `flutter_driver` |
| **Containerization**     | Docker (backend/local env)     |

---


---

## ⚙️ Getting Started

1. Clone the repository  
2. Run `flutter pub get`  
3. Add your Firebase `google-services.json` and `GoogleService-Info.plist`  
4. Set up the `.env` file (or `flutter_dotenv`) with your API keys  
5. Run the app:
```json
flutter run
```
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test

# End-to-end test
flutter drive --target=integration_test/app_test.dart

