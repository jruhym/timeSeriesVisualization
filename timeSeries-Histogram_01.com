define startIndex
define i
define histmin
define histmax
define nbins
define step
define tickmajor
define nminorticks
define firstColorIndex
define maxColorIndex
define startColorIndex
define colorIndex 

# ARRANGE(nrows, ncols, offset, hgap, vgap, hvinv, hinv, vinv) 
arrange(1,2,0.15,0.0,0.2,OFF,ON,OFF)
step = 1
histmin = -180
histmax = 180
nbins = (histmax - histmin) / step + 1
startIndex = 0
i = 0
tickmajor = 90
nminorticks = 5
# orange
startColorIndex = 6
maxColorIndex = 16
