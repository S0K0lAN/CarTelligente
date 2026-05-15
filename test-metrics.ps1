$body = @{
    timestamp = 1714579200000
    rpm = 2500
    speed = 60
    throttle_pos = 45.5
    maf = 8.5
    accelerator_pos = 50
    short_fuel_trim = -2.5
    coolant_temp = 95
    intake_temp = 35
    long_fuel_trim = 1.2
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:3000/metrics" `
  -Method POST `
  -Headers @{"Content-Type"="application/json"} `
  -Body $body

Write-Host "Test metric sent successfully!"
