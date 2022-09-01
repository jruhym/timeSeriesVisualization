device "PNG" op "compression:9"
HARDCOPY DEVICE "PNG"
PAGE RESIZE 3300, 2550
DEVICE "PNG" DPI 300
PRINT TO "ToggleSwitchesChi2Histo-TimeSeries.png"
PRINT
