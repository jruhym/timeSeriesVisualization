# HISTOGRAM (set, bins, cumulative, normalize)
focus g1
histogram(graph[0].set[i + startIndex],mesh(histmin,histmax,nbins),OFF,ON)
copy set[i] to set[i+1]
set[i].x = set[i+1].y
set[i].y = set[i+1].x
kill set[i+1]
set[i] dropline off
colorIndex = (startColorIndex + i) % maxColorIndex
set[i] line color colorIndex 
set[i] errorbar color colorIndex
set[i] symbol fill color colorIndex
set[i] symbol color colorIndex
i = i + 1
autoscale
redraw
