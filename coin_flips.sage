def f(a):
    return random() > a

def ft(a):
    count = 0
    for i in range(1000):
    	count += f(a)
    return count

def main():
    biases = (0.9, 0.6, 0.5, 0.4, 0.3)
    plot = []
    for bias in biases:
    	l = [ft(bias) for i in range(1000)]
	l.sort()
	plot.append((log(bias*(1-bias)), log(l[750]-l[250])))
    show(points(plot))
