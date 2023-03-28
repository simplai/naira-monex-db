import statistics

def forecast(x, known_y, new_x):
    x_mean = statistics.mean(x)
    y_mean = statistics.mean(known_y)
    x_deviation = [i - x_mean for i in x]
    y_deviation = [i - y_mean for i in known_y]
    x_y_deviation = [x_deviation[i] * y_deviation[i] for i in range(len(x))]
    x_squared_deviation = [i**2 for i in x_deviation]
    slope = sum(x_y_deviation) / sum(x_squared_deviation)
    intercept = y_mean - slope * x_mean
    return intercept + slope * new_x