# digital filter would be prefered but it isn't available as a command so we'll used linear convolution.
linconv(set[i],set[iKernel])
s_.x=(s_.x+windowLeft)*(set[i].x[1]-set[i].x[0])
i = i + 1
redraw
updateall
