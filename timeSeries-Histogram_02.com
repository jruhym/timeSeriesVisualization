# HISTOGRAM (set, bins, cumulative, normalize)
focus g1
histogram(graph[0].set[i],mesh(histmin,histmax,nbins),OFF,ON)
copy set[i] to set[i+1]
set[i].x = set[i+1].y
set[i].y = set[i+1].x
kill set[i+1]
set[i] dropline off
set[i] line color i + 6 
set[i] errorbar color i + 6
set[i] symbol fill color i + 6
set[i] symbol color i + 6
i = i + 1
autoscale
redraw
