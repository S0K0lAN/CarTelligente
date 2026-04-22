# CarDiagnostics - Qt6 QML Мобильное приложение диагностики автомобиля

Профессиональное кросс-платформенное приложение для диагностики автомобиля на **Qt 6.7+** с использованием **QML** и **C++ backend**.

## 📁 Структура проекта

```
CarTellingente/
├── CMakeLists.txt                 # Конфигурация CMake для Qt 6
├── src/
│   ├── main.cpp                   # Точка входа приложения
│   └── data/                      # C++ backend (модели данных)
│       ├── enginedata.h/.cpp      # Параметры двигателя
│       ├── batterydata.h/.cpp     # Состояние АКБ
│       ├── resourcedata.h/.cpp    # Прогнозирование ресурса
│       ├── resourceitem.h/.cpp    # Элемент ресурса
│       ├── diagnosticcode.h/.cpp  # Диагностические коды
│       ├── anomalyitem.h/.cpp     # Элемент аномалии
│       └── dataprovider.h/.cpp    # Главный провайдер данных
└── qml/
    ├── resources.qrc              # Реестр QML файлов
    ├── Main.qml                   # Главное окно с BottomNavigationBar
    ├── NavButton.qml              # Компонент кнопки навигации
    ├── CustomProgressBar.qml      # Кастомный прогресс-бар с цветами
    ├── EnginePage.qml             # Вкладка "Двигатель"
    ├── EngineCard.qml             # Карточка параметра двигателя
    ├── BatteryPage.qml            # Вкладка "АКБ"
    ├── BatterySmallCard.qml       # Маленькая карточка АКБ
    ├── ResourcePage.qml           # Вкладка "Ресурс"
    ├── ResourceCard.qml           # Карточка компонента
    ├── CodesPage.qml              # Вкладка "Диагностические коды"
    ├── CodeStatCard.qml           # Карточка статистики кодов
    ├── CodeCard.qml               # Карточка кода
    ├── AnomaliesPage.qml          # Вкладка "Аномалии"
    ├── AnomalyStatCard.qml        # Карточка статистики аномалий
    └── AnomalyCard.qml            # Карточка аномалии
```

## 🎨 Функциональность

### 1️⃣ Вкладка "Двигатель" (EnginePage)
- Параметры двигателя Toyota Camry 2020
- Карточки:
  - Температура: 92°C (зелёный прогресс-бар)
  - Уровень масла: 85%
  - Обороты: 2400 об/мин
  - Давление турбины: 1.2 bar
- Статус "Все параметры в норме" (зелёная плашка)

### 2️⃣ Вкладка "АКБ" (BatteryPage)
- Большая синяя карточка: уровень заряда 78%
- Две маленькие карточки: напряжение 12.6V и здоровье 85%
- Подробная информация: ёмкость 60 Ah, температура 24°C

### 3️⃣ Вкладка "Ресурс" (ResourcePage)
- Текущий пробег: 85 230 км
- Фиолетовая карточка "Следующее обслуживание": 4000 км
- Список компонентов:
  - Тормозные колодки: 65% (оранжевый)
  - Масляный фильтр: 45% (зелёный)
  - Воздушный фильтр: 30% (зелёный)
  - Свечи зажигания: 80% (красный)

### 4️⃣ Вкладка "Коды" (CodesPage)
- Статистика: 2 активных кода, 1 решённый
- Активные коды: P0171, P0420
- Решённые коды: P0128
- Кнопка "Очистить решённые коды"

### 5️⃣ Вкладка "Аномалии" (AnomaliesPage)
- AI-мониторинг 24/7 (фиолетовая плашка)
- Статистика: 156 проверок, 3 аномалии
- Список аномалий:
  - Необычный расход топлива (жёлтый)
  - Вибрация двигателя (красный)
  - Изменение звука двигателя (жёлтый)

## 🛠️ Сборка и запуск через CMake Extension

### В VS Code с CMake Extension:

1. **Открыть проект** в VS Code
2. **Выбрать preset**: В нижней панели CMake выберите `GCC_Presset`
3. **Собрать**: Нажмите `Build` или `Ctrl+Shift+B`
4. **Запустить**: Используйте `./run.sh` или напрямую исполняемый файл

### Через командную строку:

#### Полная сборка и запуск (рекомендуется):
```bash
# Сборка Debug версии
cmake --workflow --preset debug

# Сборка Release версии
cmake --workflow --preset release

# Запуск
./run.sh
```

#### Пошагово:
```bash
# Конфигурация
cmake --preset GCC_Presset

# Сборка
cmake --build --preset GCC_Presset

# Запуск
QT_QPA_PLATFORM=xcb ./out/build/GCC_Presset/CarDiagnostics
```

### Доступные presets:

- **GCC_Presset** - Debug сборка
- **GCC_Presset_Release** - Release сборка
- **debug** (workflow) - полная сборка Debug
- **release** (workflow) - полная сборка Release

## 📁 Структура сборки

```
CarTellingente/
├── out/
│   └── build/
│       ├── GCC_Presset/          # Debug сборка
│       └── GCC_Presset_Release/  # Release сборка
│           └── CarDiagnostics    # Исполняемый файл
├── run.sh                        # Скрипт запуска
└── CMakePresets.json            # Настройки CMake
```

## 📱 Особенности

✅ **Адаптивный дизайн** - работает на мобильных экранах и настольных компьютерах
✅ **Material Design** - современный Material 3 стиль
✅ **BottomNavigationBar** - удобная навигация между 5 экранами
✅ **Цветные прогресс-бары** - зелёный/жёлтый/красный в зависимости от значения
✅ **C++ Backend** - полноценные данные в C++, доступные через QML
✅ **Русский язык** - весь интерфейс на русском
✅ **Мок-данные** - реалистичные тестовые значения
✅ **Кросс-платформенность** - работает на iOS, Android, Windows, macOS, Linux

## 🎯 Архитектура

### C++ Backend (DataProvider)
```cpp
DataProvider
├── EngineData (Q_PROPERTY bindable)
├── BatteryData (Q_PROPERTY bindable)
└── ResourceData (Q_PROPERTY bindable)
```

### QML Frontend (5 Экранов)
- **Main.qml** - главное окно с StackView и BottomNavigationBar
- **Экраны** - каждый экран реализован отдельным компонентом
- **Карточки** - переиспользуемые компоненты для представления данных

## 📝 Примеры использования

### Доступ к данным из QML

```qml
// Параметры двигателя
dataProvider.engine.temperature    // 92
dataProvider.engine.carModel       // "Toyota Camry 2020"

// Состояние АКБ
dataProvider.battery.chargeLevel   // 78
dataProvider.battery.voltage       // 12.6
```

### Прогресс-бар с цветом

```qml
CustomProgressBar {
    value: 0.85
    statusColor: "#4CAF50"  // зелёный
}
```

## 🚀 Следующие шаги

Для расширения функциональности:
1. Подключить реальные данные OBD-II через C++
2. Добавить сохранение истории данных (SQLite, JSON)
3. Реализовать локальные уведомления
4. Добавить графики и статистику
5. Интегрировать с облачным API

---

**Разработано на Qt 6.7+** с использованием QML и C++17
