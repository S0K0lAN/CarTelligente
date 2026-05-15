# Car Metrics Server

Express.js сервер для получения и сохранения метрик автомобиля в PostgreSQL базу данных.

## Требования

- Node.js
- Docker & Docker Compose (для запуска с БД)
- PostgreSQL

## Установка и запуск

### 1. С Docker Compose (рекомендуется)

```bash
docker-compose up
```

Это запустит сервер на порту 3000 и PostgreSQL на порту 5432.

### 2. Локально

```bash
npm install
npm start
```

**Примечание:** Убедитесь, что PostgreSQL запущен и доступен по адресу в `DATABASE_URL`.

## API

### POST /metrics

Отправляет метрики автомобиля для сохранения в БД.

**Тело запроса:**

```json
{
  "timestamp": 1714579200000,
  "rpm": 2500,
  "speed": 60,
  "throttle_pos": 45.5,
  "maf": 8.5,
  "accelerator_pos": 50,
  "short_fuel_trim": -2.5,
  "coolant_temp": 95,
  "intake_temp": 35,
  "long_fuel_trim": 1.2
}
```

**Параметры:**

- `timestamp` (BIGINT) - Unix timestamp в миллисекундах
- `rpm` (REAL) - Обороты двигателя
- `speed` (REAL) - Скорость автомобиля
- `throttle_pos` (REAL) - Положение дроссельной заслонки
- `maf` (REAL) - Массовый расход воздуха
- `accelerator_pos` (REAL) - Положение педали акселератора
- `short_fuel_trim` (REAL) - Краткосрочная коррекция топлива
- `coolant_temp` (REAL) - Температура охлаждающей жидкости
- `intake_temp` (REAL) - Температура впускного воздуха
- `long_fuel_trim` (REAL) - Долгосрочная коррекция топлива

**Пример запроса:**

```bash
curl -X POST http://localhost:3000/metrics \
  -H "Content-Type: application/json" \
  -d '{
    "timestamp": 1714579200000,
    "rpm": 2500,
    "speed": 60,
    "throttle_pos": 45.5,
    "maf": 8.5,
    "accelerator_pos": 50,
    "short_fuel_trim": -2.5,
    "coolant_temp": 95,
    "intake_temp": 35,
    "long_fuel_trim": 1.2
  }'
```

**Ответ:**

```json
{
  "message": "Metrics saved successfully",
  "id": 1
}
```

## Тестирование

### PowerShell (Windows)

```bash
.\test-metrics.ps1
```

### Bash (Linux/Mac)

```bash
bash test-metrics.sh
```

## Структура базы данных

Таблица `metrics`:

| Поле | Тип | Описание |
|------|-----|---------|
| id | SERIAL | ID записи |
| timestamp | BIGINT | Временная метка |
| rpm | REAL | Обороты двигателя |
| speed | REAL | Скорость |
| throttle_pos | REAL | Положение дроссельной заслонки |
| maf | REAL | Массовый расход воздуха |
| accelerator_pos | REAL | Положение акселератора |
| short_fuel_trim | REAL | Краткосрочная коррекция топлива |
| coolant_temp | REAL | Температура охлаждающей жидкости |
| intake_temp | REAL | Температура впускного воздуха |
| long_fuel_trim | REAL | Долгосрочная коррекция топлива |
| created_at | TIMESTAMP | Время создания записи |

## Docker

### Run with Docker Compose

1. Install Docker Desktop.

2. Start services:
   ```
   docker compose up --build
   ```

3. The app will be available on `http://localhost:3000`, and PostgreSQL on `localhost:5432`.

### Run app only

If you already have PostgreSQL running:

1. Build the image:
   ```
   docker build -t car-metrics-server .
   ```

2. Run the container:
   ```
   docker run -e DATABASE_URL=postgres://postgres:postgres@host.docker.internal:5432/car_metrics -p 3000:3000 car-metrics-server
   ```
