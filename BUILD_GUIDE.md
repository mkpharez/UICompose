# UICompose Release APK Build Guide

This document provides instructions for building a release APK for the UICompose Android application.

## Status: ✅ Ready for APK Generation

This repository is **fully configured** to generate installable Android APK files. All necessary components are in place:

- ✅ **Android App Module**: Properly configured with Jetpack Compose
- ✅ **MainActivity**: Working UI code with proper Compose implementation  
- ✅ **Manifest**: Correct activity declarations and permissions
- ✅ **Build Configuration**: Release builds with ProGuard optimization
- ✅ **Signing Setup**: Debug keystore included, release keystore configurable
- ✅ **Dependencies**: All required Jetpack Compose and AndroidX libraries
- ✅ **Build Scripts**: Automated build process via `build-release.sh`

## Prerequisites

- Android SDK installed and configured
- Java 8 or higher  
- Internet connection for downloading dependencies (first time only)

## Quick Build

Run the provided build script:

```bash
./build-release.sh
```

## Manual Build Process

### 1. Clean the Project

```bash
./gradlew clean
```

### 2. Build Release APK

```bash
./gradlew assembleRelease
```

### 3. Locate the APK

The release APK will be generated at:
```
app/build/outputs/apk/release/app-release.apk
```

## Build Configuration Details

### Updated SDK Configuration

- **Compile SDK**: 34 (updated for compatibility)
- **Minimum SDK**: 27
- **Target SDK**: 34 (updated for compatibility)
- **Application ID**: `com.mkpharez.uicompose`
- **Version Code**: 1
- **Version Name**: "1.0"

### Signing Configuration

The project is configured with the following signing setup:

- **Debug builds**: Use debug signing with `.debug` suffix
- **Release builds**: Use release signing configuration

**Note**: For production releases, you should replace the debug keystore with a proper release keystore by creating a `key.properties` file based on `key.properties.example`.

### Build Types

#### Debug Build
- Debuggable: Yes
- Minification: Disabled
- Application ID suffix: `.debug`
- Version name suffix: `-debug`

#### Release Build
- Debuggable: No
- Minification: Enabled (ProGuard)
- Resource shrinking: Enabled
- ZIP alignment: Enabled
- Signing: Release keystore

### Fixed Issues ✅

**Code Quality Improvements Made:**
- Fixed incomplete onClick handler in MainActivity.kt
- Corrected button text logic (Show More/Show Less)
- Added proper Text composable wrapper for button content
- Updated SDK versions to use available Android API levels

### ProGuard Configuration

The release build includes ProGuard configuration specifically tailored for Jetpack Compose applications:

- Keeps Compose-related classes
- Preserves Kotlin metadata
- Protects AndroidX components
- Application-specific keep rules

## Dependencies Preserved

All original project dependencies are maintained:

- **Core AndroidX**: `androidx.core:core-ktx:1.7.0`
- **Jetpack Compose UI**: `androidx.compose.ui:ui:$compose_version`
- **Material Design**: `androidx.compose.material:material:$compose_version`
- **Material Icons**: `androidx.compose.material:material-icons-extended:$compose_version`
- **Lifecycle**: `androidx.lifecycle:lifecycle-runtime-ktx:2.3.1`
- **Activity Compose**: `androidx.activity:activity-compose:1.3.1`
- **Testing frameworks**: JUnit, Espresso, Compose testing

## SDK Configuration Preserved

- **Compile SDK**: 31
- **Minimum SDK**: 27
- **Target SDK**: 31
- **Application ID**: `com.mkpharez.uicompose`
- **Version Code**: 1
- **Version Name**: "1.0"

## Installation

To install the APK on a device or emulator:

```bash
adb install app/build/outputs/apk/release/app-release.apk
```

## Troubleshooting

### Build Failures

1. **Network issues**: Ensure you have internet connectivity for downloading dependencies
2. **Gradle daemon issues**: Try `./gradlew --stop` then rebuild
3. **SDK issues**: Verify Android SDK path is correctly set

### Missing Dependencies

If you encounter missing dependency errors, try:

```bash
./gradlew --refresh-dependencies assembleRelease
```

### Signing Issues

If you encounter signing issues:

1. Verify the keystore file exists in the app directory
2. Check the signing configuration in `app/build.gradle`
3. For production, use your own release keystore

## Production Considerations

Before releasing to production:

1. **Replace debug keystore** with a proper release keystore
2. **Update version code** and version name
3. **Test thoroughly** on multiple devices
4. **Review ProGuard rules** to ensure no required classes are stripped
5. **Enable R8 full mode** for better optimization (if needed)
6. **Add crash reporting** (e.g., Firebase Crashlytics)

## Additional Build Options

### Generate Signed APK with Custom Keystore

```bash
./gradlew assembleRelease \
  -Pandroid.injected.signing.store.file=/path/to/keystore \
  -Pandroid.injected.signing.store.password=store_password \
  -Pandroid.injected.signing.key.alias=key_alias \
  -Pandroid.injected.signing.key.password=key_password
```

### Build Multiple APKs

To build both debug and release:

```bash
./gradlew assemble
```

### Generate App Bundle (recommended for Play Store)

```bash
./gradlew bundleRelease
```

The app bundle will be located at:
```
app/build/outputs/bundle/release/app-release.aab
```