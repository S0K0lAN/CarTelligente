#  Qt for Android Configuration Guide

## Prerequisites
Before building for Android, ensure you have installed:

1. **Android NDK** (r26 or later)
   - Download from: https://developer.android.com/studio/releases/ndk
   - Default path: `/opt/android-ndk-r26`
   - Or set `CMAKE_ANDROID_NDK` in CMakePresets.json

2. **Qt 6.7+ for Android**
   - Download from: https://www.qt.io/offline-installers
   - Select Android in the installer
   - Default path: `/opt/Qt/6.7/Android`
   - Or configure `CMAKE_PREFIX_PATH` accordingly

3. **Java/JDK 11+**
   ```bash
   sudo dnf install java-11-openjdk-devel
   ```

4. **Gradle** (bundled with Qt or installed separately)

## Building for Android

### ARM64 (Recommended for modern devices)
```bash
cd /home/nout/Документы/work/C_C++/CarTellingente
cmake --preset Android_arm64_v8a
cmake --build --preset Android_arm64_v8a
```

### ARM32 (For compatible device support)
```bash
cmake --preset Android_armv7
cmake --build --preset Android_armv7
```

## Installation & Configuration

1. **Verify NDK path:**
   ```bash
   ls /opt/android-ndk-r26/toolchains/
   ```
   If NOT found, download NDK and update paths in CMakePresets.json

2. **Verify Qt for Android:**
   ```bash
   ls /opt/Qt/6.7/Android/lib/cmake/Qt6/
   ```
   If NOT found, download Qt for Android and update CMAKE_PREFIX_PATH

3. **Set environment variables (optional):**
   ```bash
   export ANDROID_NDK_ROOT=/opt/android-ndk-r26
   export Qt6_DIR=/opt/Qt/6.7/Android/lib/cmake/Qt6
   ```

## Output

Built APK will be located at:
- `out/build/Android_arm64_v8a/CarDiagnostics.apk`
- `out/build/Android_armv7/CarDiagnostics.apk`

## Troubleshooting

If build fails:
1. Check CMAKE_ANDROID_NDK path is correct
2. Verify Qt6 Android installation
3. Ensure minimum SDK version (21) matches your Qt build
4. Review detailed error log for missing dependencies

## Next Steps

After successful build:
1. Connect Android device with USB debugging enabled
2. Deploy APK: `adb install out/build/Android_arm64_v8a/CarDiagnostics.apk`
3. Run app on device
