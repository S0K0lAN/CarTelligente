const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = process.env.PORT || 8000;
const connectionString = process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/car_metrics';

app.use(express.json());

const pool = new Pool({ connectionString });

async function ensureSchema() {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS metrics (
      id SERIAL PRIMARY KEY,
      timestamp BIGINT NOT NULL,
      rpm REAL,
      speed REAL,
      throttle_pos REAL,
      maf REAL,
      accelerator_pos REAL,
      short_fuel_trim REAL,
      coolant_temp REAL,
      intake_temp REAL,
      long_fuel_trim REAL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
  `);
}

async function initDb(retries = 10, delayMs = 2000) {
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      await pool.query('SELECT 1');
      await ensureSchema();
      console.log('Connected to PostgreSQL and ensured metrics table exists.');
      return;
    } catch (err) {
      console.error(`PostgreSQL connection attempt ${attempt} failed:`, err.message);
      if (attempt === retries) {
        throw err;
      }
      await new Promise((resolve) => setTimeout(resolve, delayMs));
    }
  }
}

app.post('/metrics', async (req, res) => {
  const {
    timestamp,
    rpm,
    speed,
    throttle_pos,
    maf,
    accelerator_pos,
    short_fuel_trim,
    coolant_temp,
    intake_temp,
    long_fuel_trim
  } = req.body;

  try {
    const result = await pool.query(
      `INSERT INTO metrics (timestamp, rpm, speed, throttle_pos, maf, accelerator_pos, short_fuel_trim, coolant_temp, intake_temp, long_fuel_trim)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING id`,
      [timestamp || Date.now(), rpm, speed, throttle_pos, maf, accelerator_pos, short_fuel_trim, coolant_temp, intake_temp, long_fuel_trim]
    );

    res.status(200).json({ message: 'Metrics saved successfully', id: result.rows[0].id });
  } catch (err) {
    console.error('Error inserting data:', err.message);
    res.status(500).json({ error: 'Failed to save metrics' });
  }
});

(async () => {
  try {
    await initDb();
    app.listen(port, () => {
      console.log(`Server running on port ${port}`);
    });
  } catch (err) {
    console.error('Unable to start server due to database initialization failure:', err.message);
    process.exit(1);
  }
})();