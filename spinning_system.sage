def ss(n):
    var('x,y,u,t')

    def extract(cost_to_go):
        return cost_to_go.coeff(x, 2) + cost_to_go.coeff(y, 2)

    def helper(cost_to_go, i):
        if i == 0:
            return []
        # figure out how to replace in a symbolic expression
        # get cost_to_go as a function of x, u, y, t
        cost_to_go = cost_to_go.subs(x=x+u*cos(t), y=y+u*sin(t))
        d = cost_to_go.derivative(u)
        best_u = d.roots(explicit_solutions=False)[0][0]
        # minimize for u
        cost_to_go = cost_to_go.subs(u=best_u).full_simplify()
        # average over t, 0 to 2*pi
        print cost_to_go
        cost_to_go = cost_to_go.integral(t, 0, 2*pi, 'mathematica_free')
        return helper(cost_to_go, i - 1) + [extract(cost_to_go)]

    return helper(x^2+y^2, n)
