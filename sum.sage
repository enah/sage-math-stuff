# CS70 fa14 hw1

def main(up_to=30):
    plot = [(1,1/2),(2,5/6),(3,1)]
    for n in range(4, up_to):
    	onebefore=plot[n-2][1]
	twobefore=plot[n-3][1]
    	plot.append((n, onebefore + (onebefore-twobefore)*(twobefore-plot[n-4][1])))
    print(plot[up_to-2])
    show(points(plot))
    