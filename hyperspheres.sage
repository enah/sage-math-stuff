# August 2014
# November 2014: Plane of two lines


gaussian = RealDistribution('gaussian', 1)

def generate_vector(n):
    return vector(gaussian.get_random_element() for _ in range(n)).normalized()
    
def generate_point(n):
    return point(generate_vector(n))

def return_points(m, n):
    return sum(generate_point(m) for _ in range(n))

def circle_points(n):
    return return_points(2, n)

def sphere_points(n):
    return return_points(3, n)

# projection of 4-dimensional vector onto plane
def fourdproject2():
    v = generate_vector(4)
    return sqrt(v[0]**2 + v[1]**2)

# Distance squared after controlling along a plane
    
# actually you don't need this
def generate_z_positve_vector(): # this is the positive-facing normal
    v = generate_vector(3)
    v[2] = abs(v[2])
    return v

def get_cos2():
    return generate_vector(3)[2]**2

def get_avg(f, n):
    avg = 0
    for _ in range(n):
        avg += f()/n
    return avg

# Plane of two lines vs. plane from line: 3 dimensions

def find_angle(v):
    # find angle of vector from up axis
    return arccos(v[2]) # get last element, arccos

def two_lines():
    cross = generate_vector(3).cross_product(generate_vector(3)).normalized()
    angle = find_angle(cross)
    # if angle > pi/2:
    #     return pi - angle
    return angle

def one_line():
    angle = find_angle(generate_vector(3))
    return abs(pi/2 - angle)

def natural():
    angle = find_angle(generate_vector(3))
    # if angle > pi/2:
    #     return pi - angle
    return angle

# create a histogram function
def histogram(f, k):
    angles = [f() for _ in range(k)]
    stats.TimeSeries(angles).plot_histogram(normalize=False).show()

def two_lines_histogram(k):
    histogram(two_lines, k)

def one_line_histogram(k):
    histogram(one_line, k)

def main():
    # show(sphere_points(1000))
    # two_lines_histogram(10000)
    # one_line_histogram(1000)
    # two_lines_histogram(1000)
    # histogram(natural, 10000)
    histogram(two_lines, 10000)
    histogram(natural, 10000)
