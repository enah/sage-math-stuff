Gaussian = RealDistribution('gaussian', 1)

def rand_vec(n):
    vec = vector([Gaussian.get_random_element() for _ in range(n)])
    return vec.normalized()

def sample(k, n):
    s = 0
    for _ in range(k):
        s += abs(rand_vec(n)[0])
    return s/k

def phi_angle(k):
    plot = []
    for _ in range(k):
        v = rand_vec(3)
        phi = arcsin(v[2]^2/sqrt(v[0]^2 + v[1]^2))
        plot.append(phi)
    bar_chart(plot)

    
