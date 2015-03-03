
def line(k):
    # do better by making computation recursive?
    # caching the binomials?
    return sum(binomial(k,i)*((-1)^i)/(2*i+1) for i in xrange(k+1))

def listlines(n):
    return [line(k) for k in xrange(n)]

def sine(k):
    return 

def listformula(n):
    formula = [1]
    for i in range(2, n+1):
        formula.append(formula[i-2]*(2*i-2)/(2*i-1))
    return formula

def plotlines(n):
    plot = zip(range(n+1),listformula(n+1))
    show(points(plot))
