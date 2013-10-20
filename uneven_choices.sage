def unbalance_two(n):
    plot = []
    for i in range(1,n):
        plot.append((i,1/(1==x+x^i).find_root(0,1)))
    show(points(plot))
    
def unbalance_two_small():
    plot = []
    for i in range(1,6):
        plot.append((i*0.2,1/((1==x+x^(i*0.2)).find_root(0,10))))
    show(points(plot))
    
def unbalance_two_even(n):
    plot = []
    for i in range(1,n):
        plot.append((i,1/(1==x^i+x^(n-i)).find_root(0,1)))
    show(points(plot))
    
def unbalance_two_even_two(n):
    plot = []
    for i in range(1,n):
        plot.append((i,1/(1==x^(i*2/n)+x^((n-i)*2/n)).find_root(0,1)))
    show(points(plot))
