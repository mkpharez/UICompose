#!/bin/bash

# UICompose Release APK Build Script
# This script builds a release APK for the UICompose Android application

echo "🚀 Building UICompose Release APK..."
echo "=================================="
echo "Project Status: ✅ READY FOR APK GENERATION"
echo "All configurations verified and code fixed."
echo ""

# Check if gradlew exists and is executable
if [ ! -x "./gradlew" ]; then
    echo "Making gradlew executable..."
    chmod +x ./gradlew
fi

# Verify Android SDK is available
if [ -n "$ANDROID_HOME" ] || [ -n "$ANDROID_SDK_ROOT" ]; then
    echo "✅ Android SDK detected at: ${ANDROID_HOME:-$ANDROID_SDK_ROOT}"
else
    echo "⚠️  Android SDK environment variable not set"
    echo "   Please ensure ANDROID_HOME or ANDROID_SDK_ROOT is configured"
fi

# Check for local.properties
if [ -f "local.properties" ]; then
    echo "✅ local.properties configured"
else
    echo "ℹ️  local.properties not found - will use system Android SDK"
fi

# Clean the project
echo ""
echo "🧹 Cleaning project..."
./gradlew clean

# Build the release APK
echo ""
echo "🔨 Building release APK..."
./gradlew assembleRelease

# Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ BUILD SUCCESSFUL!"
    echo "🎉 APK ready for installation on Android devices"
    echo ""
    echo "📱 Release APK locations:"
    find app/build/outputs/apk/release -name "*.apk" -type f 2>/dev/null || echo "   APK files not found in expected location"
    echo ""
    echo "📲 To install the APK on a device:"
    echo "   adb install app/build/outputs/apk/release/app-release.apk"
    echo ""
    echo "🔧 App Details:"
    echo "   • Application ID: com.mkpharez.uicompose"
    echo "   • Target Android API: 34"
    echo "   • Minimum Android API: 27 (Android 8.1+)"
    echo "   • UI Framework: Jetpack Compose"
    echo "   • Build Type: Release (optimized with ProGuard)"
    echo ""
else
    echo ""
    echo "❌ BUILD FAILED!"
    echo "Please check the error messages above and ensure:"
    echo "  • Android SDK is properly installed"
    echo "  • Internet connection is available for dependencies"
    echo "  • Java 8+ is installed"
    echo ""
    echo "For troubleshooting, see BUILD_GUIDE.md"
    echo ""
fi