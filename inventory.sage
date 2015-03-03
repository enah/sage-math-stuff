# July 2014

# defines the sum of two functions g and h
def add_func(g, h):
    def f(x):
    	return g(x) + h(x)
    return f

# cost_func: a function of u (inventory control) that gives back cost
# storage_func: a function of theoretical x (can be negative) that gives back cost
# final_func: a function of final x that gives back cost
# demand_dist: a list d such that d[outcome] = probability for demand per time-step
# max_stock: maximum x at any time-step
# init: initial stock (x)
# num_steps: time horizon
# store does not hold negative stock: extra demand is lost
def inventory_control(cost_func, storage_func, final_func, demand_dist, max_stock, init, num_steps):
    cache = {}
    def expected(func, stock):
        return sum(demand_dist[i]*func(stock - i) for i in range(0, len(demand_dist)))
    # there is an old_func associated to each n
    def new_func(old_func, n):
    	def nf(x):
	    if x < 0:
	       x = 0
            if (n, x) in cache:
                return cache[(n, x)]
	    best_cost = +Infinity
	    best_u = 0
            # find the best u, given this x
	    for u in range(0, max_stock - x + 1):
	    	cost = cost_func(u) + expected(add_func(old_func, storage_func), x + u)
                # cost = expected(old_func, x + u)
		if cost < best_cost:
		   best_cost = cost
		   best_u = u

            cache[(n, x)] = best_u
	    return best_cost
	return nf
    def helper(f, n):
    	if n == 0:
	    return f(init)
	return helper(new_func(f, n), n - 1)
    return helper(final_func, num_steps), cache

def main():

    # this works well
    # print inventory_control(lambda u: u, lambda x: x*x, lambda x: 0, [0.1, 0.7, 0.2], 2, 0, 9) # cutoff at 1
    # print inventory_control(lambda u: 1/(u+1), lambda x: x*x, lambda x: x, [0.1, 0.7, 0.2], 2, 0, 3) # cutoff at 1

    # print inventory_control(lambda u: u, lambda x: x*x, lambda x: 0, [0.5, 0.1, 0.1, 0.3], 2, 0, 3) # cutoff at 1
    # print inventory_control(lambda u: u, lambda x: x*x, lambda x: 0, [0.2, 0.1, 0.1, 0.4, 0.1], 5, 0, 3) # cutoff at 2

    cost, steps = inventory_control(lambda u: 0 if u == 0 else 1, lambda x: -x if x < 0 else 0, lambda x: x*x, [0, 1], 3, 0, 3)
    print cost
    return steps
