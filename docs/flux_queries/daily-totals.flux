// Daily totals of production and consumption
from(bucket: "low_rate")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  // Shift back by 12 hours so that the bar chart shows up mid-day instead of at midnight
  |> timeShift(duration: -12h)
  |> filter(fn: (r) => r["source"] == "power-meter")
  |> filter(fn: (r) => r["measurement-type"] == "consumption")
  |> filter(fn: (r) => r["interval"] == "24h")
  |> filter(fn: (r) => r["_field"] == "Wh")
  |> group(columns: ["_time"], mode:"by")
  |> sum(column: "_value")
  |> group()
  |> yield(name: "consumed")
