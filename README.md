# TRIPU

TRIPU is a car rental with drivers mobile application built with Flutter. The app connects passengers who need a ride or a rental car with a driver, and drivers who offer their vehicles and time, within a single codebase supporting two distinct user flows.

## Overview

TRIPU offers two primary experiences inside one project:

- **Passenger flow** — request a ride, set pickup and drop-off points, negotiate fare, receive driver offers, and manage a digital wallet.
- **Driver flow** — go online/offline, browse and accept ride requests, propose custom fares, track pickup progress, and manage earnings.

The current stage of the project focuses on the UI layer: all screens are built and wired for navigation, with static placeholder data. Backend integration, authentication, and real-time logic are planned for a later stage.

## Features

- Three-screen onboarding flow with swipeable navigation
- Passenger home flow: fare selection, route preview, fare negotiation, driver offers, and wallet
- Driver home flow: ride requests list, request detail, custom fare entry, trip pickup, and wallet
- Shared, static navigation drawer for both user types
- Centralized icon and asset naming conventions for easy asset replacement
- Consistent design system based on a single primary brand color

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State management:** (to be defined as the project evolves)
- **Icon rendering:** flutter_svg
- **App icon generation:** flutter_launcher_icons

## Project Structure

```
lib/
  features/
    onboarding/
      screens/
    passenger/
      screens/
        home_map/
        confirm_fare/
        route_preview/
        searching/
        driver_offers/
        wallet/
    driver/
      screens/
        requests_list/
        request_detail/
        custom_fare/
        waiting_reply/
        trip_pickup/
        wallet/
  shared/
    widgets/
      custom_drawer.dart
      app_icon.dart
    constants/
      app_icon_names.dart
assets/
  images/
  icons/
```

## Getting Started

### Prerequisites

- Flutter SDK (stable channel)
- Dart SDK (bundled with Flutter)
- Android Studio or VS Code with the Flutter extension
- A configured Android/iOS emulator, or a physical device with USB debugging enabled

### Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd tripu_flutter
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Run the app:
   ```
   flutter run
   ```

## Assets

All images and icons are declared under `assets/images/` and `assets/icons/` in `pubspec.yaml`. Icon usage across the app is centralized through the `AppIconNames` constants class, so a given icon's underlying asset file can be replaced in one place without touching screen-level code.

## Building a Release APK

To generate a release build:

```
flutter build apk --release
```

The output APK will be located at:

```
build/app/outputs/flutter-apk/app-release.apk
```

To generate separate, smaller APKs per CPU architecture:

```
flutter build apk --release --split-per-abi
```

## App Icon

The app icon is generated using the `flutter_launcher_icons` package from a single source image. To regenerate platform-specific icons after updating the source image:

```
flutter pub run flutter_launcher_icons
```

## Roadmap

- Backend integration for authentication, rides, and payments
- Real-time driver/passenger matching
- Live map and location tracking
- Push notifications
- In-app switch between Passenger and Driver modes for the same account

## Status

This project is under active development. UI screens are implemented with static data; business logic and backend connectivity are in progress.
