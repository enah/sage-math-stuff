# plots the elements of a 2-by-2 matrix to the power of n, and its greater eigenvalue to the power of n

def power_matrix_plot(m, up_to=1000):
	greater_eigenvalue = max(m.eigenvalues())
	plots = tuple([] for i in range(5))
	multiplied = matrix.identity(2)
	num = 1
	for n in range(up_to):
		plots[0].append((n, multiplied[0][0]))
		plots[1].append((n, multiplied[0][1]))
		plots[2].append((n, multiplied[1][0]))
		plots[3].append((n, multiplied[1][1]))
		plots[4].append((n, num))
		multiplied *= m
		num *= greater_eigenvalue
	plottable = (points(plots[i], rgbcolor=hue(i*0.2)) for i in range(5))
	show(sum(plottable), scale="semilogy")

def main():
	mat = matrix([[1,2],[-1,5]])
	power_matrix_plot(mat, 100)

def colors():
	plottable = (point([0,i], rgbcolor=hue(i*0.2)) for i in range(5))
	show(sum(plottable))
