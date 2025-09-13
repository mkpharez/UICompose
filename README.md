# UICompose - Android Jetpack Compose Application

A modern Android application built with Jetpack Compose for creating beautiful user interfaces.

## 🚀 Building Release APK

This project is fully configured to build release APKs with all dependencies, SDK configurations, and project settings preserved.

### Quick Start

```bash
# Make the build script executable (if needed)
chmod +x build-release.sh

# Build release APK
./build-release.sh
```

### Manual Build Commands

```bash
# Clean the project
./gradlew clean

# Build release APK
./gradlew assembleRelease

# Find the generated APK
find app/build/outputs/apk/release -name "*.apk"
```

## 📦 Build Configuration

### Release Build Features

✅ **Code Minification**: Enabled with ProGuard  
✅ **Resource Shrinking**: Removes unused resources  
✅ **APK Signing**: Configured for release distribution  
✅ **ZIP Alignment**: Optimizes APK for faster loading  
✅ **Compose Optimization**: Specialized ProGuard rules for Jetpack Compose  

### Build Types

| Build Type | Debuggable | Minified | Signed | Application ID |
|------------|------------|----------|---------|----------------|
| **Debug** | ✅ Yes | ❌ No | Debug Key | `com.mkpharez.uicompose.debug` |
| **Release** | ❌ No | ✅ Yes | Release Key | `com.mkpharez.uicompose` |

## 🔧 Project Configuration

### SDK Versions
- **Compile SDK**: 31
- **Minimum SDK**: 27 (Android 8.1+)
- **Target SDK**: 31

### Dependencies (Preserved)
- **Jetpack Compose**: UI toolkit
- **Material Design**: Components and theming
- **AndroidX Core**: Compatibility library
- **Activity Compose**: Compose integration
- **Lifecycle**: Android lifecycle components

### Signing Configuration

The project includes a debug keystore for demonstration purposes. For production releases:

1. Generate a release keystore:
```bash
keytool -genkey -v -keystore release.keystore -alias release -keyalg RSA -keysize 2048 -validity 10000
```

2. Update `app/build.gradle` with your keystore details:
```gradle
signingConfigs {
    release {
        storeFile file('release.keystore')
        storePassword 'your_store_password'
        keyAlias 'release'
        keyPassword 'your_key_password'
    }
}
```

## 📱 APK Output

After building, the release APK will be located at:
```
app/build/outputs/apk/release/app-release.apk
```

### Installation

Install on a connected device or emulator:
```bash
adb install app/build/outputs/apk/release/app-release.apk
```

## 🔍 Verification

### APK Information
```bash
# Check APK details
aapt dump badging app/build/outputs/apk/release/app-release.apk

# Verify signing
jarsigner -verify -verbose -certs app/build/outputs/apk/release/app-release.apk
```

### APK Size Analysis
```bash
# Analyze APK contents
./gradlew assembleRelease && \
unzip -l app/build/outputs/apk/release/app-release.apk
```

## 🚀 Distribution Options

### Google Play Store (Recommended)
Build an App Bundle for smaller download sizes:
```bash
./gradlew bundleRelease
```
Upload the generated `.aab` file at `app/build/outputs/bundle/release/`

### Direct Distribution
Use the generated APK file for direct installation or distribution through other channels.

## 🛠️ Development Commands

```bash
# Build debug APK
./gradlew assembleDebug

# Run tests
./gradlew test

# Run on connected device
./gradlew installDebug

# Clean build
./gradlew clean build
```

## 📋 Troubleshooting

### Common Issues

**Build fails with dependency errors:**
```bash
./gradlew --refresh-dependencies assembleRelease
```

**Gradle daemon issues:**
```bash
./gradlew --stop
./gradlew assembleRelease
```

**Signing errors:**
- Verify keystore file exists
- Check signing configuration in `app/build.gradle`
- Ensure keystore passwords are correct

### Network Issues

If you encounter network connectivity issues during the first build:
1. Ensure stable internet connection
2. Check firewall/proxy settings
3. Try using a VPN if corporate network blocks repositories

## 📚 Additional Resources

- [BUILD_GUIDE.md](BUILD_GUIDE.md) - Detailed build instructions
- [Android Developer Guide](https://developer.android.com/)
- [Jetpack Compose Documentation](https://developer.android.com/jetpack/compose)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with both debug and release builds
5. Submit a pull request

---

**Built with ❤️ using Android Jetpack Compose**