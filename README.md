# flutter-poc
Flutter POC

# Setting up Flutter SDK
https://flutter.dev/docs/get-started/install

# Steps to follow on above link
1. Fulfill System requirements
2. Get the Flutter SDK
3. Run flutter doctor
4. Update your path
5. Platform setup - Android setup

# Cloning repo
`git clone git@github.com:chqbook/flutter-poc.git`

# Go to my_app
`cd flutter-poc/my_app`

# Clean cache
`flutter clean`

# Running app (Make sure that you have opened emulator or connected actual device)
`flutter run`

# Runinng app on web
flutter run -d chrome

# Building APK for android
`flutter clean`
`flutter build apk --target-platform=android-arm64`

# Android build APK location
`build/app/outputs/apk/release/app-release.apk`

