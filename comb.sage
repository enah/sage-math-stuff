def plot_to_n(n):
    plot = []
    prev = 1
    for i in range(1,n):
        curr = binomial(i*10, i)
        print(str(i) + "," + str((curr).n()))
        plot.append((i,curr))
        prev = curr
    show(points(plot), scale="semilogy")
