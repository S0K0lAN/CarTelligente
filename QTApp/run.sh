#!/bin/bash

# Скрипт для запуска CarDiagnostics приложения
# Используется для удобного запуска из VS Code

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$PROJECT_DIR/out/build/GCC_Presset"
EXECUTABLE="$BUILD_DIR/CarDiagnostics"

# Проверяем, существует ли исполняемый файл
if [ ! -f "$EXECUTABLE" ]; then
    echo "Исполняемый файл не найден: $EXECUTABLE"
    echo "Сначала выполните сборку: cmake --workflow --preset debug"
    exit 1
fi

# Запускаем приложение с правильными переменными окружения
echo "Запуск CarDiagnostics..."
cd "$BUILD_DIR"
QT_QPA_PLATFORM=xcb "$EXECUTABLE" &
echo "Приложение запущено (PID: $!)"