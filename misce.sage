# CS70 fa14 hw1
def main(up_to=30):
    plot = [(1,1/2),(2,5/6),(3,1)]
    for n in range(4, up_to):
    	onebefore=plot[n-2][1]
	twobefore=plot[n-3][1]
    	plot.append((n, onebefore + (onebefore-twobefore)*(twobefore-plot[n-4][1])))
    print(plot[up_to-2])
    show(points(plot))

# log base 2 of phi
def log2phi():
    return log((1==x^-1+x^-2).find_root(1,2), 2)    

def sphere():
    t = var('t')
    p = var('p')
    f = sin(p)^2*cos(t)^2 + sin(p)^2*sin(t)^2 + cos(p)^2
    ii = integral(f, t, 0, 2*pi)
    print ii
    oi = integral(ii, p, 0, pi)
    print oi

def control_sphere():
    x = var('x')
    y = var('y')
    z = var('z')
    t = var('t')
    p = var('p')
    f = (z - z*(cos(p))^2 - x*cos(p)*sin(p)*cos(t) - y*cos(p)*sin(p)*sin(t))^2 + (x - z*cos(p)*sin(p)*cos(t) - x*(sin(p))^2*(cos(t))^2 - y*(sin(p))^2*sin(t)*cos(t))^2 + (y - z*cos(p)*sin(p)*sin(t) - x*(sin(p))^2*sin(t)*cos(t) - y*(sin(p))^2*(cos(t))^2)^2
    ii = integral(f, t, 0, 2*pi)
    print ii
    oi = integral(ii*sin(p), p, 0, pi)
    print oi

def cs_mini():
    x = var('x')
    y = var('y')
    z = var('z')
    t = var('t')
    p = var('p')
    # r = z*cos(p) + x*sin(p)*cos(t) + y*sin(p)*sin(t)
    r = var('r')
    f = (z - r*cos(p))^2 + (x - r*sin(p)*cos(t))^2 + (y - r*sin(p)*sin(t))^2
    dfdr = derivative(f, r)
    print dfdr
    dr = solve(dfdr, r)[0].rhs()
    print dr.simplify()
    # ii = integral(f, t, 0, 2*pi)
    # print ii
    # oi = integral(ii, p, 0, pi)
    # print oi
