#!/bin/bash

# UICompose Release APK Build Script
# This script builds a release APK for the UICompose Android application

echo "Building UICompose Release APK..."
echo "================================="

# Check if gradlew exists and is executable
if [ ! -x "./gradlew" ]; then
    echo "Making gradlew executable..."
    chmod +x ./gradlew
fi

# Clean the project
echo "Cleaning project..."
./gradlew clean

# Build the release APK
echo "Building release APK..."
./gradlew assembleRelease

# Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo ""
    echo "Release APK locations:"
    find app/build/outputs/apk/release -name "*.apk" -type f 2>/dev/null || echo "APK files not found in expected location"
    echo ""
    echo "To install the APK on a device:"
    echo "adb install app/build/outputs/apk/release/app-release.apk"
    echo ""
else
    echo ""
    echo "❌ Build failed!"
    echo "Please check the error messages above and ensure all dependencies are available."
    echo ""
fi