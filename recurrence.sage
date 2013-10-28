
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
    if n <= 0:
        return 1
    return func(n-2) + func(n-4) + func(n-5) + func(n-7) + func(n-8) + func(n-10)
    
def plot_recur(m):
    p = []
    for i in range(1, m):
        p.append((i, func(i)))
    eq = 1 == x^2 + x^4 + x^5 + x^7 + x^8 + x^10
    #g = plot((2^(1/(eq.find_root(0,1))))^x, (x, 0, m)) 
    show(points(p) + plot((1/eq.find_root(0,1))^x, (x, 0, m)), scale="semilogy")
