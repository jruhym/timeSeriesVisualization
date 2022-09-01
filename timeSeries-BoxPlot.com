arrange plot 2x1
make cumulative normalized histogram for each of n time series into g1 given timeseries in g0 (sets 0--n-1)
extract medians of time series in g0 into g1 (set n) [median line]
create new set for each histogram y = -abs(y - 0.75) (sets n+1--2n)
extract X(max Y) (set 2n+1)
drop all but last n points since extraction gives you extracted feature for each set and only interested in that for 0.75-shifted histograms
change set type of medians (set[n]) to box-plot type. This is done in the Data-Set-Properties Dialog
set[n].y1 = s_.y [box top]
overwrite 0.75 shifted set y = -abs(y-0.25)
again extract X(max Y) droping points not associated with 0.25-shifted histograms (set 2n+2)
set[n].y2 = s_.y [box bottom]
set[n].y3 = s[n].y + 1.5 * (set[2n+1].y - s_.y) [wisker top]
set[n].y4 = s[n].y - 1.5 * (set[2n+1].y - s_.y) [wisker bottom]
split s[n] into individual sets and color each like associated time series.
scale y and x axes. x should go from 0 to n+1 and the lables on 0 and n should be removed. y should scale so that you can see the upper most top wisker and the lower most bottom wisker. It should also match the scale of the the g0.y axis.
