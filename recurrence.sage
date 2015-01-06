
def memo(f):
    cache = dict()
    def wrapped(*args):
        t = tuple(args)
        if t not in cache:
            cache[t] = f(*args)
        return cache[t]
    return wrapped
    
@memo
def func(n):
    #if n < 0:
    #    return 0
    if n <= 0:
        return 1
    return func(n-2) + func(n-4) + func(n-5) + func(n-7) + func(n-8) + func(n-10)
    
def plot_recur(m):
    p = []
    for i in range(1, m):
        p.append((i, func(i)))
    eq = 1 == x^2 + x^4 + x^5 + x^7 + x^8 + x^10
    t = text("Less than 0 means 1", (m/2,m))
    g = points(p) + plot((1/eq.find_root(0,1))^x, (x, 0, m)) + t
    #show(g, scale="semilogy")
    g.save("recurr1.png", scale="semilogy")
    
@memo
def mut_a(n):
    if n < 0:
        return 0
    if n == 0:
        return 1
    return mut_b(n-1)
    
@memo
def mut_b(n):
    if n < 0:
        return 0
    if n == 0:
        return 1
    return mut_a(n-1) + mut_b(n-1)        

@memo
def mut_c(n):
    if n < 0:
        return 0
    if n == 0:
        return 1
    return mut_c(n-1) + mut_d(n-1) 
    
@memo
def mut_d(n):
    if n < 0:
        return 0
    if n == 0:
        return 1
    return mut_c(n-1) + mut_d(n-1) 
    
def plot_mut(m):
    p = []
    d = []
    for i in range(1, m):
        p.append((i, mut_c(i)))
        d.append((i, mut_a(i)))
    g = points(p, rgbcolor=hue(0)) + points(d, rgbcolor=hue(0.8))
    show(g, scale="semilogy")
    #g.save("recurr1.png", scale="semilogy")

@memo
def golden_ratio(n):
    if n < 0:
       return 0
    if n == 0:
       return 1
    return golden_ratio(n-1) + golden_ratio(n-2)

def plot_gr(m):
    p = []
    for i in range(0, m):
    	p.append((i, golden_ratio(i)))
    g = points(p)
    show(g, scale="semilogy")
#    g.save("grlog7.png", scale="semilogy")

# you know, a helper function - a function that returns a function - would be really nice here