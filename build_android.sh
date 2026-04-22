#!/bin/bash

# Android build script for CarDiagnostics
# Requires: Android NDK, Qt for Android, and proper environment setup

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NDK_PATH="${ANDROID_NDK_ROOT:-/opt/android-ndk-r26}"
QT_ANDROID_PATH="${Qt6_DIR:-/opt/Qt/6.7/Android}"
BUILD_ARCH="${1:-arm64-v8a}"  # arm64-v8a or armeabi-v7a
OUTPUT_DIR="$PROJECT_DIR/out/build/Android_${BUILD_ARCH}"

echo "================================================"
echo "CarDiagnostics Android Build Script"
echo "================================================"
echo "NDK Path: $NDK_PATH"
echo "Qt Android Path: $QT_ANDROID_PATH"
echo "Target Architecture: $BUILD_ARCH"
echo "Build Directory: $OUTPUT_DIR"
echo "================================================"

# Verify NDK installation
if [ ! -d "$NDK_PATH" ]; then
    echo "❌ Error: Android NDK not found at $NDK_PATH"
    echo "Please install Android NDK or set ANDROID_NDK_ROOT environment variable"
    exit 1
fi

# Verify Qt for Android installation
if [ ! -d "$QT_ANDROID_PATH" ]; then
    echo "❌ Error: Qt for Android not found at $QT_ANDROID_PATH"
    echo "Please install Qt for Android or set Qt6_DIR environment variable"
    exit 1
fi

# Select preset based on architecture
if [ "$BUILD_ARCH" = "arm64-v8a" ]; then
    PRESET="Android_arm64_v8a"
elif [ "$BUILD_ARCH" = "armeabi-v7a" ]; then
    PRESET="Android_armv7"
else
    echo "❌ Error: Unknown architecture '$BUILD_ARCH'"
    echo "Supported: arm64-v8a, armeabi-v7a"
    exit 1
fi

echo "✓ Prerequisites verified"
echo ""

# Configure
echo "📋 Configuring CMake for $BUILD_ARCH..."
cd "$PROJECT_DIR"
cmake --preset "$PRESET" 2>&1 | tail -20

if [ $? -ne 0 ]; then
    echo "❌ CMake configuration failed"
    exit 1
fi

echo "✓ CMake configuration complete"
echo ""

# Build
echo "🔨 Building for $BUILD_ARCH..."
cmake --build --preset "$PRESET" -j$(nproc) 2>&1 | tail -30

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

echo "✓ Build complete"
echo ""

# Summary
echo "================================================"
echo "✅ Android build successful!"
echo "================================================"
echo "Output directory: $OUTPUT_DIR"
if [ -f "$OUTPUT_DIR/CarDiagnostics.apk" ]; then
    echo "APK file: $OUTPUT_DIR/CarDiagnostics.apk"
    ls -lh "$OUTPUT_DIR/CarDiagnostics.apk"
else
    echo "Note: APK generation requires gradle integration"
    echo "Check build output directory for compiled objects"
fi
echo "================================================"
