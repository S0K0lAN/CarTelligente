const { Pool } = require('pg');

const connectionString = process.env.DATABASE_URL || 'postgres://postgres:postgres@localhost:5432/postgres';

const pool = new Pool({ connectionString });

async function testConnection() {
  try {
    const result = await pool.query('SELECT version()');
    console.log('✓ PostgreSQL connected successfully!');
    console.log('Version:', result.rows[0].version);
    
    // Попытаемся создать БД car_metrics если её нет
    const client = await pool.connect();
    try {
      await client.query('CREATE DATABASE car_metrics');
      console.log('✓ Database car_metrics created');
    } catch (err) {
      if (err.code === '42P04') {
        console.log('✓ Database car_metrics already exists');
      } else {
        throw err;
      }
    } finally {
      client.release();
    }
    
    process.exit(0);
  } catch (err) {
    console.error('✗ Connection failed:', err.message);
    console.error('\nПроверьте:');
    console.error('1. Запущена ли PostgreSQL?');
    console.error('2. Верный ли пароль для пользователя postgres?');
    console.error('3. Доступна ли PostgreSQL на localhost:5432?');
    process.exit(1);
  }
}

testConnection();
