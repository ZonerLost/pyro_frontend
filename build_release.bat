@echo off
echo ========================================
echo Flutter RELEASE Build Script
echo ========================================
echo.

echo [1/7] Cleaning Flutter build cache...
flutter clean

echo.
echo [2/7] Removing build directories...
if exist build rmdir /s /q build
if exist .dart_tool rmdir /s /q .dart_tool

echo.
echo [3/7] Removing pub cache lock...
if exist pubspec.lock del pubspec.lock

echo.
echo [4/7] Getting dependencies...
flutter pub get

echo.
echo [5/7] Cleaning Android build...
cd android
if exist build rmdir /s /q build
if exist .gradle rmdir /s /q .gradle
cd ..

echo.
echo [6/7] Building release APK...
flutter build apk --release

echo.
echo [7/7] Installing release APK...
flutter install --release

echo.
echo ========================================
echo Release Build Complete!
echo ========================================
echo.
echo APK Location: build\app\outputs\flutter-apk\app-release.apk
echo.
pause
