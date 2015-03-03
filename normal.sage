# June-July 2014

def foo(sigma1, sigma2, n):
    D1 = RealDistribution('gaussian', sigma1)
    D2 = RealDistribution('gaussian', sigma2)

    # get some random elements, then add them...
    plot = []
    for i in range(n):
    	x = D1.get_random_element()
	plot.append((x,x+D2.get_random_element()))
    return plot
    # show(points(plot, rgbcolor=hue(h)))

# Acts as if each observation was the first observation
# The diffs settle down after a while
# Greater sigmaw makes the diff settle down faster (why?)
# Makes the variation of x increase faster?
# Greater sigmaz makes the diff settle down later (makes sense)
# Because after a while you know most of the variation is coming from x
# Sigmax increases exponentially
# After a while, perhaps the only variation in Y seems to come from x
# Todo: effect of a
def stupid_evolve(sigmaw, sigmaz, a, n):
    W = RealDistribution('gaussian', sigmaw)
    Z = RealDistribution('gaussian', sigmaz)
    sigmax = 1  # will track sigmax without regard to observations
    X = RealDistribution('gaussian', sigmax).get_random_element()
    real = []
    estimate = []
    diff = []
    sx = []
    sz2 = sigmaz*sigmaz
    for i in range(n):
    	real.append((i,X))
	Y = X + Z.get_random_element() # make the observation
	sx.append((i, sigmax))
	sx2 = sigmax*sigmax
	e = sx2/(sx2 + sz2)*Y # estimate X from Y
	estimate.append((i,e))
        # print X, e
        if i > 400:
            print i, X, e, X-e
	diff.append((i,X-e))
	sigmax = a*a*sigmax + sigmaw
	X = a*X + W.get_random_element() # do the step
    show(points(diff))
    # show(points(diff, rgbcolor=hue(0.6)) + points(sx, rgbcolor=hue(0)))
    # show(points(real, rgbcolor=hue(0.1)) + points(estimate, rgbcolor=hue(0)) + points(diff, rgbcolor=hue(0.6)), scale="semilogy")

# I should not be copy-and-pasting code
# This is too difficult
def holistic_evolve(sigmaw, sigmaz, a, n):
    W = RealDistribution('gaussian', sigmaw)
    Z = RealDistribution('gaussian', sigmaz)
    distx = (0, 1) # (mean, {std_dev/var})
    X = RealDistribution('gaussian', distx[1]).get_random_element()
    real = []
    estimate = []
    diff = []
    sx = []
    sz2 = sigmaz*sigmaz
    for i in range(n):
    	real.append((i,X))
	Y = X + Z.get_random_element()
	sx.append((i, distx[1]))
	


def main():
    # show(points(foo(1, 5, 100000), rgbcolor=hue(0.2)) + points(foo(1, 10, 100000), rgbcolor=hue(0.7)))
    stupid_evolve(1, 1, 1.1, 425)
