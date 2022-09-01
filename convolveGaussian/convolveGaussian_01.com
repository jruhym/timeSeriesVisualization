# given a times series
# Consider how wide you want the window to be in units of number of x values. 
# This should be narrow enough to capture underlying structure amid noise but wide enough to reduce noise. 
# Consider how wide you want the gaussian to be (std dev also in units of number of x values). 
# A large std dev will make the data on the wings of the window contribute more to the value of the current data point being laid down. 
# Too narrow of a std dev wastes time calculating wing contributions that barely contribute. 
define i
i = 0
define iKernel
iKernel = 100
define window
window = 500
define stdev
stdev = 100
define windowLeft
define windowRight
windowRight = window/2
windowLeft = -windowRight
window = window + 1
# via advice here https://plasma-gate.weizmann.ac.il/Grace/phpbb/viewtopic.php?f=1&t=913&hilit=missing+documentation
# found in source code https://github.com/fxcoudert/xmgrace/blob/master/src/pars.yacc
# also some help can be found here https://plasma-gate.weizmann.ac.il/Xmgr/doc/commands.html
set[iKernel] on
set[iKernel] length window
set[iKernel].x = mesh(windowLeft,windowRight,window)
set[iKernel].y = norm((set[iKernel].x-0)/stdev)/stdev
# renormalize since we might not have included enough of the gausian such that the area under it is 1 to machine precision.
set[iKernel].y = set[iKernel].y/ int(set[iKernel].x,set[iKernel].y) 
