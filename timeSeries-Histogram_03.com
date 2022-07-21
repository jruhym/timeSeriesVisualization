focus g1
world ymin histmin
world ymax histmax
yaxis tick major tickmajor
yaxis tick minor ticks nminorticks
yaxis label "\xc\0\c0\C\h{-0.4}\s2"
yaxis tick place both
xaxis label "Frequency"
xaxis tick minor ticks 4 
focus g0
world ymin histmin
world ymax histmax
yaxis tick major tickmajor
yaxis tick minor ticks nminorticks
yaxis label ""
yaxis tick place both
yaxis  ticklabel off
xaxis label "\1t\0 (ns)"
xaxis tick minor ticks 4 
redraw
